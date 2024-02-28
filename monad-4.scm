
;;; remove the elements of a list that accomplish a predicate and
;;; accummulate the removed elements in another list in correct order

(load "libscm")
(load-option 'format)

(define unit
  (lambda (v)
    (lambda (k)
      (cons k v))))

(define >>=
  (lambda (monadic sequel)
    (lambda (k/global)
      (let ((new/k/global:result (monadic k/global)))
        (let ((new/k/global (car new/k/global:result))
              (result (cdr new/k/global:result)))
          ((sequel result) new/k/global))))))

(define remove/predicate
  (lambda (l pred?)
    (cond ((null? l)
           (unit '()))
          ((pred? (car l))
           (>>= (lambda (k)
                   (cons (lambda (g)
                           (k (cons (car l) g)))
                         '__))
                (lambda (__)
                  (remove/predicate (cdr l) pred?))))
          (else
           (>>= (remove/predicate (cdr l) pred?)
                (lambda (d)
                  (unit (cons (car l) d))))))))

(define k/test
  (lambda (l pred?)
    (let ((a ((remove/predicate l pred?)
              (lambda (x) x))))
      (let ((k (car a))
            (res (cdr a)))
        (test l (k '()) res)))))

(k/test '(1 3 5 7 9) odd?)

(k/test '(2 4 6 8) odd?)

(k/test '(1 2 3 4 5 6 7 8 9) odd?)


