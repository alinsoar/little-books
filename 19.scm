;;; -*- buffer-read-only:t -*-

(load "18.scm")

;;; (deep 6)

(define deep
  (lambda (n)
    (cond ((zero? n) 'pizza)
	  (else (cons (deep (sub1 n))
		      '())))))

(define six-layers
  (lambda (p)
    (cons
     (cons
      (cons
       (cons
	(cons
	 (cons p (quote ()))
	 (quote ()))
	(quote ()))
       (quote ()))
      (quote ()))
     (quote ()))))

(define four-layers
  (lambda (p)
    (cons
     (cons
      (cons
       (cons p (quote ()))
       (quote ()))
      (quote ()))
     (quote ()))))

(define toppings)

(define deepB
  (lambda (m)
    (cond ((zero? m)
	   (call-with-current-continuation
	    (lambda (jump)
	      (set! toppings jump)
	      'pizza)))
	  (else (cons (deepB (sub1 m))
		      '())))))

;;; (deepB 6)

;;; (six-layers 'mozarella)

;;; (toppings 'mozarella)

;; (cons (toppings 'mozarella)
;;      '())

;;; (toppings '(mozarella))

;; (cons (toppings 'cake)
;;       (cons (toppings 'cake)
;; 	    (cons (toppings 'cake)
;; 		  (cons (toppings 'cake)
;; 			(cons (toppings 'cake)
;; 			      (cons (toppings 'cake)
;; 				    (cons (toppings 'cake)
;; 					  (cons (toppings 'cake)
;; 						(cons (toppings 'cake)
;; 						      (cons (toppings 'cake)
;; 			'()))))))))))

(define deep&co
  (lambda (n k)
    (cond ((zero? n) (k 'pizza))
	  (else (deep&co (sub1 n)
			 (lambda (x)
			   (k (cons x
				    '()))))))))

;;; (deep&co 6 (lambda (x) x))

(define two-layers
  (lambda (p)
    (cons
       (cons p (quote ()))
     (quote ()))))

;;; (two-layers 'test)

(define deep&co
  (lambda (n k)
    (cond ((zero? n)
	   (let ()
	     (set! toppings k)
	     (k 'pizza)))
	  (else (deep&co (sub1 n)
			 (lambda (x)
			   (k (cons x '()))))))))

;;; (deep&co 2 (lambda (x) x))

;;; (cons (toppings 'cake) (toppings 'top))

(define two-in-a-row?
  (lambda (lat)
    (cond ((null? lat) false)
	  (else (two-in-a-row-b? (car lat)
				 (cdr lat))))))

(define two-in-a-row-b?
  (lambda (a lat)
    (cond ((null? lat) false)
	  (else (or (eq? (car lat) a)
		    (two-in-a-row-b? (car lat)
				     (cdr lat)))))))

;;; (two-in-a-row? '(a b c c))

(define two-in-a-row?
  (letrec ((W? (lambda (preceding lat)
		 (cond ((null? lat)
			false)
		       (else
			(let ((next (car lat)))
			  (or (eq? next preceding)
			      (W? next (cdr lat)))))))))
    (lambda (lat)
      (cond ((null? lat) false)
	    (else
	     (W? (car lat) (cdr lat)))))))

;;; (two-in-a-row? '(a b c x c))

(define leave)

(define walk
  (lambda (l)
    (cond ((null? l) '())
	  ((atom? (car l)) (leave (car l)))
	  (else (let ()
		  (walk (car l))
		  (walk (cdr l)))))))

(define leftmost
  (lambda (l)
    (call-with-current-continuation
     (lambda (skip)
       (letrec ((lm (lambda (l)
		      (cond ((null? l) '())
			    ((atom? (car l)) (skip (car l)))
			    (else (let ()
				    (lm (car l))
				    (lm (cdr l))))))))
	 (lm l))))))

(define start-it
  (lambda (l)
    (call-with-current-continuation
     (lambda (here)
       (set! leave here)
       (walk l)))))

;;; (start-it '((()x) a b c))

(define fill)

(define waddle
  (lambda (l)
    (cond ((null? l) '())
	  ((atom? (car l))
	   (let ()
	     (call-with-current-continuation
	      (lambda (rest)
		(set! fill rest)
		(leave (car l))))
	     (waddle (cdr l))))
	  (else (let ()
		  (waddle (car l))
		  (waddle (cdr l)))))))

(define start-it2
  (lambda (l)
    (call-with-current-continuation
     (lambda (here)
       (set! leave here)
       (waddle l)))))

;;; (start-it2 '((d) (c (c (s)))))

;;; fill

(define rest
  (lambda (x)
    (waddle '(a b c (d)))))


(define get-next
  (lambda (x)
    (call-with-current-continuation
     (lambda (here-again)
       (set! leave here-again)
       (fill 'go)))))

;;; (get-next 'go)

;;; (get-next 'go)

;;; (get-next 'go)

;;; (get-next 'go)
;;; (get-next 'go)
;;; (get-next 'go)

(define rest2
  (lambda (x)
    (waddle '(w a b c d e))))

;;; (leave '())

(define get-first
  (lambda (l)
    (call-with-current-continuation
     (lambda (here)
       (set! leave here)
       (waddle l)
       (leave '())))))

;;; (get-first '(donut a b c))
;;; (get-next 'go)
;;; (get-next 'go)
;;; (get-next 'go)
;;; (get-next 'go)
;;; (get-next 'go)

(define two-in-a-row*?
  (lambda (l)
    (let ((fst (get-first l)))
      (if (atom? fst)
	  (two-in-a-row-b*? fst)
	  false))))

(define two-in-a-row-b*?
  (lambda (a)
    (let ((n (get-next 'go)))
      (if (atom? n)
	  (or (eq? n a)
	      (two-in-a-row-b*? n))
	  false))))

;;; (two-in-a-row*? '(a b c (d x y z d) d))

(define two-in-a-row*?
  (letrec ((T? (lambda (a)
		 (let ((n (get-next 'go)))
		   (if (atom? n)
		       (or (eq? n a)
			   (T? n))
		       false))))
	   (get-next
	    (lambda (x)
	      (call-with-current-continuation
	       (lambda (here-again)
		 (set! leave here-again)
		 (fill 'go)))))
	   (fill (lambda (x) x))
	   (waddle (lambda (l)
		     (cond ((null? l) '())
			   ((atom? (car l))
			    (let ()
			      (call-with-current-continuation
			       (lambda (rest)
				 (set! fill rest)
				 (leave (car l))))
			      (waddle (cdr l))))
			   (else (let ()
				   (waddle (car l))
				   (waddle (cdr l)))))))
	   (leave (lambda (x) x)))
    (lambda (l)
      (let ((fst (call-with-current-continuation
		  (lambda (here)
		    (set! leave here)
		    (waddle l)
		    (leave '())))))
	(if (atom? fst)
	    (T? fst)
	    false)))))

;;; (two-in-a-row*? '(a b c (d x y z d) x d))


