;;; -*- buffer-read-only:t -*-

(load "8.scm")

(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))

(define keep-looking
  (lambda (a sorn lat)
    "if sorn is symbol, compare with a, if sorn is number, recur"
    (cond ((number? sorn)
	   (keep-looking a (pick sorn lat) lat))
	  (else (eq? sorn a)))))

;;; (looking 'a '(2 3 4 5 b a))

(define eternity
  (lambda (w)
    (eternity w)))

;;; '(eternity '())

(define shift
  (lambda (pair)
    (build
     (first (first pair))
     (build
      (second (first pair))
      (second pair)))))

;;; (shift '((a b) c))

;;; (shift '((a b) (c d)))

(define (align pora)
  (cond ((atom?) pora)
	((a-pair? (first pora))
	 (align (shift pora)))
	(else (build (first pora)
		     (align (second pora))))))

(define length*
  (lambda (pora)
    (cond ((atom? pora)
	   1)
	  (else
	   (o+ (length* (first pora))
	       (length* (second pora)))))))

;;; (length* '(((1 2) (3 4)) (5 6)))

(define weight*
  (lambda (pora)
    (cond ((atom? pora)
	   1)
	  (else
	   (o+ (o* (weight* (first pora))
		   2)
	       (weight* (second pora)))))))

;;; (weight* '((a b) c))

;;; (weight* (shift '((a b) c)))

(define shuffle
  (lambda (pora)
    (cond ((atom? pora) pora)
	  ((a-pair? (first pora))
	   (shuffle (revpair pora)))
	  (else (build
		 (first pora)
		 (shuffle (second pora)))))))

;;; (shuffle '(a (b c)))

;;; (shuffle '(a b))

;;; '(shuffle '((a b) (c d)))

(define (C n)
  '(display n)
  '(newline)
  (cond ((one? n) 1)
	((even? n) (C (o/ n 2)))
	(else (C (add1 (o* n 3))))))

;;; (C 100)

(define (A n m)
  '(display n)
  '(display "\t")
  '(display m)
  '(newline)
  (cond ((zero? n) (add1 m))
	((zero? m) (A (sub1 n) 1))
	(else (A (sub1 n)
		 (A n (sub1 m))))))

;; (A 1 0)
;; (A 1 1)
;; (A 2 2)
;; '(A 4 3)				;loops for eternity

(define will-stop?
  (lambda (f)
    (f)					;eternity case
    true				;stop case
    ))

(define try
  (lambda ()
    (and (will-stop? try)
	 (eternity 0))))

;;; '(will-stop? try)

(define length0
  (lambda (l)
    (cond ((null? l) 0)
	  (else (eternity)))))

;;; (length0 '())

(define length1
  (lambda (l)
    (cond ((null? l) 0)
	  (else (add1 (length0 (cdr l)))))))

;;; (length1 '(a))

(define length1
  (lambda (l)
    (cond ((null? l) 0)
	  (else (add1 ((lambda (l)
			 (cond ((null? l) 0)
			       (else (eternity))))
		       (cdr l)))))))

;;; (length1 '(a))

(define length2
  (lambda (l)
    (cond ((null? l) 0)
	  (else (add1 ((lambda (l)
			 (cond ((null? l) 0)
			       (else (add1 ((lambda (l)
					      (cond ((null? l) 0)
						    (else (eternity))))
					    (cdr l))))))
		       (cdr l)))))))

;;; (length2 '(a b))

(define length0
  ((lambda (length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))
   eternity))

;;; (length0 '())

(define length1
  ((lambda (f)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (f (cdr l)))))))
   ((lambda (g)
      (lambda (l)
	(cond ((null? l) 0)
	      (else (add1 (g (cdr l)))))))
    eternity)))

;;; (length1 '(a))

(define length2
  ((lambda (f)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (f (cdr l)))))))
   ((lambda (g)
      (lambda (l)
	(cond ((null? l) 0)
	      (else (add1 (g (cdr l)))))))
    ((lambda (h)
       (lambda (l)
	 (cond ((null? l) 0)
	       (else (add1 (h (cdr l)))))))
     eternity))))

;;; (length2 '(a b))

(define length2
  ((lambda (length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))
   ((lambda (length)
      (lambda (l)
	(cond ((null? l) 0)
	      (else (add1 (length (cdr l)))))))
    ((lambda (length)
       (lambda (l)
	 (cond ((null? l) 0)
	       (else (add1 (length (cdr l)))))))
     eternity))))

;;; (length2 '(a b))

(define length0
  ((lambda (mk-length)
     (mk-length eternity))
   (lambda (length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))))

;;; (length0 '())

(define length1
  ((lambda (mk-length)
     (mk-length
      (mk-length eternity)))
   (lambda (length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))))

;;; (length1 '())

(define length2
  ((lambda (mk-length)
     (mk-length
      (mk-length
       (mk-length eternity))))
   (lambda (length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))))

;;; (length2 '(1))

(define length3
  ((lambda (mk-length)
     (mk-length
      (mk-length
       (mk-length
	(mk-length eternity)))))
   (lambda (length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))))

;;; (length3 '(1 2 3))

(define length0
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (mk-length (cdr l)))))))))

;;; (length0 '())

(define length1
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 ((mk-length eternity)
			  (cdr l)))))))))

