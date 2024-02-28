#lang racket

(define printf
  (lambda l
    (for-each (lambda (a) (display a) (display " "))
              l)
    (newline)))

(define even-len?
  (lambda (ls)
    (cond ((null? ls) #t)
          (else (not (even-len? (cdr ls)))))))

(even-len? '(1 2 3 4))
(even-len? '(1 2 3 4 5))

'---

(define even-len/?
  (lambda (ls s)
    (cond ((null? ls) s)
          (else (even-len/? (cdr ls) (not s))))))

(even-len/? '(1 2 3 4) #t)
(even-len/? '(1 2 3 4 5) #t)

'---

(define even-len?__state
  (lambda (ls)
    (if (null? ls)
        (unit-state '_)
        (pipe-state (lambda (s)
                      (cons '__ (not s)))
                    (lambda _
                      (even-len?__state (cdr ls)))))))

(define unit-state
  (lambda (v)
    (lambda (s)
      (cons v s))))

(define pipe-state
  (lambda (m w)
    (lambda (s)
      (let ((p (m s)))
        (let ((val (car p))
              (state (cdr p)))
          (let ((q (w val)))
            (q state)))))))

(even-len?__state '(1 2 3 4 5))
((even-len?__state '(1 2 3 4 5)) #t)
((even-len?__state '(1 2 3 4)) #t)

