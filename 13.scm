;;; -*- buffer-read-only:t -*-

(load "12.scm")

(define intersect
  (lambda (set1 set2)
    (letrec ((i (lambda (s1)
		  (cond ((null? s1)
			 '())
			((member? (car s1) set2)
			 (cons (car s1)
			       (i (cdr s1))))
			(else (i (cdr s1)))))))
      (i set1))))

;;; (intersect '(a b c) '(c d a))

(define intersectall
  (lambda (l-set)
    "from little"
    (cond ((null? (cdr l-set))
	   (car l-set))
	  (else (intersect (car l-set)
			   (intersectall (cdr l-set)))))))

;;; (intersectall '((a b c) (a d e b) (a b d)))

(define intersectall
  (lambda (l-set)
    (cond ((null? l-set) '())
	  ((null? (cdr l-set))
	   (car l-set))
	  (else (intersect (car l-set)
			   (intersectall (cdr l-set)))))))

;;; (intersectall '((a b c) (a d e b) (a b d)))
;;; (intersectall '())
;;; (intersectall '((a b c)))

(define intersectall
  (lambda (l-set)
    (letrec ((i-a (lambda (ls)
		    (cond ((null? (cdr ls))
			   (car ls))
			  (else (intersect (car ls)
					   (i-a (cdr ls))))))))
      (cond ((null? l-set) '())
	    (else (i-a l-set))))))

;;; (intersectall '((a b c) ( d e ) (a b d)))
;;; (intersectall '())
;;; (intersectall '((a b c)))

(define intersectall
  (lambda (l-set)
    (call-with-current-continuation
     (lambda (hop)
       (letrec ((i-a (lambda (ls)
		       (cond ((null? (car ls))
			      '(display "\nhop!\n")
			      (hop '()))
			     ((null? (cdr ls))
			      (car ls))
			     (else (intersect (car ls)
					      (i-a (cdr ls))))))))
	 (cond ((null? l-set) '())
	       (else (i-a l-set))))))))

;;; (intersectall '((a b c) () ( d e ) (a b d)))
;;; (intersectall '())
;;; (intersectall '((a b c)))

(define intersectall
  (lambda (l-set)
    (letrec ((i-a (lambda (ls)
		    (cond ((null? (cdr ls))
			   (car ls))
			  (else (int (car ls)
				     (i-a (cdr ls)))))))
	     (int (lambda (set1 set2)
		    (letrec ((i (lambda (s1)
				  (cond ((null? s1)
					 '())
					((member? (car s1) set2)
					 (cons (car s1)
					       (i (cdr s1))))
					(else (i (cdr s1)))))))
		      (i set1)))))
      (cond ((null? l-set) '())
	    (else (i-a l-set))))))

;;; (intersectall '((a b c) ( d e ) (a b d)))
;;; (intersectall '())
;;; (intersectall '((a b c)))

(define intersectall
  (lambda (l-set)
    (call-with-current-continuation
     (lambda (hop)
       (letrec ((i-a (lambda (ls)
		       (cond ((null? (cdr ls))
			      (car ls))
			     (else (i (car ls)
				      (i-a (cdr ls)))))))
		(i (lambda (set1 set2)
		     (letrec ((j (lambda (s1)
				   (cond ((null? s1)
					  '())
					 ((member? (car s1) set2)
					  (cons (car s1)
						(j (cdr s1))))
					 (else (j (cdr s1)))))))
		       (cond ((null? set2)
			      (display "\n...hop!\n")
			      (hop '()))
			     ((null? set1)
			      (display "\n ..hop!\n")
			      (hop '()))
			     (else (j set1)))))))
	 (cond ((null? l-set) '())
	       (else (i-a l-set))))))))

;;; (intersectall '((a) (a b c) ( d e ) (a b d)))
;;; (intersectall '())
;;; (intersectall '((a b c) () (a d e) (a b c) (a)))
;;; (intersectall '((a) (a b c) (d e)))

(define rember
  (lambda (a l)
    (cond ((null? l) '())
	  ((eq? a (car l))
	   (cdr l))
	  (else (cons (car l)
		      (rember a (cdr l)))))))

(define rember
  (lambda (a lat)
    (letrec ((r (lambda (l)
		  (cond ((null? l) '())
			((eq? a (car l))
			 (cdr l))
			(else (cons (car l)
				    (r (cdr l))))))))
      (r lat))))

;;; (rember 'a '(a a a))

(define rember-beyond-first
  (lambda (a lat)
    (letrec ((r (lambda (l)
		  (cond ((null? l) '())
			((eq? a (car l))
			 '())
			(else (cons (car l)
				    (r (cdr l))))))))
      (r lat))))

;;; (rember-beyond-first 'a '(a a a))

(define rember-upto-last
  (lambda (a lat)
    (call-with-current-continuation
     (lambda (jump)
       (letrec ((r (lambda (l)
		     (cond ((null? l) '())
			   ((eq? a (car l))
			    (jump (r (cdr l))))
			   (else
			    (cons (car l)
				  (r (cdr l))))))))
	    (r lat))))))

;;; (rember-upto-last 'a '(a a a b))
