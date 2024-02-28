#lang racket

(define printf
  (lambda l
    (for-each (lambda (a)
                (display a)
                (display " "))
              l)
    (newline)))

(define data '(2 3 (7 4 5 6) 8 (9) 2))

(define return
  (lambda (v c)
    (lambda (k)
      (k v c))))

(define pipe
  (lambda (m q)
    (lambda (k)
      (m (lambda (v c)
           ((q v c) k))))))

(define rember/evensXcount/evens_k_monad
  (lambda (l)
    (cond ((null? l)
           (return '() 0))
          ((pair? (car l))
           (pipe (rember/evensXcount/evens_k_monad (car l))
                 (lambda (v1 c1)
                   (pipe (rember/evensXcount/evens_k_monad (cdr l))
                         (lambda (v2 c2)
                           (return (cons v1 v2)
                                   (+ c1 c2)))))))
          ((or (null? (car l)) (odd? (car l)))
           (pipe (rember/evensXcount/evens_k_monad (cdr l))
                 (lambda (v c)
                   (return (cons (car l) v)
                           c))))
          (else
           (pipe (rember/evensXcount/evens_k_monad (cdr l))
                 (lambda (v c)
                   (return v (add1 c))))))))

((rember/evensXcount/evens_k_monad data)
 (lambda (v c) (cons v c)))
