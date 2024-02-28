;;; -*- buffer-read-only:t -*-

(load "17.scm")

(define lots
  (lambda (m)
    (cond ((zero? m) '())
	  (else (kons 'egg
		      (lots (sub1 m)))))))

(define lenkth
  (lambda (l)
    (cond ((null? l) 0)
	  (else (add1 (lenkth (kdr l)))))))

(define kounter)

(define set-kounter)

;; (define konsC
;;   (let ((N 0))
;;     (set! kounter
;; 	  (lambda () N))
;;     (set! set-kounter
;; 	  (lambda (x)
;; 	    (set! N x)))
;;     (lambda (x y)
;;       (set! N (add1 N))
;;       (kons x y))))

(define add-at-end
  (lambda (l)
    (cond ((null? (kdr l))
	   (konsC (kar l)
		  (kons 'egg
			'())))
	  (else (konsC (kar l)
		       (add-at-end (kdr l)))))))

(define add-at-end-too
  (lambda (l)
    (letrec ((A (lambda (ls)
		  (cond ((null? (kdr ls))
			 (set-kdr ls (kons 'egg '())))
			(else (A (kdr ls)))))))
      (A l)
      l)))

;; (define kons
;;   (lambda (kar kdr)
;;     (lambda (selector)
;;       (selector kar kons))))

;; (define kar
;;   (lambda (c)
;;     (c (lambda (a d) a))))

;; (define kdr
;;   (lambda (c)
;;     (c (lambda (a d) d))))

(define bons
  (lambda (kar)
    (let ((kdr '()))
      (lambda (selector)
	(selector
	 (lambda (x)
	   (set! kdr x))
	 kar
	 kdr)))))

(define kar
  (lambda (c)
    (c (lambda (s a d) a))))

(define kdr
  (lambda (c)
    (c (lambda (s a d) d))))

(define set-kdr
  (lambda (c x)
    ((c (lambda (s a d) s)) x)))

(define kons
  (lambda (a d)
    (let ((c (bons a)))
      (set-kdr c d)
      c)))

(define konsC
  (let ((N 0))
    (set! kounter
	  (lambda () N))
    (set! set-kounter
	  (lambda (x)
	    (set! N x)))
    (lambda (x y)
      (set! N (add1 N))
      (kons x y))))

;;; (kons 3 4)

;;; (lots 3)

;;; (lenkth (lots 4))

(define dozen (lots 12))

(define bakers-dozen (add-at-end dozen))

(define bakers-dozen-too (add-at-end-too dozen))

(define bakers-dozen-again (add-at-end dozen))

(define eklist?
  (lambda (l1 l2)
    (cond ((null? l1) (null? l2))
	  ((null? l2) false)
	  (else (and (eq? (kar l1)
			  (kar l2))
		     (eklist? (kdr l1)
			      (kdr l2)))))))

(define same?
  (lambda (c1 c2)
    (let ((t1 (kdr c1))
	  (t2 (kdr c2)))
      (set-kdr c1 1)
      (set-kdr c2 2)
      ;; (newline) (pp (kar c1))
      ;; (newline) (pp (kar c2))
      ;; (newline) (pp (kdr c1))
      ;; (newline) (pp (kdr c2))
      ;; (newline)
      (let ((v (o= (kdr c1)
		   (kdr c2))))
	(set-kdr c1 t1)
	(set-kdr c2 t2)
	v))))

;;; (display "************************")

;;; (same? bakers-dozen bakers-dozen-too)

;;; (kar bakers-dozen)

;;; (kar bakers-dozen-too)

;;; (kdr bakers-dozen)

;;; (bons 'egg)

;;; (kar (bons 'egg))

;;; (kdr (bons 'egg))

;;; (kdr (kdr (lots 2)))

;;; (kar (kons 1 2))

;;; (kdr (kons 1 2))

;;; (lots 12)

;;; (kounter)

;;; (set-kounter 0)

(define last-kons
  (lambda (ls)
    (cond ((null? (kdr ls))
	   ls)
	  (else (last-kons (kdr ls))))))

;;; (last-kons (lots 4))

;; (pp (lots 4))

;;; (null? (kdr (kdr (lots 2))))

(define finite-lenkth
  (lambda (p)
    (call-with-current-continuation
     (lambda (infinite)
       (letrec ((C (lambda (p q)
		     (cond ((same? p q) (infinite false))
			   ((null? q) 0)
			   ((null? (kdr q)) 1)
			   (else (o+ (C (sl p)
					(qk q))
				     2))))))
	 (qk (lambda (x) (kdr (kdr x))))
	 (sl (lambda (x) (kdr x))))
       (cond ((null? p) 0)
	     (else (add1 (C p (kdr p)))))))))









