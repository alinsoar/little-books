
;;; multiply odd elements of a list by 2

(load "libscm")

(define unit
  (lambda (v)
    (lambda (g)
      (cons v g))))

(define >>=
  (lambda (monadic sequel)
    (lambda (global)
      (let ((pair (monadic global)))
        (let ((result (car pair))
              (new/global (cdr pair)))
          ((sequel result)
           new/global))))))

(define mul2
  (lambda (l)
    (cond ((null? l)
           (unit '()))
          ((odd? (car l))
           (>>= (mul2 (cdr l))
                (lambda (d)
                  (unit (cons (* 2 (car l)) d)))))
          (else
           (>>= (mul2 (cdr l))
                (lambda (d)
                  (unit (cons (car l) d))))))))


(test ((mul2 '()) '_))
(test ((mul2 '(1)) '_))
(test ((mul2 '(1 2 3)) '_))





