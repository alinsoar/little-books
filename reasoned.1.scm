
(load "reasoned-mk.scm")

(run* (q) (== q 5))

(run* (q) FAIL)

(run* (q) (== #t q))

(run* (q) FAIL (== #t q))

(run* (q) SUCC (== #t q))

(run* (r) SUCC (== 'corn r))

(run* (r) FAIL (== 'corn r))

(run* (q) SUCC (== #f q))

(let ((x #t))
  (== #f x))

(let ((x #f))
  (== #f x))

(run* (x)
      (let ((x #f))
        (== #t x)))

(run* (q)
      (fresh (x)
             (== #t x)
             (== #t q)))

(run* (x)
      (== 2 3))

(run* (x)
      (== 2 2))

(run* (q)
      (fresh (x)
             (== x #t)
             (== #t q)))

(run* (q)
      (fresh (x)
             (== x #t)
             (== q #t)))

(run* (x)
      SUCC)

(reify-name 0)

(reify-name 2)

(run* (x)
      (let ((x #f))
        (fresh (x)
               (== #t x))))

(run* (r)
      (fresh (x y)
             (== (cons x (cons y '())) r)))

(run* (s)
      (fresh (t u)
             (== (cons t (cons u '())) SUCC)))

(run* (r)
      (fresh (x)
             (let ((y x))
               (fresh (x)
                      (== (cons y (cons x (cons y '())))
                          r)))))

(run* (r)
      (fresh (x)
             (let ((y x))
               (fresh (x)
                      (== (cons x (cons y (cons x '())))
                          r)))))

(run* (q)
      (== #f q)
      (== #t q))

(run* (q)
      (== #f q)
      (== #f q))

(run* (q)
      (let ((x q))
        (== #t x)))

(run* (r)
      (fresh (x)
             (== x r)))

(run* (q)
      (fresh (x)
             (== #t x)
             (== x q)))

(run* (q)
      (fresh (x)
             (== x q)
             (== #t x)))

(run* (q)
      (fresh (x)
             (== #t x)
             (== x q)))

(run* (q)
      (fresh (x)
             (== (eq? x q) q)))

(run* (q)
      (let ((x q))
        (fresh (q)
               (== (eq? x q) x))))

(cond (#f #t)
      (else #f))

(cond (#f SUCC)
      (else FAIL))

(conde (FAIL SUCC)
       (else FAIL))

(conde (FAIL FAIL)
       (else SUCC))

(conde (SUCC SUCC)
       (SUCC FAIL))

(run* (x)
      (conde ((== 'olive x) SUCC)
             ((== 'oil x) SUCC)
             (SUCC FAIL)))

(run1 (x)
      (conde ((== 'olive x) SUCC)
             ((== 'oil x) SUCC)
             (SUCC FAIL)))

(run* (x)
      (conde ((== 'virgin x) FAIL)
             ((== 'olive x) SUCC)
             (SUCC SUCC)
             ((== 'oil x) SUCC)
             (SUCC FAIL)))

(run2 (x)
      (conde ((== 'extra x) SUCC)
             ((== 'virgin x) FAIL)
             ((== 'olive x) SUCC)
             ((== 'oil x) SUCC)
             (SUCC FAIL)))

(run* (r)
      (fresh (x y)
             (== 'split x)
             (== 'pea y)
             (== (cons x (cons y'()))
                 r)))

(run* (r)
      (fresh (x y)
             (conde ((== 'split x) (== 'pea y))
                    ((== 'navy x) (== 'bean y))
                    (SUCC FAIL))
             (== (cons x (cons y '()))
                 r)))

(define teacup
  (lambda (x)
    (conde ((== 'tea x) SUCC)
           ((== 'cup x) SUCC)
           (SUCC FAIL))))

(run* (x)
      (teacup x))

(run* (r)
      (fresh (x y)
             (conde ((teacup x) (== #t y) SUCC)
                    ((== #f x) (== #t y))
                    (SUCC FAIL))
             (== (cons x (cons y '()))
                 r)))

'X

(run* (r)
      (fresh (x y z)
             (conde ((== y x) (fresh (x) (== z x)))
                    ((fresh (x) (== y x)) (== z x))
                    (SUCC FAIL))
             (== (cons y (cons z '()))
                 r)))

(run* (r)
      (fresh (x y z)
             (conde ((== y x) (fresh (x) (== x x)))
                    ((fresh (x) (== y x)) (== z x))
                    (SUCC FAIL))
             (== (cons y (cons z '()))
                 r)))

(run* (r)
      (fresh (x y z)
             (conde ((== y x) (fresh (x) (== z y)))
                    ((fresh (x) (== y x)) (== z x))
                    (SUCC FAIL))
             (== (cons y (cons z '()))
                 r)))

(run* (r)
      (fresh (x y z)
             (conde ((== y x) (fresh (x) (== z y)))
                    (SUCC FAIL))
             (== (cons y (cons z '()))
                 r)))

(run* (r)
      (fresh (x y z)
             (conde ((== y x) (fresh (x) (== z x)))
                    ((fresh (x) (== y x)) (== z x))
                    (SUCC FAIL))
             (== #f x)
             (== (cons y (cons z '()))
                 r)))

(run* (q)
      (let ((a (== #t q))
            (b (== #f q)))
        b))

'X

(run* (q)
      (let ((a (== #t q))
            (b (fresh (x)
                      (== x q)
                      (== #f x)))
            (c (conde ((== #t q) SUCC)
                      (SUCC (== #f q)))))
        b))

(run* (q)
      (fresh (x)
             (== x q)
             (== #f x)))


(run* (q)
      (let ((a (== #t q))
            (b (fresh (x)
                      (== x q)
                      (== #t x)))
            (c (conde ((== #t q) SUCC)
                      (SUCC (== #f q)))))
        b))

(run* (q)
      (let ((a (== #t q))
            (b (fresh (x)
                      (== x q)
                      (== 'OK x)))
            (c (conde ((== #t q) SUCC)
                      (SUCC (== #f q)))))
        b))

(run* (q)
      (fresh (x)
             (== x q)
             ;; (== 'OK x)
             ))

(run* (q)
      (fresh (x)
             (== x q)
             (== 'OK x)))

(run* (q)
      (fresh (x)
             (== q #t)
             (== x q)
             (== 'OK x)))
