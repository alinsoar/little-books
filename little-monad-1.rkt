#lang racket

(pretty-print-columns 30)

(define traverse
  (lambda (t s)
    (cond ((null? t)
           (cons '(END) s))
          ((integer? t)
           (let ((m (max t s)))
             (cons m m)))
          (else
           (let ((l (traverse (car t) s)))
             (let ((r (traverse (cdr t) (cdr l))))
               (cons (cons (car l) (car r))
                     (cdr r))))))))

(define data0 '(1 0 2 1 3 7 4 5 6 9 0 1 2 3))
(define data1 '(1 0 2 1
                  (1 0 2 1 3 7 4 5 6  0 1 2 3)
                  3 7 4 5 6 9 0 1 2 3))

(define test
  (lambda (data)
    (display data)
    (newline)
    (pretty-print
     (car (traverse data 0)))))

;; (test data1)
;; (test data0)

(define unit
  (lambda (v)
    (lambda (s)
      (cons v s))))
(define unit-max
  (lambda (v)
    (lambda (s)
      (let ((m (max v s)))
        (cons m m)))))
(define pipe
  (lambda (m w)
    (lambda (s)
      (let ((l (m s)))
        ((w (car l)) (cdr l))))))

(define traverse//
  (lambda (t)
    (cond ((null? t) (unit '(END)))
          ((integer? t) (unit-max t))
          (else
           (pipe (traverse// (car t))
                 (lambda (a)
                   (pipe (traverse// (cdr t))
                         (lambda (d)
                           (unit (cons a d))))))))))

(define test//
  (lambda (data)
    (display data)
    (newline)
    (pretty-print
     (car ((traverse// data) 0)))
    (equal?
     (car ((traverse// data) 0))
     (car (traverse data 0)))))

;; (test// data1)
;; (test data0)


(define unit///
  (lambda (v)
    (lambda (s)
      (cons v s))))

(define unit-max///
  (lambda (v)
    (lambda (s)
      (cons (max v s) (max v s)))))

(define pipe///
  (lambda (m q)
    (lambda (s)
      (let ((pair (m s)))
        (let ((w (q (car pair))))
          (w (cdr pair)))))))

(define traverse///
  (lambda (t)
    (cond ((null? t) (unit/// '(END)))
          ((integer? t) (unit-max/// t))
          (else
           (pipe/// (traverse/// (car t))
                    (lambda (a)
                      (pipe/// (traverse/// (cdr t))
                               (lambda (d)
                                 (unit (cons a d))))))))))

(define test///
  (lambda (data)
    (display data)
    (newline)
    (pretty-print
     (car ((traverse/// data) 0)))
    (equal?
     (car ((traverse/// data) 0))
     (car (traverse data 0)))))

(test/// data1)
