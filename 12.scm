;;; -*- buffer-read-only:t -*-

(load "11.scm")

(define multirember
  (lambda (a lat)
    ((Y (lambda (mr)
	  (lambda (lat)
	    (cond ((null? lat) '())
		  ((eq? a (car lat))
		   (mr (cdr lat)))
		  (else (cons (car lat)
			      (mr (cdr lat))))))))
     lat)))

;;; (multirember 'a '(a b c a d))

(define length
  ((lambda (k)
     "this function is called Y-combinator"
     ((lambda (f)
	(f f))
      (lambda (f)
	(k (lambda (x)
	     ((f f) x))))))
   (lambda (length)
     "this is the length function"
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))))

;;; (length '(a b c))

(define multirember
  (lambda (a lat)
    ((letrec
	 ((mr (lambda (lat)
		(cond ((null? lat) '())
		      ((eq? a (car lat))
		       (mr (cdr lat)))
		      (else (cons (car lat)
				  (mr (cdr lat))))))))
       mr)
     lat)))

;;; (multirember 'a '(a b c a d))

(define mr
  (lambda (lat)
    (cond ((null? lat) '())
	  ((eq? a (car lat))
	   (mr (cdr lat)))
	  (else (cons (car lat)
		      (mr (cdr lat)))))))

(define multirember-bad
  (lambda (a lat)
    "this does not work"
    (mr lat)))

;;; (multirember-bad 'a '(a b c a d))

(define multirember
  (lambda (a lat)
    (letrec
	((mr (lambda (lat)
	       (cond ((null? lat) '())
		     ((eq? a (car lat))
		      (mr (cdr lat)))
		     (else (cons (car lat)
				 (mr (cdr lat))))))))
      (mr lat))))

;;; (multirember 'a '(a b c a d))

(define rember-f
  (lambda (test?)
    "from little"
    (lambda (a l)
      (cond ((null? l) '())
	    ((test? a (car l))
	     (cdr l))
	    (else (cons (car l)
			(rember-f test? a (cdr l))))))))

(define rember-eq?
  (rember-f eq?))

(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      "from little"
      (cond ((null? lat) '())
	    ((test? (car lat) a)
	     ((multirember-f test?) a (cdr lat)))
	    (else (cons (car lat)
			((multirember-f test?) a (cdr lat))))))))

(define multirember-eq?
  (multirember-f eq?))

(define multirember-f
  (lambda (test?)
    (letrec ((m-f (lambda (a lat)
		    "from little"
		    (cond ((null? lat) '())
			  ((test? (car lat) a)
			   (m-f a (cdr lat)))
			  (else (cons (car lat)
				      (m-f a (cdr lat))))))))
      m-f)))

(define multirember-eq?
  (multirember-f eq?))

;;; (multirember-eq? 'a '(a b c a d))

(define (member? a lat)
  "from little"
  (cond ((null? lat) false)
	(else
	 (or
	  (equal? a (car lat))
	  (member? a (cdr lat))))))

(define member?
  (lambda (a lat)
    ((letrec ((yes? (lambda (l)
		     (cond ((null? l) false)
			   (else
			    (or
			     (eq? a (car l))
			     (yes? (cdr l))))))))
       yes?)
      lat)))

;;; (member? 'a '(b c))

(define member?
  (lambda (a lat)
    (letrec ((yes? (lambda (l)
		     (cond ((null? l) false)
			   (else
			    (or
			     (eq? a (car l))
			     (yes? (cdr l))))))))
      (yes? lat))))

;;; (member? 'a '(b c a))

(define (union set1 set2)
  "from little"
  (cond ((null? set1) set2)
	((member? (car set1) set2)
	 (union (cdr set1) set2))
	(else
	 (cons (car set1)
	       (union (cdr set1)
		      set2)))))

(define union
  (lambda (set1 set2)
    (letrec ((u (lambda (s1)
		  (cond ((null? s1) set2)
			((member? (car s1) set2)
			 (u (cdr s1)))
			(else
			 (cons (car s1)
			       (u (cdr s1))))))))
      (u set1))))

;;; (union '(a c w) '(a b y w))

(define union
  (lambda (set1 set2)
    (letrec ((u (lambda (s1)
		  (cond ((null? s1) set2)
			((member? (car s1) set2)
			 (u (cdr s1)))
			(else
			 (cons (car s1)
			       (u (cdr s1)))))))
	     (member? (lambda (a lat)
			(cond ((null? lat) false)
			      (else
			       (or
				(equal? a (car lat))
				(member? a (cdr lat))))))))
      (u set1))))

;;; (union '(a c w) '(a b y w))

(define union
  (lambda (set1 set2)
    (letrec ((u (lambda (s1)
		  (cond ((null? s1) set2)
			((member? (car s1) set2)
			 (u (cdr s1)))
			(else
			 (cons (car s1)
			       (u (cdr s1)))))))
	     (member? (lambda (a lat)
			(letrec ((m? (lambda (l)
					(cond ((null? l) false)
					      (else
					       (or
						(eq? a (car l))
						(m? (cdr l))))))))
			   (m? lat)))))
      (u set1))))

;;; (union '(a c w) '(a b y w))

(define two-in-a-row?
  (lambda (lat)
    (letrec ((w? (lambda (preceding lat)
		   (cond ((null? lat)
			  false)
			 (else
			  (or (eq? (car lat) preceding)
			      (w? (car lat) (cdr lat))))))
		 ))
      (cond ((null? lat) false)
	    (else
	     (w? (car lat) (cdr lat)))))))

;;; (two-in-a-row? '(b a b c b a b a))

(define two-in-a-row?
  (letrec ((w? (lambda (preceding lat)
		 (cond ((null? lat)
			false)
		       (else
			(or (eq? (car lat) preceding)
			    (w? (car lat) (cdr lat))))))
	       ))
    (lambda (lat)
      (cond ((null? lat) false)
	    (else
	     (w? (car lat) (cdr lat)))))))

;;; (two-in-a-row? '(b a b c b a b c a))

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

(define sum-of-prefixes
  (lambda (tup)
    (letrec ((s (lambda (sonssf tup)
		  (cond ((null? tup) '())
			(else
			 (cons (o+ sonssf
				   (car tup))
			       (s
				(o+ sonssf
				    (car tup))
				(cdr tup)))))
		  )))
      (cond ((null? tup) ())
	    (else
	     (s 0
		tup))))))

;;; (sum-of-prefixes '(1 1 1))

(define sum-of-prefixes
  (letrec ((s (lambda (sonssf tup)
		(cond ((null? tup) '())
		      (else
		       (cons (o+ sonssf
				 (car tup))
			     (s
			      (o+ sonssf
				  (car tup))
			      (cdr tup)))))
		)))
    (lambda (tup)
      (cond ((null? tup) ())
	    (else
	     (s 0
		tup))))))

;;; (sum-of-prefixes '(1 1 1))


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
    (letrec ((s (lambda (tup rev-pre)
		  (cond ((null? tup) '())
			(else
			 (cons (pick (car tup)
				     (cons (car tup)
					   rev-pre))
			       (s (cdr tup)
				  (cons (car tup)
					rev-pre))))))))
      (s tup '()))))

;;; (scramble '(1 2 3))

;;; (scramble '(1 1 1 3 4 2))
