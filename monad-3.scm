
;;; remove the elements of a list that accomplish a predicate and
;;; accummulate the removed elements in another list in reversed order

(load "libscm")

(define unit
  (lambda (v)
    (lambda (g)
      (cons g v))))

(define >>=
  (lambda (monadic sequel)
    (lambda (global)
      (let ((new/global:result (monadic global)))
        (let ((new/global (car new/global:result))
              (result (cdr new/global:result)))
          ((sequel result)
           new/global))))))

(define remove/predicate
  (lambda (l pred?)
    (cond ((null? l)
           (unit '()))
          ((pred? (car l))
           (>>= (lambda (g)
                  (list (cons (car l) g)))
                (lambda (__)
                  (remove/predicate (cdr l) pred?))))
          (else
           (>>= (remove/predicate (cdr l) pred?)
                (lambda (d)
                  (unit (cons (car l) d))))))))

(test ((remove/predicate '() odd?) '()))

(test ((remove/predicate '(2 4 6 8) odd?) '()))

(test ((remove/predicate '(1 2 3 4 5 6 7 8 9) odd?) '()))


