#lang racket

(define printf
  (lambda l
    (for-each (lambda (a)
                (display a)
                (display " "))
              l)
    (newline)))

(define data
  '(2 3 (7 4 5 6) 8 (2) (9) 2 0))

(define return
  (lambda (v)
    (lambda (s)
      (cons v s))))

(define pipe
  (lambda (m q)
    (lambda (s)
      (let ((pair (m s)))
        (let ((state (cdr pair))
              (val (car pair)))
          ;; (printf "@@@@" state)
         (let ((w (q val)))
           (w state)))))))

(define rember/evensXcount/evens
  (lambda (l)
    ;; (printf "--" (and (cons? l) (car l)))
    (cond ((null? l)
           (return '()))
          ((pair? (car l))
           (pipe (rember/evensXcount/evens (car l))
                 (lambda (a)
                   (pipe (rember/evensXcount/evens (cdr l))
                         (lambda (d)
                           (return (cons a d)))))))
          ((or (null? (car l)) (odd? (car l)))
           (pipe (lambda (s)
                   ;; (printf "==" (car l) s)
                   (cons '_ (list (car s)
                                  (if (null? (car l))
                                      (cadr s)
                                      0)
                                  (max (caddr s) (cadr s)))))
                 (lambda _
                   (pipe (rember/evensXcount/evens (cdr l))
                         (lambda (d)
                           (return (cons (car l) d)))))))
          (else
           (pipe (lambda (s)
                   ;; (printf "~~" (car l) s)
                   (cons '_ (list (add1 (car s))
                                  (add1 (cadr s))
                                  (caddr s))))
                 (lambda (v)
                   (rember/evensXcount/evens (cdr l))))))))

((rember/evensXcount/evens data) '(0 0 0 ()))
(~a ":" data)

