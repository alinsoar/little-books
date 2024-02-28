#lang racket

(define printf
  (lambda l
    (for-each (lambda (a)
                (display a)
                (display " "))
              l)
    (newline)))

(define call/cc
  (lambda (f)
    (lambda (k)
      (let ((ko (lambda (a)
                  (lambda (__)
                    (k a)))))
        (let ((ma (f ko)))
          (ma k))))))

(define return
  (lambda (v)
    (lambda (k)
      (k v))))

(define pipe
  (lambda (m q)
    (lambda (k)
      (m (lambda (p)
           ((q p)
            k))))))

(define product
  (lambda (ls exit)
    (cond ((null? ls)
           (return 1))
          ((pair? (car ls))
           (pipe (product (car ls) exit)
                 (lambda (a)
                   (pipe (product (cdr ls) exit)
                         (lambda (d)
                           (return (* a d)))))))
          ((null? (car ls))
           (product (cdr ls) exit))
          ((zero? (car ls))
           (exit 0))
          (else
           (pipe (product (cdr ls) exit)
                 (lambda (d)
                   (return (* (car ls) d))))))))

((call/cc (λ (out) (product '() out)))
 (λ (x ) x ))

((pipe (call/cc (λ (out)
                  (product '(5 0 5) out)))
       (λ (a) (return (add1 a))))
 (λ (x) x))

((call/cc (λ (out)
            (product '(2 3 (7 4 5 6) 8 (9) 2) out)))
 (lambda (x) x))

