#lang racket

(define printf
  (lambda l
    (for-each (lambda (a)
                (display a)
                (display " "))
              l)
    (newline)))

(define return-maybe
  (lambda (v)
    (cons 'Just v)))

(define pipe-maybe
  (lambda (m q)
    (printf "++" m)
    (if (eq? (car m) 'Just)
        (q (cdr m))
        m)))

(define assq
  (lambda (v p*)
    (printf ":" p*)
    (cond ((null? p*)
           '(Nothing))
          ((eq? (caar p*) v)
           (return-maybe (cdar p*)))
          (else
           (pipe-maybe
            (assq v (cdr p*))
            (lambda (a)
              (return-maybe a)))))))

(assq 8 '((9 . 4) (6 . 5) (8 . 2) (7 . 3)))
(assq 4 '((9 . 4) (6 . 5) (8 . 2) (7 . 3)))

