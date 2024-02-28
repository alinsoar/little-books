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
    `(Success ,a)))

(define pipe
  (lambda (m q)
    (if (eq? (car m) 'Success)
        (q (cadr m))
        m)))

(define parse-hex
  (lambda (c* pos n)
    (if (null? c*)
        (return n)
        (pipe (char-hex=>integer (car c*)
                                 pos)
              (lambda (a)
                (parse-hex (cdr c*)
                           (add1 pos)
                           (+ (* n 16) a)))))))
(define char-hex?
  (λ (c)
    (or (char-numeric? c) (char<=? #\a c #\f))))

(define char-hex=>integer
  (λ (c pos)
    (if (char-hex? c)
        (return (char-hex=>integer/safe c))
        `(Exception
          ,(~a "At index  " pos " : bad char "
               c)))))

(define char-hex=>integer/safe
  (λ (c)
    (- (char->integer c)
       (if (char-numeric? c)
           (char->integer #\0)
           (- (char->integer #\a)
              10)))))

(parse-hex (string->list "ab") 0 0)
(parse-hex (string->list "a5bex21b") 0 0)
