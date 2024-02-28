;;; -*- buffer-read-only:t -*-

(load "16.scm")

(define deep
  (lambda (n)
    (cond ((zero? n) 'pizza)
	  (else (cons (deepM (sub1 n))
		      '())))))

(define deepM
  (let ((Ns '())
	(Rs '()))
    (letrec ((D (lambda (n)
		  (cond ((zero? n) 'pizza)
			(else (cons (D (sub1 n))
				    '()))))))
      (lambda (n)
	(let ((exists (find n Ns Rs)))
	  (if (atom? exists)
	      (let ((result (D n)))
		(set! Rs (cons result Rs))
		(set! Ns (cons n Ns))
		result)
	      exists))))))

(define deepM
  (let ((Ns '())
	(Rs '()))
    (letrec ((D (lambda (n)
		  (cond ((zero? n) 'pizza)
			(else (cons (deepM (sub1 n))
				    '()))))))
      (lambda (n)
	(let ((exists (find n Ns Rs)))
	  (if (atom? exists)
	      (let ((result (D n)))
		(set! Rs (cons result Rs))
		(set! Ns (cons n Ns))
		result)
	      exists))))))

(define deepM
  (let ((Ns '())
	(Rs '()))
    (let ((D (lambda (n)
	       (cond ((zero? n) 'pizza)
		     (else (cons (deepM (sub1 n))
				 '()))))))
      (lambda (n)
	(let ((exists (find n Ns Rs)))
	  (if (atom? exists)
	      (let ((result (D n)))
		(set! Rs (cons result Rs))
		(set! Ns (cons n Ns))
		result)
	      exists))))))

(define deepM
  (let ((Ns '())
	(Rs '())
	(D (lambda (n)
	     (cond ((zero? n) 'pizza)
		   (else (cons (deepM (sub1 n))
			       '()))))))
      (lambda (n)
	(let ((exists (find n Ns Rs)))
	  (if (atom? exists)
	      (let ((result (D n)))
		(set! Rs (cons result Rs))
		(set! Ns (cons n Ns))
		result)
	      exists)))))

(define deepM
  (let ((Ns '())
	(Rs '()))
      (lambda (n)
	(let ((exists (find n Ns Rs)))
	  (if (atom? exists)
	      (let ((result ((lambda (n)
			       (cond ((zero? n) 'pizza)
				     (else (cons (deepM (sub1 n))
						 '()))))
			     n)))
		(set! Rs (cons result Rs))
		(set! Ns (cons n Ns))
		result)
	      exists)))))

(define deepM
  (let ((Ns '())
	(Rs '()))
    (lambda (n)
      (let ((exists (find n Ns Rs)))
	(if (atom? exists)
	    (let ((result (let ((m n))
			    (if (zero? m)
				'pizza
				(cons (deepM (sub1 m)) '())))))
	      (set! Rs (cons result Rs))
	      (set! Ns (cons n Ns))
	      result)
	    exists)))))

(define deepM
  (let ((Ns '())
	(Rs '()))
    (lambda (n)
      (let ((exists (find n Ns Rs)))
	(if (atom? exists)
	    (let ((result (if (zero? n)
			      'pizza
			      (cons (deepM (sub1 n)) '()))))
	      (set! Rs (cons result Rs))
	      (set! Ns (cons n Ns))
	      result)
	    exists)))))

(define consC
  (let ((N 0))
    (lambda (x y)
      (set! N (add1 N))
      (cons x y))))

(define N 0)

(define consC
  (lambda (x y)
    (set! N (add1 N))
    (cons x y)))

(define counter)

(define consC
  (let ((N 0))
    (set! counter (lambda () N))
    (lambda (x y)
      (set! N (add1 N))
      (cons x y))))

(define deep
  (lambda (n)
    (cond ((zero? n) 'pizza)
	  (else (consC (deep (sub1 n))
		       '())))))

;;; (deep 100)

;;; (counter)

(define supercounter
  (lambda (f)
    (letrec
	((S (lambda (n)
	      (if (zero? n)
		  (f n)
		  (let ()
		    (f n)
		    (S (sub1 n)))))))
      (S 1000))))

;;; (supercounter deep)

;;; (counter)

(define supercounter
  (lambda (f)
    (letrec
	((S (lambda (n)
	      (if (zero? n)
		  (f n)
		  (let ()
		    (f n)
		    (S (sub1 n)))))))
      (S 10)
      (counter))))

;;; (supercounter deep)

(define counter)

(define set-counter)

(define consC
  (let ((N 0))
    (set! counter
	  (lambda () N))
    (set! set-counter
	  (lambda (x)
	    (set! N x)))
    (lambda (x y)
      (set! N (add1 N))
      (cons x y))))

;;; (set-counter 0)

;;; (supercounter deep)

;;; (counter)

(define deepM
  (let ((Ns '())
	(Rs '()))
    (lambda (n)
      (display (find n Ns Rs))
      (let ((exists (find n Ns Rs)))
	(if (atom? exists)
	    (let ((result (if (zero? n)
			      'pizza
			      (consC (deepM (sub1 n)) '()))))
	      (set! Rs (cons result Rs))
	      (set! Ns (cons n Ns))
	      result)
	    exists)))))

;;; (deepM 50)

;;; (supercounter deepM)

(define rm
  (lambda (a l oh)
    "from ch.14"
    (cond ((null? l) (oh 'no))
	  ((atom? (car l))
	   (if (eq? a (car l))
	       (cdr l)
	       (cons (car l)
		     (rm a (cdr l) oh))))
	  (else
	   (if (atom?
		(call-with-current-continuation
		 (lambda (hop)
		   (rm a
		       (car l)
		       hop))))
	       (cons (car l)
		     (rm a
			 (cdr l)
			 oh))
	       (cons (rm a
			 (car l)
			 '())
		     (cdr l)))))))

(define rember1*
  (lambda (a l)
    "from ch.14"
    (let ((new-l (call-with-current-continuation
		  (lambda (oh)
		    (rm a l oh)))))
      (if (atom? new-l)
	  l
	  new-l))))

(define rember1*
  (lambda (a l)
    (letrec ((R (lambda (l oh)
		  (cond ((null? l) (oh 'no))
			((atom? (car l))
			 (if (eq? a (car l))
			     (cdr l)
			     (cons (car l)
				   (R (cdr l) oh))))
			(else
			 (let ((new-car (call-with-current-continuation
					 (lambda (oh)
					   (R (car l) oh)))))
			   (if (atom? new-car)
			       (cons (car l) (R (cdr l) oh))
			       (cons new-car (cdr l)))))))))
      (let ((new-l (call-with-current-continuation
		    (lambda (oh)
		      (R l oh)))))
	(if (atom? new-l)
	    l
	    new-l)))))

;;; (rember1* 'a '(x ((a b)) a b c))

(define rember1*C
  (lambda (a l)
    (letrec ((R (lambda (l oh)
		  (cond ((null? l) (oh 'no))
			((atom? (car l))
			 (if (eq? a (car l))
			     (cdr l)
			     (consC (car l)
				   (R (cdr l) oh))))
			(else
			 (let ((new-car (call-with-current-continuation
					 (lambda (oh)
					   (R (car l) oh)))))
			   (if (atom? new-car)
			       (consC (car l) (R (cdr l) oh))
			       (consC new-car (cdr l)))))))))
      (let ((new-l (call-with-current-continuation
		    (lambda (oh)
		      (R l oh)))))
	(if (atom? new-l)
	    l
	    new-l)))))

;;; (rember1* 'w '(x ((a b)) a b c))

;;; (counter)

;;; (set-counter 0)

(define rember1*C2
  (lambda (a l)
    (letrec ((R (lambda (l)
		  (cond ((null? l) '())
			((atom? (car l))
			 (if (eq? a (car l))
			     (cdr l)
			     (cons (car l)
				   (R (cdr l)))))
			(else
			 (let ((k (R (car l))))
			   (if (eqlist? k (car l))
			       (cons (car l)
				     (R (cdr l)))
			       (cons k (cdr l)))))))))
      (R l))))

;;; (rember1*C2 'w '(x ((a b)) a b c))

(define rember1*
  (lambda (a l)
    (letrec ((R (lambda (l)
		  (cond ((null? l) '())
			((atom? (car l))
			 (if (eq? a (car l))
			     (cdr l)
			     (consC (car l)
				   (R (cdr l)))))
			(else
			 (let ((k (R (car l))))
			   (if (eqlist? k (car l))
			       (consC (car l)
				     (R (cdr l)))
			       (consC k (cdr l)))))))))
      (R l))))








