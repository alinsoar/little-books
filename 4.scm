;;; -*- buffer-read-only:t -*-

(load "3.scm")

(define (add1 x)
  (+ x 1))

(define (sub1 x)
  (- x 1))

;;; (add1 10)
;;; (sub1 10)

(define (o+ x y)
  "add 2 numbers"
  (cond ((zero? y) x)
	(else (o+ (add1 x)
		  (sub1 y)))))

;;; (o+ 10 20)

(define (o+ x y)
  "other variant"
  (cond ((zero? y) x)
	(else (add1 (o+ x
			(sub1 y))))))

;;; (o+ 10 20)

(define (o- x y)
  "subtract 2 numbers"
  (cond ((zero? y) x)
	(else (o- (sub1 x)
		  (sub1 y)))))

;;; (o- 10 10)

(define (o- x y)
  "subtract 2 numbers"
  (cond ((zero? y) x)
	(else (sub1 (o- x
			(sub1 y))))))

;;; (o- 10 9)

(define (addtup tup)
  "add all numbers in a tuple"
  (cond ((null? tup) 0)
	(else (o+ (car tup)
		   (addtup (cdr tup))))))

;;; (addtup '(1 2 3 4))

(define (o* x y)
  "multiply 2 numbers"
  (cond ((zero? y) 0)
	(else (o+ x
		   (o* x (sub1 y))))))

;;; (o* 12 3)

(define (tup+ tup1 tup2)
  "build a new tuple with nth position = nth tup1 + nth tup2"
  (cond ((and (null? tup1)
	      (null? tup2) '()))
	((null? tup1)
	 (cons (car tup2)
	       (tup+ '()
		     (cdr tup2))))
	((null? tup2)
	 (cons (car tup1)
	       (tup+ (cdr tup1)
		     '())))
	(else (cons (o+ (car tup1)
			 (car tup2))
		    (tup+ (cdr tup1)
			  (cdr tup2))))))

;;; (tup+ '(2 3 3 10 0 0 1) '(4 6 0 10))

(define (tup+ tup1 tup2)
  "other variant"
  (cond ((and (null? tup1)
	      (null? tup2) '()))
	((null? tup1)
	 tup2)
	((null? tup2)
	 tup1)
	(else (cons (o+ (car tup1)
			 (car tup2))
		    (tup+ (cdr tup1)
			  (cdr tup2))))))

;;; (tup+ '(1 2 3 4 5 6 7 8 9) '(4 6 0 10))

(define (o> x y)
  "`x` is greater than `y` ?"
  (cond ((zero? x) false)
	((zero? y) true)
	(else (o> (sub1 x)
		  (sub1 y)))))

;;; (o> 3 3)

(define (o< x y)
  "`x` is smaller than `y` ?"
  (cond ((zero? y) false)
	((zero? x) true)
	(else (o< (sub1 x)
		  (sub1 y)))))

;;; (o< 2 3)

(define (o= x y)
  "equality predicate for numbers"
  (cond ((and (zero? x)
	      (zero? y))
	 true)
	((or (zero? y)
	     (zero? x))
	 false)
	(else (o= (sub1 x)
		  (sub1 y)))))

;;; (o= 2 2)

(define (o= x y)
  "other variant"
  (cond ((zero? x) (zero? y))
	((zero? y) false)
	(else (o= (sub1 x)
		  (sub1 y)))))

;;; (o= 3 2)

(define (o= x y)
  "other variant"
  (cond ((or (o> x y)
	     (o< x y))
	 false)
	(else true)))

;;; (o= 2 3)

(define (o^ x y)
  "exponential"
  (cond ((zero? y) 1)
	(else (o* x
		  (o^ x
		      (sub1 y))))))

;;; (o^ 10 2)

(define (o/ x y)
  "quotient of x/y"
  (cond ((< x y) 0)
	(else (add1 (o/ (o- x y)
			y)))))

;;; (o/ 15 4)

(define (len lat)
  "number of s-exp in a list"
  (cond ((null? lat) 0)
	(else (add1 (len (cdr lat))))))

;;; (len '(1 2 3 4 5 6))

(define (pick n lat)
  "pick the nth number of a list"
  (cond ((zero? (sub1 n)) (car lat))
	(else (pick (sub1 n) (cdr lat)))))

;;; (pick 1 '( 0 1 2 3 4 5 6 ))

(define (rempick n lat)
  "remove nth element from a list of s-exp"
  (cond ((zero? (sub1 n)) (cdr lat))
	(else (cons (car lat)
		    (rempick (sub1 n)
			     (cdr lat))))))

;;; (rempick 3 '(1 2 3 4))

(define (no-nums lat)
  "remove all numbers from a list"
  (cond ((null? lat) '())
	((number? (car lat))
	 (no-nums (cdr lat)))
	(else (cons (car lat)
		    (no-nums (cdr lat))))))

;;; (no-nums '(a b c 1 2 3 d))

(define (all-nums lat)
  "extracts all numbers from a list and builds a tuple with them"
  (cond ((null? lat) '())
	((number? (car lat))
	 (cons (car lat)
	       (all-nums (cdr lat))))
	(else (all-nums (cdr lat)))))

;;; (all-nums '(a 0 b c 1 2 3 d 4))

(define (eqan? a1 a2)
  "equality for atoms and numbers"
  (cond ((and (number? a1)
	      (number? a2))
	 (o= a1 a2))
	((or (number? a1)
	     (number? a2))
	 false)
	(else (eq? a1 a2))))

;;; (eqan? 3 2)
;;; (eqan? 'a 'x)

(define (occur a lat)
  "number of occurrences of an atom in a list"
  (cond ((null? lat)
	 0)
	((eq? a (car lat))
	 (add1 (occur a (cdr lat))))
	(else (occur a (cdr lat)))))

;;; (occur 'a '(x b c a a a y))

(define (one? n)
  "equality with one"
  (zero? (sub1 n)))

;;; (one? 10)

(define (one? n)
  "other variant"
  (= n 1))

;;; (one? 1)

(define (rempick n lat)
  "remove nth element, other variant"
  (cond ((one? n) (cdr lat))
	(else (cons (car lat)
		    (rempick (sub1 n)
			     (cdr lat))))))

;;; (rempick 3 '(1 2 3 4))
