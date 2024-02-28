
;;; returns the list (a1+0^2 a2+1^2 0 a_i + i^2 ...), given a list (a1
;;; a2 a3 ...).  returns 0 on each index multiple of 3. remove
;;; negative elements.

(load "libscm")

(define unit
  (lambda (val)
    (lambda (g)
      (cons g val))))

(define >>=
  (lambda (monadic sequel)
    (lambda (l)
      (let ((pair (monadic l)))
        (let ((new/global (car pair))
              (val (cdr pair)))
          ((sequel val)
           new/global))))))

(define f+x2
  (lambda (l)
    (if (null? l)
        (unit '())
        (>>= (lambda (g)
               (cons (+ g 1) (if (zero? (remainder g 3))
                                 0
                                 (* g g))))
             (lambda (x2)
               (>>= (f+x2 (cdr l))
                    (lambda (d)
                      (unit
                       (cons (+ x2 (car l)) d)))))))))

(test ((f+x2 '()) 0))
(test ((f+x2 '(0 0 0 0 0 0 0 0 0 0 0 0)) 0))
(test ((f+x2 '(1 2 3)) 0))


