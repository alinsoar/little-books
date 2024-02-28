
;;; given a list '(a b c) it returns '((1 a) (2 b) (3 c))

(load "libscm")

(define unit
  (lambda (v)
    (lambda (global)
      (cons global v))))

(define >>=
  (lambda (monadic sequel)
    (lambda (global)
      (let ((new-global:result (monadic global)))
        (let ((result (cdr new-global:result)))
          (let ((new/global (car new-global:result)))
            ((sequel result)
             new/global)))))))

(define monad
  (lambda (l)
    (if (null? l)
        (unit '())
        (>>= (lambda (count)
               (cons (+ 1 count) (list count (car l))))
             (lambda (v)
               (>>= (monad (cdr l))
                    (lambda (d)
                      (unit (cons v d)))))))))

(test ((monad '())
       0))

(test ((monad '(a b c d))
       0))

