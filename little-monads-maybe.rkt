#lang racket

;;; Make experiments using
;;; 
;;; A Schemer’s View of Monads
;;; Daniel P. Friedman  &  Adam C. Foltzer
;;; 2010, 2011

;;; MAYBE MONAD

(define unit
  (lambda (a)
    (cons a '_)                     ; <= This is a monad. It's a pair.
    ))

(define star
  (lambda (sequel)
    (lambda (ma)
      (if (eq? (cdr ma) '_)         ; <= This is a monad. It's a pair.
          (let* ((pure (car ma)))
            (sequel pure))
          ma))))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define assq
  (lambda (v a)
    (cond ((null? a)
           '(_ . not-found))
          ((eq? (caar a) v)
           (unit (cdar a)))
          (else
           ((star (lambda (x) (unit x)))
            (assq v (cdr a)))))))

(module+ test
  (assq 10 '((1 . 10) (2 . 20) (3 . 30) (10 . 50)))
  (assq 11 '((1 . 10) (2 . 20) (3 . 30) (10 . 50))))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define unit2
  (lambda (a)
    (lambda ()                        ; <= This is a monad-A. It's a thunk.
      (cons a '_)
      )))

(define star2
  (lambda (sequel)
    (lambda (ma)
      (lambda ()                      ; <= This is a monad-A. It's a thunk.
        (let ((pair (ma)))
          (define-values (pure extra) (values (car pair) (cdr pair)))
          (if (eq? extra '_)
              (sequel pure)
              pair))))))

(define assq2
  (lambda (v a)
    (cond ((null? a)
           (lambda ()
             '(_ . not-found)))
          ((eq? (caar a) v)
           (unit2 (cdar a)))
          (else
           ((star2 (lambda (x) (unit x)))
            (assq2 v (cdr a)))))))

((assq2 10 '((1 . 10) (2 . 20) (3 . 30) (10 . 50) (20 . 44))))
((assq2 11 '((1 . 10) (2 . 20) (3 . 30) (10 . 50))))


