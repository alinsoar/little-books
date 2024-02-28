;;; -*- buffer-read-only:t -*-

(load "5.scm")

(define (numbered? aexp)
  "an expression that contains only numbers"
  (cond ((atom? aexp)
	 (number? aexp))
	((eq? '+ (pick 2 aexp))
	 (and (numbered? (car aexp))
	      (numbered? (pick 3 aexp))))
	((eq? '* (pick 2 aexp))
	 (and (numbered? (car aexp))
	      (numbered? (pick 3 aexp))))
	((eq? '^ (pick 2 aexp))
	 (and (numbered? (car aexp))
	      (numbered? (pick 3 aexp))))))

;;; (numbered? '(1 + (2 * 2)))

(define (numbered? aexp)
  "other variant"
  (cond ((atom? aexp)
	 (number? aexp))
	(else
	 ;; we already know that aexp is a valid expression
	 (and (numbered? (car aexp))
	      (numbered? (pick 3 aexp))))))

;;; (numbered? '(1 + (2 * a)))

(define (value nexp)
  "compute the value of a numbered expression. infix notation"
  (cond ((atom? nexp)
	 nexp)
	((eq? '+ (pick 2 nexp))
	 (o+ (value (car nexp))
	     (value (pick 3 nexp))))
	((eq? '* (pick 2 nexp))
	 (o* (value (car nexp))
	     (value (pick 3 nexp))))
	((eq? '^ (pick 2 nexp))
	 (o^ (value (car nexp))
	     (value (pick 3 nexp))))
	(else "never reached")))

;; (value '(((10 ^ 2)
;; 	  *
;; 	  (10 + 100))
;; 	 +
;; 	 3))

(define (1st-sub-exp aexp)
  (pick 2 aexp))

(define (2nd-sub-exp aexp)
  (pick 3 aexp))

(define (operator aexp)
  (car aexp))

(define (value nexp)
  "compute the value of a numbered expression. prefix notation"
  (cond ((atom? nexp)
	 nexp)
	((eq? '+ (operator nexp))
	 (o+ (value (1st-sub-exp nexp))
	     (value (2nd-sub-exp nexp))))
	((eq? '* (operator nexp))
	 (o* (value (1st-sub-exp nexp))
	     (value (2nd-sub-exp nexp))))
	((eq? '^ (operator nexp))
	 (o^ (value (1st-sub-exp nexp))
	     (value (2nd-sub-exp nexp))))
	(else "never reached")))

;; (value '(+
;; 	 (*
;; 	  (^ 10 2)
;; 	  (+ 10 100))
;; 	 3))

(define (sero? n)
  "numbers represeted as lists (() () () ...)"
  (null? n))

;;; (sero? '())

(define (edd1 n)
  "add 1"
  (cons '() n))

;;; (edd1 '(() ()))

(define (zub1 n)
  "subtract 1 in list representation of naturals"
  (cdr n))

;;; (zub1 '(() ()))

(define (Op+ n m)
  (cond ((sero? m)
	 n)
	(else (edd1 (Op+ n
			 (zub1 m))))))

;;; (Op+ '(() ())
;;;     '(() () ()))
