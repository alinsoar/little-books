#lang racket

(define printf
  (lambda l
    (for-each (lambda (a) (display a) (display " "))
              l)
    (newline)))

((lambda _
   ((lambda _
      (printf "THREE"))
    (printf "TWO")))
 (printf "ONE"))

'---

(define seq
  (lambda (x f)
    (f x)))

(seq
 (printf "ONE")
 (lambda _
   (seq
    (printf "TWO")
    (lambda _
      (printf "THREE")))))

'---

(let ((x 5))
  (+ x 3))

'---

((lambda (x)
   (+ x 3))
 5)

'---

(define LET
  (lambda (x f)
    (f x)))

(LET
 5
 (lambda (x)
   (+ x 3)))

'---

(LET 5
     (lambda (x)
       (LET x
            (lambda (y)
              (+ x y)))))

'---

(define pipe-id
  (lambda (ma sequel)
    (sequel ma)))

(define unit-id
  (lambda (a)
    a))

(pipe-id (unit-id (printf "ONE"))
         (lambda _
           (pipe-id (unit-id (printf "TWO"))
                    (lambda _
                      (unit-id (printf "THREE"))))))

'---

(pipe-id (unit-id 5)
         (lambda (x)
           (pipe-id (unit-id x)
                    (lambda (y)
                      (+ x y)))))

'---






