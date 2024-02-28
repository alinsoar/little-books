;;; -*- buffer-read-only:t -*-

(load "15.scm")

(define sweet-tooth
  (lambda (food)
    (cons food
	  (cons 'cake
		'()))))

(define last 'angelfood)

;;; (sweet-tooth 'chocolate)

;;; last

;;; (sweet-tooth 'fruit)

(define sweet-toothL
  (lambda (food)
    (set! last food)
    (cons food
	  (cons 'cake
		'()))))

;;; (sweet-toothL 'chocolate)

;;; last

;;; (sweet-toothL 'fruit)

;;; last

(define ingredients '())

(define sweet-toothR
  (lambda (food)
    (set! ingredients (cons food ingredients))
    (cons food
	  (cons 'cake
		'()))))

;;; (sweet-toothR 'chocolate)

;;; ingredients

;;; (sweet-toothR 'fruit)

(define deep
  (lambda (n)
    (cond ((zero? n) 'pizza)
	  (else (cons (deep (sub1 n))
		      '())))))

;;; (deep 10)

(define Ns '())

(define deepR
  (lambda (n)
    (set! Ns (cons n Ns))
    (deep n)))

;;; (deepR 10)

(define find
  (lambda (n Ns Rs)
    (letrec ((A (lambda (ns rs)
		  (cond ((o= (car ns) n)
			 (car rs))
			(else (A (cdr ns)
				 (cdr rs)))))))
      (A Ns Rs))))

;; (find 5
;;       '(3 5 3)
;;       '((((pizza)))
;; 	(((((pizza)))))
;; 	(((pizza)))))

(define deepM
  (lambda (n)
    (if (member? n Ns)
	(find n Ns Rs)
	(deep n))))

(define Ns '())
(define Rs '())

(define deepM
  (lambda (n)
    (if (member? n Ns)
	(find n Ns Rs)
	(let ((result (deep n)))
	  (set! Rs (cons result Rs))
	  (set! Ns (cons n Ns))
	  result))))

;;; (deepM 6)

(define deep
  (lambda (n)
    (cond ((zero? n) 'pizza)
	  (else (cons (deepM (sub1 n))
		      '())))))

;;; (deep 9)

;;; Ns

;;; Rs

(define deepM
  (let ((Ns '())
	(Rs '()))
    (lambda (n)
      (if (member? n Ns)
	  (find n Ns Rs)
	  (let ((result (deep n)))
	    (set! Rs (cons result Rs))
	    (set! Ns (cons n Ns))
	    result)))))

;;; (deepM 16)

;;; Ns

;;; Rs

;;; '(find 3 '() '())			; no sense now

(define find
  (lambda (n Ns Rs)
    (letrec ((A (lambda (ns rs)
		  (cond ((null? ns)
			 false)
			((o= (car ns) n)
			 (car rs))
			(else (A (cdr ns)
				 (cdr rs)))))))
      (A Ns Rs))))

;;; (find 3 '() '())

(define deepM
  (let ((Ns '())
	(Rs '()))
    (lambda (n)
      (if (atom? (find n Ns Rs))
	  (let ((result (deep n)))
	    (set! Rs (cons result Rs))
	    (set! Ns (cons n Ns))
	    result)
	  (find n Ns Rs)))))

(define deepM
  (let ((Ns '())
	(Rs '()))
    (lambda (n)
      (let ((exists (find n Ns Rs)))
      (if (atom? exists)
	  (let ((result (deep n)))
	    (set! Rs (cons result Rs))
	    (set! Ns (cons n Ns))
	    result)
	  exists)))))

;;; (find 3 '() '())

;;; (deepM 16)

(define length
  (lambda (l)
    (cond ((null? l) 0)
	  (else (add1 (length (cdr l)))))))

(define length
  (lambda (l) 0))

;; (set! length
;;       (lambda (l)
;; 	(cond ((null? l) 0)
;; 	      (else (add1 (length (cdr l)))))))

(define length
  (let ((h (lambda (l) 0)))
    (set! h
	  (lambda (l)
	    (cond ((null? l) 0)
		  (else (add1 (h (cdr l)))))))
    h))

;;; (length '(1 2 3))

(define h1
  (lambda (l)
    0))

(define length
  (let ()
    (set! h1
	  (lambda (l)
	    (cond ((null? l) 0)
		  (else (add1 (h1 (cdr l)))))))
    h1))

;;; (length '(1 2 3))

(define h1
  (lambda (l)
    (cond ((null? l) 0)
	  (else (add1 (h1 (cdr l)))))))

(define length
  (let ()
    h1))

;;; (length '(1 2 3))

(define length
  (lambda (l)
    (cond ((null? l) 0)
	  (else (add1 (h1 (cdr l)))))))

;;; (length '(1 2 3))

(define length				;again
  (let ((h (lambda (l) 0)))
    (set! h
	  (lambda (l)
	    (cond ((null? l) 0)
		  (else (add1 (h (cdr l)))))))
    h))

(define L
  (lambda (length)
    (lambda (l)
      (cond ((null? l) 0)
	    (else (add1 (length (cdr l))))))))

(define length
  (let ((h (lambda (l) 0)))
    (set! h
	  (L (lambda (arg)
	       (h arg))))
    h))

;;; (length '(1 2 3))

(define L0				; (L (lambda (arg) (h arg)))
  (lambda (l)
    (cond ((null? l) 0)
	  (else (add1 ((lambda (arg) (h arg))
		       (cdr l)))))))

(define Y!
  (named-lambda (Y! L)
    (let ((h (named-lambda (Y!-h l) '())))
      (set! h
	    (L (named-lambda (Y!-L arg)
		 (h arg))))
      h)))

(define Y-bang
  (named-lambda (Y-bang f)
    (letrec ((h (f (named-lambda (Y-f arg)
		     (h arg)))))
      h)))

(define length (Y! L))

(define length1 (Y-bang L))

"this is the *applicative imperative Y combinator*"
(length1 '(a b c d))
(length1 (make-list 100))
(length '(1 2 3))
(length (make-list 100))


(define D
  (lambda (depth*)
    (lambda (s)
      (cond ((null? s) 1)
	    ((atom? (car s))
	     (depth* (cdr s)))
	    (else (max (depth* (cdr s))
		       (add1 (depth* (car s)))))))))

(define depth* (Y! D))

(string-append "depth="
               (number->string (depth* '((()) (((())))))))

(define (debug nl . a)
  (map (lambda (m) (display m) (display "   "))
       a)
  (and nl (newline)))

(define biz
  ((named-lambda (BIZZ x y)
     (debug true "enter BIZZARE")
     (named-lambda (BIZ f)
       (set! x (add1 x))
       (debug
        false
        ;;'newline
        "\n"
        "X:" x
        "....")
       (letrec ((proc (named-lambda (PROC! a)
                        (set! y (add1 y))
                        (debug 'newline
                               ;; "F::--" f
                               ;; "PROC!:--" proc
                               "a:--" (number->string a)
                               "x:--" (number->string x)
                               "y:--" (number->string y))
                        (cond ((o= a x) 'return:ZERO)
                              ((= 12 y) 'return:a)
                              ((= 24 y) 'return:b)
                              ((zero? (remainder y 11))
                               (string->symbol
                                (string-append "return::**"
                                               (number->string y)
                                               "**")))
                              (else (f a))))))
         (debug 'newline
                "PROC: " proc
                "F:" f
                "///")
         proc)))
   0 0))

(debug true "BIZ -->>" biz)
((Y biz) 5)
((Y! biz) 5)
((Y-bang biz) 5)
((Y! biz) 5)
((Y-bang biz) 5)
((Y biz) 5)
(debug true "BIZ -->>" biz)


'done