;;; (length1 '(a))

(define length
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 ((mk-length mk-length)
			  (cdr l)))))))))

;;; (length '(a b c  g h))

(define length
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     (lambda (l)
       ((lambda (length)
	  '(display l)
	  '(newline)
	  (cond ((null? l) 0)
		(else (add1 (length (cdr l))))))
	(mk-length mk-length))))))

(define length
  ((lambda (mk-length)
     (lambda (l)
       ((lambda (length)
	  '(newline)
	  '(display l)
	  '(display "\t/  ")
	  (cond ((null? l) 0)
		(else (add1 (length (cdr l))))))
	(mk-length mk-length))))
   (lambda (mk-length)
     (lambda (l)
       ((lambda (length)
	  '(newline)
	  '(display l)
	  '(display "\t;")
	  (cond ((null? l) 0)
		(else (add1 (length (cdr l))))))
	(mk-length mk-length))))))

;;; (length '(a b c d e f))

(define length
  ((lambda (mk-length)
     (lambda (l)
       ((lambda (length)
	  '(newline)
	  '(display l)
	  '(display "\t/  ")
	  (cond ((null? l) 0)
		(else (add1 (length (cdr l))))))
	(mk-length mk-length))))
   (lambda (mk-length)
     (lambda (l)
       ((lambda (length)
	  '(newline)
	  '(display l)
	  '(display "\t;")
	  (cond ((null? l) 0)
		(else (add1 (length (cdr l))))))
	(mk-length mk-length))))))

;;; (length '(a b c d))

(define length
  ((lambda (length)
     (lambda (l)
       (length l)))
   ((lambda (mk-length)
      (lambda (l)
	((lambda (length)
	   '(newline)
	   '(display l)
	   '(display "\t/  ")
	   (cond ((null? l) 0)
		 (else (add1 (length (cdr l))))))
	 (mk-length mk-length))))
    (lambda (mk-length)
      (lambda (l)
	((lambda (length)
	   '(newline)
	   '(display l)
	   '(display "\t;")
	   (cond ((null? l) 0)
		 (else (add1 (length (cdr l))))))
	 (mk-length mk-length)))))))

(define length
  ((lambda (length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))
   ((lambda (length)
      (lambda (l)
	(cond ((null? l) 0)
	      (else (add1 (length (cdr l)))))))
    ((lambda (mk-length)
       (lambda (l)
	 ((lambda (length)
	    '(newline)
	    '(display l)
	    '(display "\t/  ")
	    (cond ((null? l) 0)
		  (else (add1 (length (cdr l))))))
	  (mk-length mk-length))))
     (lambda (mk-length)
       (lambda (l)
	 ((lambda (length)
	    '(newline)
	    '(display l)
	    '(display "\t;")
	    (cond ((null? l) 0)
		  (else (add1 (length (cdr l))))))
	  (mk-length mk-length))))))))

;;; (length '(a b c))

(define length
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 ((lambda (x)
			    ((mk-length mk-length) x))
			  (cdr l)))))))))

;;; (length '(a b c))

(define length
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     ((lambda (length)
	"will extract length, as it does not depend on mk-length"
	(lambda (l)
	  (cond ((null? l) 0)
		(else (add1 (length (cdr l)))))))
      (lambda (x)
	((mk-length mk-length) x))))))

;;; (length '(a b c))

(define length
  ((lambda (len)
     "this function is called Y-combinator"
     ((lambda (mk-length)
	(mk-length mk-length))
      (lambda (mk-length)
	(len (lambda (x)
	       ((mk-length mk-length) x))))))
   (lambda (length)
     "this is the length function"
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l)))))))))

;;; (length '(a b c))

(define Y
  (lambda (k)
    "this function is called Y-combinator"
    ((lambda (f)
       (f f))
     (lambda (f)
       (k (lambda (x)
	      ((f f) x)))))))

(define last-length
  (lambda (length)
     "this is the length function"
     (lambda (l)
       (cond ((null? l) 0)
	     (else (add1 (length (cdr l))))))))

(define length
  (Y last-length))

;;; (length '(a b c))
