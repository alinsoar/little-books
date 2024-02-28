;;; -*- buffer-read-only:t -*-

(load "13.scm")

(define (leftmost l)
  (cond ((null? l) '())
	((atom? (car l)) (car l))
	(else (let ((a (leftmost (car l))))
		(cond ((atom? a) a)
		      (else (leftmost (cdr l))))))))

;;; (leftmost '((() ()) a))

(define rember1*
  (lambda (a l)
    (cond ((null? l) '())
	  ((atom? (car l))
	   (cond ((eq? a (car l))
		  (cdr l))
		 (else (cons (car l)
			     (rember1* a (cdr l))))))
	  (else (cond ((eqlist? (rember1* a (car l))
				(car l))
		       (cons (car l)
			     (rember1* a (cdr l))))
		      (else (cons (rember1* a (car l))
				  (cdr l))))))))

;;; (rember1* 'a '((((c))) a b c))

;;; (eqlist? (rember1* 'a '((((c))))) '((((c)))))

(define rember1*
  (lambda (a l)
    (cond ((null? l) '())
	  ((atom? (car l))
	   (cond ((eq? a (car l))
		  (cdr l))
		 (else (cons (car l)
			     (rember1* a (cdr l))))))
	  (else
	   (let ((k (rember1* a (car l))))
	     (cond ((eqlist? k (car l))
		    (cons (car l)
			  (rember1* a (cdr l))))
		   (else (cons k (cdr l)))))))))

;;; (rember1* 'a '((((c))) a b c))

(define depth*
  (lambda (l)
    (cond ((null? l) 1)
	  ((atom? (car l))
	   (depth* (cdr l)))
	  (else (cond ((o> (depth* (cdr l))
			  (add1 (depth* (car l))))
		       (depth* (cdr l)))
		      (else
		       (add1 (depth* (car l)))))))))

;;; (depth* '((a) b (c d)))

(define depth*
  (lambda (l)
    (cond ((null? l) 1)
	  ((atom? (car l))
	   (depth* (cdr l)))
	  (else
	   (let ((d1 (depth* (car l)))
		 (d2 (depth* (cdr l))))
	     (cond ((o> d2 (add1 d1))
		       d2)
		   (else
		    (add1 d1))))))))

;;; (depth* '((a) b (c d)))

(define depth*
  (lambda (l)
    (cond ((null? l) 1)
	  ((atom? (car l))
	   (depth* (cdr l)))
	  (else
	   (let ((d1 (depth* (car l)))
		 (d2 (depth* (cdr l))))
	     (if (o> d2 (add1 d1))
		 d2
		 (add1 d1)))))))

;;; (depth* '((a) b (c ((())) d)))

(define max
  (lambda (a b)
    (if (o> a b) a b)))

(define depth*
  (lambda (l)
    (cond ((null? l) 1)
	  ((atom? (car l))
	   (depth* (cdr l)))
	  (else
	   (let ((d1 (depth* (car l)))
		 (d2 (depth* (cdr l))))
	     (max d2 (add1 d1)))))))

;;; (depth* '((a) b (c ((())) d)))

(define depth*
  (lambda (l)
    (cond ((null? l) 1)
	  ((atom? (car l))
	   (depth* (cdr l)))
	  (else (max (depth* (cdr l))
		     (add1 (depth* (car l))))))))

;;; (depth* '((a) b (c ((())) d)))

(define scramble
  (lambda (tup)
    (letrec ((s (lambda (tup rev-pre)
		  (cond ((null? tup) '())
			(else
			 (let ((rp (cons (car tup) rev-pre)))
			   (cons (pick (car tup)
				       rp)
				 (s (cdr tup) rp))))))))
      (s tup '()))))

;;; (scramble '(1 2 3))
;;; (scramble '(1 1 1 3 4 2))

(define (lm l skip)
  (cond ((null? l) '())
	((atom? (car l)) (skip (car l)))
	(else (let ()			; *begin
		(lm (car l) skip)
		(lm (cdr l) skip)
		))))

(define (leftmost l)
  (call-with-current-continuation
   (lambda (skip)
     (lm l skip))))

;;; (leftmost '((() ()) a))

(define leftmost
  (lambda (l)
    (letrec ((lm (lambda (l skip)
		   (cond ((null? l) '())
			 ((atom? (car l)) (skip (car l)))
			 (else (let ()
				 (lm (car l) skip)
				 (lm (cdr l) skip)))))))
  (call-with-current-continuation
   (lambda (skip)
     (lm l skip))))))

;;; (leftmost '((() (b)) a (x)))

(define leftmost
  (lambda (l)
    (call-with-current-continuation
     (lambda (skip)
       (letrec ((lm (lambda (l skip)
		      (cond ((null? l) '())
			    ((atom? (car l)) (skip (car l)))
			    (else (let ()
				    (lm (car l) skip)
				    (lm (cdr l) skip)))))))
	 (lm l skip))))))

;;; (leftmost '((() (b)) a (x)))

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

;;; (leftmost '((() (b)) a (x)))

(define rm
  (lambda (a l oh)
    (cond ((null? l) (oh 'no))
	  ((atom? (car l))
	   (if (eq? a (car l))
	       (cdr l)
	       (cons (car l)
		     (rm a (cdr l) oh))))
	  (else
	   (if (atom?			; eq?-no
		(call-with-current-continuation
		 (lambda (hop)
		   (rm a
		       (car l)
		       hop))))
	       (cons (car l)		; not removed
		     (rm a
			 (cdr l)
			 oh))
	       (cons (rm a
			 (car l)
			 '())		; removed
		     (cdr l)))))))

;; (rm 'a
;;     '((((c a) a)) a b c)
;;     '())

(define rember1*
  (lambda (a l)
    (if (atom? (call-with-current-continuation
		(lambda (oh)
		  (rm a l oh))))
	l
	(rm a l '()))))

(define rember1*
  (lambda (a l)
    (let ((new-l (call-with-current-continuation
		  (lambda (oh)
		    (rm a l oh)))))
      (if (atom? new-l)
	  l
	  new-l))))

;;; (rember1* 'a '((((c a) a)) a b c) )

(define rm
  (lambda (a l oh)
    (cond ((null? l) (oh 'no))
	  ((atom? (car l))
	   (if (eq? a (car l))
	       (cdr l)
	       (cons (car l)
		     (rm a (cdr l) oh))))
	  (else
	   (call-with-current-continuation
	    (lambda (success)
	      (call-with-current-continuation
	       (lambda (oh2)
		 (success (cons 
			   (rm a (car l) oh2)
			   (cdr l)))))
	      (cons
	       (car l)
	       (rm a (cdr l) oh))))))))

(define rember1*
  (lambda (a l)
    (call-with-current-continuation
     (lambda (success)
       (call-with-current-continuation
	(lambda (oh)
	  (success (rm a l oh))))
       l))))

;;; (rember1* 'a '((((c) a)) a b c) )

