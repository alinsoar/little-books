#lang racket

(define receiver
  (lambda (continuation)
    (continuation continuation)))

(define tester0 (lambda (x) (display 0) (newline)))
(define tester1 (lambda (x) (display 1) (newline)))
(define tester2 (lambda (x) (display 2) (newline) (display x) (newline)))

(define tester
  (lambda (continuation)
    (display "beginning\n")
    (tester0 (call/cc continuation))
    (display "middle\n")
    (tester1 (call/cc continuation))
    (display "end\n")
    ':done))

(module+ test
  (tester2 (tester (call/cc receiver)))
  'done)



