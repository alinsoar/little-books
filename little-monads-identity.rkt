
#lang racket

;;; Make experiments using
;;; 
;;; A Schemer’s View of Monads
;;; Daniel P. Friedman  &  Adam C. Foltzer
;;; 2010, 2011


(define p
  (lambda a
    (map (lambda (x)
           (display (~a x ":")))
         a)
    (newline)))

;;; IDENTITY MONAD
(begin
  (p "One")
  (p "Two"))

(p "IDENTITY-MONAD--BEGIN")
((lambda (_)
   (p "Two"))
 (p "One"))

(p)
(define mybegin
  (lambda (x f)
    (f x)))

(mybegin (p "One")
         (lambda (_) (p "Two")))

(p)
(mybegin (p "One")
         (lambda (_) (mybegin (p "Two")
                         (lambda (_) (p "Three")))))

(p "IDENTITY-MONAD--LET")

(let ([x 5])
  (+ x 3))

(p)
((lambda (x)
   (+ 3 x))
 5)

(define mylet
  (lambda (x f)
    (f x)))

(mylet 5
       (lambda (x) (+ x 3)))
(mylet 5
       (lambda (x)
         (mylet x
                (lambda (y)
                  (+ x y)))))

(p "IDENTITY-MONAD--BIND/UNIT")

(define bind-id
  (lambda (x sequel)
    (sequel x)))
(define unit-id
  (lambda (x)
    x))

(bind-id (p "One")
         (lambda (_)
           (bind-id (p "Two")
                    (lambda (_)
                      (unit-id (p "Three"))))))
(bind-id (unit-id 5)
         (lambda (x)
           (bind-id (unit-id x)
                    (lambda (y)
                      (unit-id (+ x y))))))
