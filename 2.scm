;;; -*- buffer-read-only:t -*-

(load "1.scm")

(define (lat? l)
  "list of atoms"
  (cond ((null? l)
	 true)
	((atom? (car l))
	 (lat? (cdr l)))
	(else false)))

;;; (lat? '(1 2 3 ("a")))

(define (member? a lat)
  "`a` belongs or not to `lat`"
  (cond ((null? lat) false)
	((eq? a (car lat)) true)
	(else (member? a (cdr lat)))))

(define (member? a lat)
  "other similar definition"
  (cond ((null? lat) false)
	(else
	 (or
	  (eq? a (car lat))
	  (member? a (cdr lat))))))

;;; (member? 4 '(4 1 3))

