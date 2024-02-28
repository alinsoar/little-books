#lang racket

(define printf
  (lambda l
    (for-each (lambda (a)
                (display a)
                (display " "))
              l)
    (newline)))

(define return
  (lambda (a)
    (cons a '())))

(define pipe
  (lambda (ma q)
    (let ((a (car ma)))
      (let ((mb (q a)))
        (let ((b (car mb)))
          (cons b (append (cdr ma) (cdr mb))))))))

(define reciprocals
  (lambda (ls)
    (cond ((null? ls)
           (return '()))
          ((zero? (car ls))
           (pipe '(_ . ("Saw a 0."))
                 (lambda _
                   (reciprocals (cdr ls)))))
          (else
           (pipe (reciprocals (cdr ls))
                 (lambda (d)
                   (return (cons (/ 1 (car ls)) d))))))))

(reciprocals '(1 2 3 4))
(reciprocals '(1 2 3 0 4 0 0 5 6 7))

