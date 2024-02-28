;;; -*- buffer-read-only:t -*-

(load "4.scm")

(define (rember* a l)
  "remove all occurrences of the atom `a` from `l`"
  (cond ((null? l) '())
	((eq? a (car l))
	 (rember* a (cdr l)))
	((atom? (car l))
	 (cons (car l)
	       (rember* a (cdr l))))
	(else (cons (rember* a (car l))
		    (rember* a (cdr l))))))

;;; (rember* 'a '(a (x y z a (a b c)) b (a b a) a b c))

(define (insertR* new old l)
  "insert `new` at the right of all occurrences of `old` in l"
  (cond ((null? l) '())
	((eq? old (car l))
	 (cons old
	       (cons new
		     (insertR* new old (cdr l)))))
	((atom? (car l))
	 (cons (car l)
	       (insertR* new old (cdr l))))
	(else (cons (insertR* new old (car l))
		    (insertR* new old (cdr l))))))

;;; (insertR* 'a 'x '(1 2 3 (4 y x (1 2 x 3) z) 5 x))

(define (occur* a l)
  "number of occurrences of an atom `a` in the list `l`"
  (cond ((null? l) 0)
	((eq? a (car l))
	 (add1 (occur* a (cdr l))))
	((atom? (car l))
	 (occur* a (cdr l)))
	(else (o+ (occur* a (car l))
		  (occur* a (cdr l))))))

;;; (occur* 'a '(a b a (x (a (b c d a)) z (a a (a (((((((a))))))))))))

(define (subst* new old l)
  "substitute an atom by another atom in a list"
  (cond ((null? l) '())
	((eq? old (car l))
	 (cons new (subst* new old (cdr l))))
	((atom? (car l))
	 (cons (car l)
	       (subst* new old (cdr l))))
	(else (cons (subst* new old (car l))
		    (subst* new old (cdr l))))))

;;; (subst* 'x 'a '((((((((((((((a))))))))))))) a y z w))

(define (insertL* new old l)
  "insert `new` at the left of all occurrences of `old` in l"
  (cond ((null? l) '())
	((eq? old (car l))
	 (cons new
	       (cons old
		     (insertL* new old (cdr l)))))
	((atom? (car l))
	 (cons (car l)
	       (insertL* new old (cdr l))))
	(else (cons (insertL* new old (car l))
		    (insertL* new old (cdr l))))))

;;; (insertL* 'a 'x '(1 2 3 (4 y x (1 2 x 3) z) 5 x (((((x)))))))

(define (member* a l)
  "true if `a` is member of `l`"
  (cond ((null? l)
	 false)
	((eq? (car l) a)
	 true)
	((atom? (car l))
	 (member* a (cdr l)))
	(else (or (member* a (car l))
		  (member* a (cdr l))))))

;;; (member* 'a '(x b c (((((b))) ((a))))))

(define (leftmost l)
  (cond ((atom? (car l)) (car l))
	(else (leftmost (car l)))))

;;; (leftmost '(((a x)) (((b))) ((c) (())) (()) a b c))

(define (o-and a b)
  "define logical AND in terms of COND"
  (cond (a b)
	(else false)))

;;; (o-and false false)

(define (o-or a b)
  "define logical OR in terms of COND"
  (cond (a true)
	(else b)))

;;; (o-or true true)

(define (eqlist? l1 l2)
  "equality of 2 lists"
  (cond ((and (null? l1)
	      (null? l2))
	 ;; both null
	 true)
	((or (null? l1)
	     (null? l2))
	 ;; one of them null
	 false)
	((or (atom? (car l1))
	     (atom? (car l2)))
	 (cond
	  ((or
	    (pair? (car l2))
	    (pair? (car l1)))
	   ;; one atom and one pair
	   false)
	  (else
	   ;; 2 atoms and the rest of the list
	   (and (eqan? (car l1)
		       (car l2))
		(eqlist? (cdr l1)
			 (cdr l2))))))
	(else (and
	       ;; car and cdr are lists
	       (eqlist? (car l1) (car l2))
	       (eqlist? (cdr l1) (cdr l2))))))

;; (eqlist? '((((a))) b (x))
;; 	 '((((a))) b (x)))

;; (eqlist? '(((((a)) (((b))))))
;; 	 '(((((a)) (((b)))))))

(define (equal? s1 s2)
  "determine whether s-exp s1 is equal to s-exp s2"
  (cond ((and (atom? s1)
	      (atom? s2))
	 (eqan? s1 s2))
	((or (atom? s1)
	     (atom? s2))
	 false)
	(else (eqlist? s1 s2))))

;;; (equal? '(1) '(1))

(define (eqlist? l1 l2)
  (cond ((and (null? l1)
	      (null? l2))
	 true)
	((or (null? l1)
	     (null? l2))
	 false)
	(else (and (equal? (car l1)
			   (car l2))
		   (equal? (cdr l1)
			   (cdr l2))))))

;; (equal? '(a ((b) ((w))) c)
;; 	'(a ((b) ((w))) c))

(define (rember s l)
  "removes the first matching s-exp `s` in `l`"
  (cond ((null? l) '())
	((equal? (car l) s)
	 (cdr l))
	(else (cons (car l)
		    (rember s (cdr l))))))

;;; (rember 'a '(a b c a))
