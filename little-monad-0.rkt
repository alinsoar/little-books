#lang racket

(pretty-print-columns 30)

(define rember8
  (lambda (l k)
    (cond ((null? l)
           (k '()))
          ((cons? (car l))
           (rember8 (car l)
                    (lambda (a)
                      (rember8 (cdr l)
                               (lambda (d)
                                 (k (cons a d)))))))
          ((= 8 (car l))
           (rember8 (cdr l) k))
          (else
           (rember8 (cdr l)
                    (lambda (d)
                      (k (cons (car l)
                               d))))))))

(define data0 '(1 2
                  (1 2 3 4 5 6
                     (1 2 3 4 5 6 7 8 9 0)
                     8 9 0)
                  4 5 6 7 8
                  (1 2 3 4 5 6 7 8 9 0)
                  0))
(define data1 '(1 2 3 4 5 6 7 8 9 0))

(define test
  (lambda (data)
    (rember8 data pretty-print)))
(test data0)


(define unit
  (lambda (v)
    (lambda (k)
      (k v))))

(define pipe
  (lambda (m q)
    (lambda (k)
      (m (lambda (v)
           ((q v) k))))))

(define rember//8
  (lambda (l)
    (cond ((null? l)
           (unit '(END)))
          ((cons? (car l))
           (pipe (rember//8 (car l))
                 (lambda (a) 
                   (pipe (rember//8 (cdr l))
                         (lambda (d)
                           (unit (cons a d)))))))
          ((= 8 (car l))
           (rember//8 (cdr l)))
          (else
           (pipe (rember//8 (cdr l))
                 (lambda (d)
                   (unit (cons (car l) d))))))))



(define test//
  (lambda (data)
    (display "test monad--")
    (display data)
    (newline)
    ((rember//8 data) pretty-print)))

(test// data0)
;; (test// data1)

