;;; -*- buffer-read-only:t -*-

(load "6.scm")

(define (member? a lat)
  "member using equal?"
  (cond ((null? lat) false)
	(else
	 (or
	  (equal? a (car lat))
	  (member? a (cdr lat))))))

(define (set? lat)
  (cond ((null? lat)
	 true)
	((member? (car lat) (cdr lat))
	 false)
	(else (set? (cdr lat)))))

;;; (set? '(x y z a b c a))

(define (makeset lat)
  "make a set from a list of atoms"
  (cond ((null? lat) ())
	((member? (car lat) (cdr lat))
	 (makeset (cdr lat)))
	(else (cons (car lat)
		    (makeset (cdr lat))))))

;;; (makeset '(a a a b c a))

(define (makeset lat)
  "another variant"
  (cond ((null? lat)
	 '())
	(else (cons (car lat)
		    (makeset (multirember (car lat)
					  (cdr lat)))))))

;;; (makeset '(a a a b c a a b x))

(define (subset? set1 set2)
  "each element of set1 is in set2"
  (cond ((null? set1)
	 true)
	((member? (car set1) set2)
	 (subset? (cdr set1) set2))
	(else false)))

;;; (subset? '(a b c) '(a b x c))
;;; (subset? '() '())

(define (subset? set1 set2)
  "other variant"
  (cond ((null? set1)
	 true)
	(else
	 (and (member? (car set1) set2)
	      (subset? (cdr set1) set2)))))

;;; (subset? '(a b w c) '(a w b x c))

(define (eqset? set1 set2)
  (and (subset? set1 set2)
       (subset? set2 set1)))

;;; (eqset? '(a b c) '(c b a w))

(define (intersect? set1 set2)
  (cond ((null? set1)
	 false)
	(else (or (member? (car set1) set2)
		  (intersect? (cdr set1) set2)))))

;;; (intersect? '(a b c w) '(w t))

(define (intersect set1 set2)
  (cond ((null? set1)
	 '())
	((member? (car set1) set2)
	 (cons (car set1)
	       (intersect (cdr set1) set2)))
	(else (intersect (cdr set1) set2))))

;;; (intersect '(a b c) '(c a))

(define (union set1 set2)
  "union of 2 sets"
  (cond ((null? set1) set2)
	(else
	 (cons (car set1)
	       (union (cdr set1)
		      (multirember (car set1) set2))))))

;;; (union '(a c w) '(a b y w))

(define (union set1 set2)
  "other variant"
  (cond ((null? set1) set2)
	((member? (car set1) set2)
	 (union (cdr set1) set2))
	(else
	 (cons (car set1)
	       (union (cdr set1)
		      set2)))))

;;; (union '(a) '(a))

(define (difference set1 set2)
  "all elements in set1 that are not in set2"
  (cond ((null? set1) '())
	((member? (car set1) set2)
	 (difference (cdr set1) set2))
	(else (cons (car set1)
		    (difference (cdr set1) set2)))))

;;; (difference '(a b c) '(c d r a))

(define (intersectall l-set)
  "intersect all sets from `l-set`. suppose non-empty sets"
  (cond ((null? (cdr l-set))
	 (car l-set))
	(else (intersect (car l-set)
			 (intersectall (cdr l-set))))))

;;; (intersectall '((a b c) (a d e b) (a b d)))

(define (a-pair? x)
  (cond ((atom? x) false)
	((null? x) false)
	((null? (cdr x)) false)
	((null? (cdr (cdr x))) true)
	(else false)))

;;; (a-pair? '(1 2))

(define (first p)
  "first element"
  (car p))

(define (second p)
  "second element"
  (car (cdr p)))

(define (build s1 s2)
  "make a pair"
  (cons s1 (cons s2 '())))

(define (third p)
  "the 3rd element"
  (pick 3 p))

;;; (third '(1 2 3))

(define (fun? rel)
  "true when the relation is a function"
  (set? (firsts rel)))

;; (fun? '((d 4)
;; 	(g 5)
;; 	(e 5)))

(define (revrel rel)
  "reverse relation. first, second data representation"
  (cond ((null? rel) '())
	(else
	 (cons (build (second (car rel))
		      (first (car rel)))
	       (revrel (cdr rel))))))

;;; (revrel '((a 1) (b 2) (c 3)))

(define (revpair pair)
  (build (second pair)
	 (first pair)))

;;; (revpair (build 1 2))

(define (revrel rel)
  "other representation"
  (cond ((null? rel) '())
	(else
	 (cons (revpair (car rel))
	       (revrel (cdr rel))))))

;;; (revrel '((a 1) (b 2) (c 3)))

(define (fullfun? fun)
  (set? (seconds fun)))

;;; (fullfun? '((a 1) (b 2) (c 1)))

(define (one-to-one? fun)
  (fun? (revrel fun)))

;;; (one-to-one? '((a 1) (b 2) (c 20)))
