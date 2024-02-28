#lang racket

(define printf
  (lambda l
    (for-each (lambda (a) (display a) (display " "))
              l)
    (newline)))

(define rember/evensXcount/evens__2pass
  (lambda (l)
    (cons (rember/evens__direct l)
          (count/evens__direct l))))

(define rember/evens__direct
  (lambda (l)
    (cond ((null? l)
           '())
          ((pair? (car l))
           (cons (rember/evens__direct (car l))
                 (rember/evens__direct (cdr l))))
          ((or (null? (car l))
               (odd? (car l)))
           (cons (car l)
                 (rember/evens__direct (cdr l))))
          (else (rember/evens__direct (cdr l))))))

(define count/evens__direct
  (lambda (l)
    (cond ((null? l)
           0)
          ((pair? (car l))
           (+ (count/evens__direct (car l))
              (count/evens__direct (cdr l))))
          ((or (null? (car l))
               (odd? (car l)))
           (count/evens__direct (cdr l)))
          (else (add1 (count/evens__direct (cdr l)))))))

(define data '(2 3 (7 4 5 6) 8 (9) 2))
(rember/evensXcount/evens__2pass data)

(define rember/evensXcount/evens__cps
  (lambda (l k)
    (cond ((null? l)
           (k '() 0))
          ((pair? (car l))
           (rember/evensXcount/evens__cps
            (car l)
            (lambda (v1 c1)
              (rember/evensXcount/evens__cps
               (cdr l)
               (lambda (v2 c2)
                 (printf "cps --  +" (+ c1 c2))
                 (k (cons v1 v2) (+ c1 c2)))))))
          ((or (null? (car l)) (odd? (car l)))
           (rember/evensXcount/evens__cps
            (cdr l)
            (lambda (v c)
              (k (cons (car l) v) c))))
          (else
           (rember/evensXcount/evens__cps
            (cdr l)
            (lambda (v c)
              (printf "cps -- 1+" (add1 c))
              (k v (add1 c))))))))

(rember/evensXcount/evens__cps
 data
 (lambda (x y) (cons x y)))

(define return
  (lambda (v)
    (lambda (s)
      (cons v s))))

(define pipe
  (lambda (m q)
    (lambda (s)
      (let ((pair (m s)))
        (let ((w (q (car pair))))
          (w (cdr pair)))))))

(define rember/evens
  (lambda (l)
    (cond ((null? l)
           (return '()))
          ((pair? (car l))
           (pipe (rember/evens (car l))
                 (lambda (a)
                   (pipe (rember/evens (cdr l))
                         (lambda (d)
                           (return (cons a d)))))))
          ((or (null? (car l))
               (odd? (car l)))
           (pipe (rember/evens (cdr l))
                 (lambda (d)
                   (return (cons (car l) d)))))
          (else
           (rember/evens (cdr l))))))

((rember/evens data) 0)
;; (rember/evens data)

(define rember/evensXcount/evens
  (lambda (l)
    (cond ((null? l)
           (return '()))
          ((pair? (car l))
           (pipe (rember/evensXcount/evens (car l))
                 (lambda (a)
                   (pipe (rember/evensXcount/evens (cdr l))
                         (lambda (d)
                           (return (cons a d)))))))
          ((or (null? (car l))
               (odd? (car l)))
           (pipe (rember/evensXcount/evens (cdr l))
                 (lambda (d)
                   (return (cons (car l) d)))))
          (else
           (pipe (lambda (s)
                   (printf "monad -- 1+" (add1 s))
                   (cons '_ (add1 s)))
                 (lambda (v)
                   (rember/evensXcount/evens (cdr l))))))))

((rember/evensXcount/evens data) 0)


