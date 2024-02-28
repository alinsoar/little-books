;;; -*- buffer-read-only:t -*-

(load "9.scm")

(define new-entry build)

(define (lookup-in-entry name entry entry-f)
  (lookup-in-entry-help
   name
   (first entry)
   (second entry)
   entry-f ))

(define (lookup-in-entry-help name names values entry-f)
  (cond ((null? names)
	 (entry-f name))
	((eq? (car names) name)
	 (car values))
	(else (lookup-in-entry-help
	       name
	       (cdr names)
	       (cdr values)
	       entry-f))))

;; (lookup-in-entry 40
;; 		 (new-entry '(1 2 3) '(a b c))
;; 		 (lambda (x) x))

(define extend-table cons)

(define (lookup-in-table name table table-f)
  (cond ((null? table)
	 (table-f name))
	(else (lookup-in-entry
	       name
	       (car table)
	       (lambda (name)
		 (lookup-in-table
		  name
		  (cdr table)
		  table-f))))))

;; (lookup-in-table
;;  'i '(((a b c) (1 2 3))
;;       ((d e) (4 5))
;;       ((f) (6))
;;       ((g h i j) (7 8 9 10))
;;       )
;;  (lambda (x) x))

(define expression-to-action
  (lambda (e)
    (cond ((atom? e)
	   (atom-to-action e))
	  (else (list-to-action e)))))

(define (atom-to-action e)
  (cond ((or (number? e)
	     (eq? e true)
	     (eq? e false)
	     (eq? e 'cons)
	     (eq? e 'car)
	     (eq? e 'cdr)
	     (eq? e 'null?)
	     (eq? e 'eq?)
	     (eq? e 'atom?)
	     (eq? e 'zero?)
	     (eq? e 'add1)
	     (eq? e 'sub1)
	     (eq? e 'number?))
	 *const)
	(else
	 *identifier)))

(define (list-to-action e)
  (cond ((atom? (car e))
	 (cond ((eq? (car e) 'quote)  *quote)
	       ((eq? (car e) 'lambda) *lambda)
	       ((eq? (car e) 'cond)   *cond)
	       (else                  *application)))
	(else *application)))

(define (value e)
  ;; this is an interpreter
  (meaning e '()))

(define (meaning e environment)
  ((expression-to-action e) e environment))

(define *const
  (lambda (e table)
    (cond ((number? e) e)
	  ((eq? e true) true)
	  ((eq? e false) false)
	  (else (build 'primitive e)))))

;;; (value 'car)
;;; (value 5)

(define text-of second)

(define *quote
  (lambda (e table)
    (text-of e)))

(define initial-table
  (lambda (name)
    ;; generates an error
    (car '())))

(define *identifier
  (lambda (e table)
    (lookup-in-table e table initial-table)))

(define *lambda
  (lambda (e table)
    (build 'non-primitive
	   (cons table (cdr e)))))

;;; (value '(lambda (x) x))

;;; (value '(lambda (x) (cons x y)))

;; (meaning '(lambda (x) (cons x y))
;; 	 '(((y z) ((8) 9))
;; 	   ))

(define table-of first)
(define formals-of second)
(define body-of third)

(define evcon
  (lambda (lines table)
    (cond ((else? (question-of (car lines)))
	   (meaning (answer-of (car lines)) table))
	  ((meaning (question-of (car lines)) table)
	   (meaning (answer-of (car lines)) table))
	  (else (evcon (cdr lines) table)))))

(define else?
  (lambda (x)
    (and (atom? x)
	 (eq? x 'else))))

(define question-of first)

(define answer-of second)

(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e) table)))

(define cond-lines-of cdr)

;; (*cond '(cond (coffee klatsch)
;; 	      (else party))
;;        '(((coffee) (#f)) ;here scheme does not evaluate the `false`
;; 	 ((klatsch party) (5 (6)))
;; 	 ))

(define evlis
  (lambda (args table)
    (cond ((null? args) '())
	  (else (cons (meaning (car args) table)
		      (evlis (cdr args) table))))))

(define *application
  (lambda (e table)
    (apply
     (meaning (function-of e) table)
     (evlis (arguments-of e) table))))

(define function-of car)
(define arguments-of cdr)

(define primitive?
  (lambda (l)
    (eq? (first l) 'primitive)))

(define non-primitive?
  (lambda (l)
    (eq? (first l) 'non-primitive)))

(define apply
  (lambda (fun vals)
    (cond ((primitive? fun)
	   (apply-primitive (second fun) vals))
	  ((non-primitive? fun)
	   (apply-closure (second fun) vals)))))

(define apply-primitive
  (lambda (name vals)
    (cond ((eq? name 'cons)    (cons  (first vals) (second vals)))
	  ((eq? name 'car)     (car   (first vals)))
	  ((eq? name 'cdr)     (cdr   (first vals)))
	  ((eq? name 'null?)   (null? (first vals)))
	  ((eq? name 'eq?)     (eq? (first vals) (second vals)))
	  ((eq? name 'atom?)   (:atom? (first vals)))
	  ((eq? name 'zero?)   (zero? (first vals)))
	  ((eq? name 'add1)    (add1 (first vals)))
	  ((eq? name 'sub1)    (sub1 (first vals)))
	  ((eq? name 'number?) (number? (first vals))))))

(define :atom?
  (lambda (x)
    (cond ((atom? x) true)
	  ((null? x) false)
	  ((eq? (car x) 'primitive) true)
	  ((eq? (car x) 'non-primitive) true)
	  (else false))))

(define apply-closure
  (lambda (closure vals)
    (meaning (body-of closure)
	     (extend-table (new-entry (formals-of closure)
				      vals)
			   (table-of closure)))))

;; (meaning '(cons z x)
;; 	 '(((x y) ((a b c) (d e f)))
;; 	   ((u v w) (1 2 3))
;; 	   ((x y z) (4 5 6))
;; 	   ))


;; the `length` computation using the interpreter `value`
(value '(((lambda (k)
	    ((lambda (f)
	       (f f))
	     (lambda (f)
	       (k (lambda (x)
		    ((f f) x))))))
	  (lambda (length)
	    (lambda (l)
	      (cond ((null? l) 0)
		    (else (add1 (length (cdr l)))))))
	  )
	 '(a b c)))
