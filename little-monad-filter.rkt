#lang racket/base

(define unit
  (lambda (v)
    (lambda (state)
      (cons v state))))

(define pipe
  (lambda (ma sequel)
    (lambda (state)
      (let ((next/state (ma state)))
        (let ((a (car next/state))
              (b (cdr next/state)))
          (let ((mb (sequel a)))
            (mb b)))))))

(define filter
  (lambda (l p?)
    (cond ((null? l) (unit '()))
          ((pair? (car l))
           (pipe (filter (car l) p?)
                 (lambda (v1)
                   (filter (cdr l) p?)
                   (lambda (v2)
                     (unit (cons v1 v2))))))
          ((p? (car l))
           (pipe (filter (cdr l) p?)
                 (lambda (v)
                   (unit (cons (car l) v)))))
          (else
           (pipe (filter (cdr l) p?) unit)))))


((filter '(1 2 3) odd?) 'not-used)


(define unit2
  (lambda (x y)
    (lambda (state)
      (cons (cons x y) state))))

(define pipe2
  (lambda (ma sequel)
    (lambda (state)
      (let ((next-state (ma state)))
        (let ((a (caar next-state))
              (b (cdar next-state))
              (s (cdr next-state)))
          (let ((mb (sequel a b)))
            (mb s)))))))

(define split
  (lambda (l p?)
    (cond ((null? l)
           (unit2 '() '()))
          ((pair? (car l))
           (pipe2 (split (car l) p?)
                  (lambda (a1 a2)
                    (pipe2 (split (cdr l) p?)
                           (lambda (d1 d2)
                             (unit2 (cons a1 d1) (cons a2 d2)))))))
          ((p? (car l))
           (pipe2 (split (cdr l) p?)
                  (lambda (a d)
                    (unit2 (cons (car l) a) d))))
          (else (pipe2 (split (cdr l) p?)
                       (lambda (a d)
                         (unit2 a (cons (car l) d))))))))


((split '(1 2 3 4 5) odd?) 'x)
