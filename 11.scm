;;; -*- buffer-read-only:t -*-

(load "10.scm")

(define two-in-a-row?
  (lambda (lat)
    "two consecutive identical atoms"
    (cond ((or (null? lat)
	       (null? (cdr lat)))
	   false)
	  ((eq? (car lat)
		(car (cdr lat)))
	   true)
	  (else (two-in-a-row? (cdr lat))))))

;;; (two-in-a-row? '(a a))

(define is-first?
  (lambda (a lat)
    (cond ((null? lat) false)
	  (else (eq? (car lat) a)))))

(define two-in-a-row?
  (lambda (lat)
    "other version"
    (cond ((null? lat) false)
	  (else
	   (or (is-first? (car lat) (cdr lat))
	       (two-in-a-row? (cdr lat)))))))

;;; (two-in-a-row? '(a a))

(define is-first-b?
  (lambda (a lat)
    (cond ((null? lat) false)
	  (else (or (eq? (car lat) a)
		    (two-in-a-row? lat))))))

(define two-in-a-row?
  (lambda (lat)
    "yet other version"
    (cond ((null? lat) false)
	  (else
	   (is-first-b? (car lat) (cdr lat))))))

;;; (two-in-a-row? '(b a b a a))

(define two-in-a-row-b?
  (lambda (preceding lat)
    (cond ((null? lat)
	   false)
	  (else
	   (or (eq? (car lat) preceding)
	       (two-in-a-row-b? (car lat) (cdr lat)))))))

(define two-in-a-row?
  (lambda (lat)
    "yet other version"
    (cond ((null? lat) false)
	  (else
	   (two-in-a-row-b? (car lat) (cdr lat))))))

;;; (two-in-a-row? '(b a b b a b a))

(define (sum-of-prefixes-b sonssf tup)
  "sonssf means `sum of numbers seen so far`"
  (cond ((null? tup) (cons sonssf '()))
	(else
	 (cons sonssf
	       (sum-of-prefixes-b
		(o+ sonssf
		    (car tup))
		(cdr tup))))))

(define (sum-of-prefixes tup)
  "first variant"
  (cond ((null? tup) ())
	(else
	 (sum-of-prefixes-b (car tup)
			    (cdr tup)))))

;;; (sum-of-prefixes '(1 1 1))

(define (sum-of-prefixes-b sonssf tup)
  "other variant"
  (cond ((null? tup) '())
	(else
	 (cons (o+ sonssf
		   (car tup))
	       (sum-of-prefixes-b
		(o+ sonssf
		   (car tup))
		(cdr tup))))))

(define (sum-of-prefixes tup)
  "other variant"
  (cond ((null? tup) ())
	(else
	 (sum-of-prefixes-b 0
			    tup))))

;;; (sum-of-prefixes '(1 1 1))

;;; (pick 2 '(a b c))

(define (scramble-b tup rev-pre)
  (cond ((null? tup) '())
	(else
	 (cons (pick (car tup)
		     (cons (car tup)
			   rev-pre))
	       (scramble-b (cdr tup)
			   (cons (car tup)
				 rev-pre))))))

(define scramble
  (lambda (tup)
    (scramble-b tup '())))

;;; (scramble '(1 2 3))

;;; (scramble '(1 1 1 3 4 2))
