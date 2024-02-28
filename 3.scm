;;; -*- buffer-read-only:t -*-

(load "2.scm")

(define (rember a lat)
  "remove the first occurence of a member"
  (cond ((null? lat) '())
	((eq? a (car lat)) (cdr lat))
	(else (cons (car lat)
		    (rember a (cdr lat))))))

;;; (rember 'min '(lamb chops and mint jelly))

(define (firsts l)
  (cond ((null? l) l)
	(else (cons (car (car l))
		    (firsts (cdr l))))))

(define (seconds l)
  (cond ((null? l) l)
	(else (cons (car (cdr (car l)))
		    (seconds (cdr l))))))

;; (firsts '((a 1)
;; 	  (b 2)
;; 	  (c 3)
;; 	  (d 4) ) )

;; (seconds '((a 1)
;; 	   (b 2)
;; 	   (c 3)
;; 	   (d 4) ) )

(define (insertR new old lat)
  "insert `new` at the right of the first occurrece of `old` in `lat`"
  (cond ((null? lat) '())
	((eq? old (car lat))
	 (cons old (cons new (cdr lat))))
	(else (cons (car lat)
		    (insertR new old (cdr lat))))))

;;; (insertR 'e 'x '(a b c d f g h))

(define (insertL new old lat)
  "insert `new` at the left of the first occurrece of `old` in `lat`"
  (cond ((null? lat) '())
	((eq? old (car lat))
	 (cons new lat))
	(else (cons (car lat)
		    (insertL new old (cdr lat))))))

;;; (insertL 'e 'f '(a b c d f g h))

(define (subst new old lat)
  "substitute first occurrece of `old` with `new` in `lat`"
  (cond ((null? lat) '())
	((eq? old (car lat))
	 (cons new (cdr lat)))
	(else (cons (car lat)
		    (subst new old (cdr lat))))))

;;; (subst 'x 'a '(a b c d f g h))

(define (subst2 new o1 o2 lat)
  "substitute first occurrece of `o1` or `o2` with `new` in `lat`"
  (cond ((null? lat) '())
	((or (eq? o1 (car lat))
	     (eq? o2 (car lat)))
	 (cons new (cdr lat)))
	(else (cons (car lat)
		    (subst2 new o1 o2 (cdr lat))))))

;;; (subst2 'x 'h 'c '(a b c d f g h))

(define (multirember a lat)
  "removes all occurrences of `a` from `lat`"
  (cond ((null? lat) '())
	((eq? (car lat) a)
	 (multirember a (cdr lat)))
	(else (cons (car lat)
		    (multirember a (cdr lat))))))

;;; (multirember 'a '(a b c a x a y z a))

(define (multiinsertR new old lat)
  (cond ((null? lat) '())
	((eq? (car lat) old)
	 (cons old (cons new (multiinsertR new old (cdr lat)))))
	(else (cons (car lat)
		    (multiinsertR new old (cdr lat))))))

;;; (multiinsertR 'w 'a '(a b c a d a f g a))

(define (multiinsertL new old lat)
  (cond ((null? lat) '())
	((eq? (car lat) old)
	 (cons new (cons old (multiinsertL new old (cdr lat)))))
	(else (cons (car lat)
		    (multiinsertL new old (cdr lat))))))

;;; (multiinsertL 'w 'a '(a b c a d a f g a))

(define (multisubst new old lat)
  (cond ((null? lat) '())
	((eq? (car lat) old)
	 (cons new (multisubst new old (cdr lat))))
	(else (cons (car lat)
		    (multisubst new old (cdr lat))))))

;;; (multisubst 'w 'a '(a b c a d a f g a))
