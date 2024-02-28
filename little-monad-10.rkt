#lang racket

(define printf
  (lambda l
    (for-each (lambda (a)
                (display a)
                (display " "))
              l)
    (newline)))

(define run
  (lambda (ma v)
    (ma v)))

(define ask
  (lambda (v)
    v))

(define return
  (lambda (a)
    (lambda (v)
      a)))

(define pipe
  (lambda (ma q)
    (lambda (v)
      (let ((a (ma v)))
        (let ((mb (q a)))
          (mb v))))))

(define multbydepth
  (lambda (ls)
    (cond ((null? ls)
           (return '()))
          ((cons? (car ls))
           (pipe ask
                 (lambda (v)
                   (let ((a (run (multbydepth (car ls))
                                 (add1 v))))
                     (pipe (multbydepth (cdr ls))
                           (lambda (d)
                             (return (cons a d))))))))
          (else
           (pipe ask
                 (lambda (v)
                   (pipe (multbydepth (cdr ls))
                         (lambda (d)
                           (return (cons (* (car ls) v) d))))))))))

(run (multbydepth '(1 2 3 4)) 1)
(run (multbydepth '(1 (2) 3 4)) 1)
(run (multbydepth '(1 ((2) 3) 4)) 1)

