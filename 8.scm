;;; -*- buffer-read-only:t -*-

(load "7.scm")

(define (rember-f test? a l)
  (cond ((null? l) '())
	((test? a (car l))
	 (cdr l))
	(else (cons (car l)
		    (rember-f test? a (cdr l))))))

;;; (rember-f equal? '(1 2 3) '((a b) c (1 2 3) w s))

(define eq?-c
;;; "curry-ing and/or schonfinkelling"
  (lambda (a)
    (lambda (x)
      (eq? x a))))

;;; (eq?-c 'salad)

(define eq?-salad
  (eq?-c 'salad))

;;; (eq?-salad 'salad0)

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond ((null? l) '())
	    ((test? a (car l))
	     (cdr l))
	    (else (cons (car l)
			(rember-f test? a (cdr l))))))))

;;; (rember-f eq?)

(define rember-eq?
  (rember-f eq?))

;;; (rember-eq? 'a '(a b c a))

(define insertL-f
;;; "curry the equality function for insertL"
  (lambda (test?)
    (lambda (new old lat)
      (cond ((null? lat) '())
	    ((eq? old (car lat))
	     (cons new lat))		; **
	    (else (cons (car lat)
			((insertL-f test?) new old (cdr lat))))))))

;;; (insertL-f eq?)

;;; ((insertL-f 'eq) 'e 'x '(a x c d f g x))

(define insertR-f
;;; "curry-ing the equality function for insertR"
  (lambda (test?)
    (lambda  (new old lat)
      (cond ((null? lat) '())
	    ((eq? old (car lat))
	     (cons old (cons new (cdr lat)))) ; **
	    (else (cons (car lat)
			((insertR-f test?) new old (cdr lat))))))))

;;; (insertR-f eq?)

;;; ((insertR-f 'eq) 'e 'x '(a x c d f g x))

(define insert-g
;;; "curry-ing the insertion function for insertR/L"
  (lambda (seq)
    (lambda (test?)
      (lambda  (new old lat)
	(cond ((null? lat) '())
	      ((eq? old (car lat))
	       (seq new old lat))
	      (else (cons (car lat)
			  (((insert-g seq) test?) new old (cdr lat)))))))))

(define seqL
  (lambda (new old lat)
    (cons new lat)))

(define seqR
  (lambda (new old lat)
    (cons old (cons new (cdr lat)))))

(define insertL-o
  (insert-g seqL))

(define insertR-o
  (insert-g seqR))

;;; ((insertR-o eq?) 'r 'x '(a x c d f g x))

;;; ((insertL-o eq?) 'r 'x '(a x c d f g x))

(define subst
  (insert-g (lambda (new old lat)
	      (cons new (cdr lat)))))

;;; ((subst eq?) 'x 'h '(a b c d f g h a))

(define rember
  (insert-g (lambda (new old lat)
	      (cdr lat))))

;;; ((rember eq?) false 'w '(a b c d f g h a))

(define (atom-to-function x)
  (cond ((eq? x '+) o+)
	((eq? x '*) o*)
	((eq? x '^) o^)
	(else "not reached")))

;;; (atom-to-function '+)

(define (value nexp)
  (cond ((atom? nexp) nexp)
	(else
	 ((atom-to-function (operator nexp))
	  (value (1st-sub-exp nexp))
	  (value (2nd-sub-exp nexp))))))

;;; (value '(+ 2 (* (^ 3 3) 4)))

(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      "removes all occurrences of `a` from `lat`"
      (cond ((null? lat) '())
	    ((test? (car lat) a)
	     ((multirember-f test?) a (cdr lat)))
	    (else (cons (car lat)
			((multirember-f test?) a (cdr lat))))))))

;;; ((multirember-f eq?) 'a '(a b c a x a y z a))

(define multirember-eq?
  (multirember-f eq?))

;;; (multirember-eq? 'a '(a b c a x a y z a))

(define eq?-tuna
  (eq?-c 'tuna))

;;; (eq?-tuna 'tuna0)

(define multiremberT
  (lambda (test? lat)
    "removes all occurrences of `a` from `lat`"
    (cond ((null? lat) '())
	  ((test? (car lat))
	   (multiremberT test? (cdr lat)))
	  (else (cons (car lat)
		      (multiremberT test? (cdr lat)))))))

;;; (multiremberT eq?-tuna '(a b tuna c tuna d tuna0))

;;; *-* *-* *-* *-* *-* *-* *-* *-* *-* *-* *-* *-* *-* *-*
;;  COLLECTORS ~ CONTINUATIONS

(define multirember&co
  (lambda (a lat col)
    (cond
     ((null? lat)
      (col '() '()))
     ((eq? (car lat) a)
      (multirember&co
       a
       (cdr lat)
       (lambda (newlat seen)
	 (col newlat
	      (cons (car lat) seen)))))
     (else
      (multirember&co
       a
       (cdr lat)
       (lambda (newlat seen)
	 (col (cons (car lat) newlat)
	      seen)))))))

(define a-friend
  (lambda (x y)
    "x will contain the accumulated non-matches, while `y` will
contain the matches. so the final result is true if the `lat` has no
`a's`"
    (null? y)))

;;; (multirember&co 'a '(a b c) a-friend)

;;; (multirember&co 'a '() a-friend)

;;; (multirember&co 'tuna '(tuna0) a-friend)

(define new-friend
  (lambda (newlat seen)
    "the 2nd parameter passed to `a-friend` (the matches parameter)
will all the time contain 'tuna, so a-friend will all the time be
false"
    (a-friend newlat
	      (cons 'tuna seen))))

;;; (multirember&co 'a '(a b c) new-friend)

;;; (multirember&co 'a '() new-friend)

;;; (multirember&co 'tuna '(tuna0) new-friend)

(define latest-friend
  (lambda (newlat seen)
    "this changes only the 1st parameter passed to
`a-friend` (non-matches accumulator), and because `a-friend` ignores
it, the result will be the same"
    (a-friend (cons 'and newlat)
	      seen)))

;;; (multirember&co 'a '(a b c) latest-friend)

;;; (multirember&co 'a '() latest-friend)

;;; (multirember&co 'tuna '(tuna0) latest-friend)

(define last-friend
  (lambda (x y)
    "this does not use `a-friend`, but only computes the number of
accumulated elements in the 1st parameter `newlat`, so it counts the
non-matches"
    (length x)))

;;; (multirember&co 'a '(a b c) last-friend)

;;; (multirember&co 'a '() last-friend)

;;; (multirember&co 'tuna '(tuna0) last-friend)

;;; (multirember&co 'tuna '(tuna) last-friend)

(define (multiinsertLR new oldL oldR lat)
  (cond ((null? lat) '())
	((eq? (car lat) oldL)
	 (cons new
	       (cons oldL
		     (multiinsertLR new oldL oldR
				    (cdr lat)))))
	((eq? (car lat) oldR)
	 (cons oldR
	       (cons new
		     (multiinsertLR new oldL oldR
				    (cdr lat)))))
	(else (cons (car lat)
		    (multiinsertLR new oldL oldR
				   (cdr lat))))))

;;; (multiinsertLR 'x 'a 'b '(a b c a a a a))

(define (multiinsertLR&co new oldL oldR lat col)
  (cond ((null? lat)
	 (col '()))
	((eq? (car lat) oldL)
	 (multiinsertLR&co new oldL oldR
			   (cdr lat)
			   (lambda (x)
			     (col
			      (cons new
				    (cons oldL
					  x))))))
	((eq? (car lat) oldR)
	 (multiinsertLR&co new oldL oldR
			   (cdr lat)
			   (lambda (x)
			     (col
			      (cons oldR
				    (cons new
					  x))))))
	(else
	 (multiinsertLR&co new oldL oldR
			   (cdr lat)
			   (lambda (x)
			     (col
			      (cons (car lat)
				    x)))))))

(define multiinsert-collector
  (lambda (x)
    x))

;; (multiinsertLR&co 'x 'a 'w '(a b)
;; 		  multiinsert-collector)

(define (even? n)
  (eqan? 0
	 (o- n
	     (o* 2
		 (o/ n 2)))))

;;; (even? 1)

(define evens-only*
  (lambda (l)
    (cond ((null? l)
	   '())
	  ((and (atom? (car l))
		(even? (car l)))
	   (cons (car l)
		 (evens-only* (cdr l))))
	  ((atom? (car l))
	   (evens-only* (cdr l)))
	  (else
	   (cons (evens-only* (car l))
		 (evens-only* (cdr l)))))))

;;; (evens-only* '(1 2 3 4 ((5 6 7 ((8 9))))))

(define evens-only*&co
  (lambda (l col)
    "builds a nested list of even #'s, and simultaneously computes the
product of evens and the sum of odd #'s"
    (cond ((null? l)
	   (col '() 0 1))
	  ((and (atom? (car l))
		(even? (car l)))
	   (evens-only*&co
	    (cdr l)
	    (lambda (acc sum prod)
	      "collect evens, make product"
	      (col
	       (cons (car l) acc)
	       sum
	       (o* (car l) prod)))))
	  ((atom? (car l))
	   (evens-only*&co
	    (cdr l)
	    (lambda (acc sum prod)
	      "does not collect odd ones, make sum of odd ones"
	      (col acc
		   (o+ (car l) sum)
		   prod))))
	  (else
	   (evens-only*&co
	    (car l)
	    (lambda (acc1 sum1 prod1)
	      (evens-only*&co
	       (cdr l)
	       (lambda (acc2 sum2 prod2)
		 (col
		  (cons acc1 acc2)
		  (o+ sum1 sum2)
		  (o* prod1 prod2))))))))))

(define the-last-friend
  (lambda (acc sum prod)
    (list acc sum prod)))

;; (evens-only*&co '(1 2 3 (4 ((5 6 7))))
;; 		the-last-friend)

;; (evens-only*&co '((2 3 (((3 10)))) 4)
;; 		the-last-friend)

;; (evens-only*&co '()
;; 		the-last-friend)
