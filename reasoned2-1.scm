;;;  -*- mode:scheme; buffer-read-only:t -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run* q FAIL)

(== 'pea 'pod)

(run* q
      (== 'pea 'pod))

(run* q
      (== q 'pea))

(run* q
      (== 'pea q))

(run* q
      SUCC)

(run* q
      (== 'pea 'pea))

(run* q
      (== q q))

(run* q
      (fresh (x)
             (== 'pea q)))

(run* q
      (fresh (x)
             (== 'pea x)))

(run* q
      (fresh (x)
             (== (cons x '()) q)))

(run* q
      (fresh (x)
             (== x q)))

(run* q
      (== '((((pea))) ((pod)))
          '((((pea))) ((pod)))))

(run* q
      (== '((((pea))) pod)
          `((((pea))) ,q)))

(run* q
      (== '((((pea))) ((pod)))
          `((((,q))) ((pod)))))

(run* q
      (fresh (x)
       (== `((((,x))) ((pod)))
           `((((,q))) ((pod))))))

(run* q
      (fresh (x)
       (== `((((,x))) ((pod)))
           `((((,q))) ((,x))))))

(run* q
      (fresh (x)
             (== `(,x ,x) q)))

(run* q
      (fresh (x)
             (== `(,x ,q) q)))

(run* q
      (fresh (x)
             (fresh (y)
                    (== `(,q ,y) `((,x ,y) ,x)))))

(run* q
      (fresh (x)
             (fresh (y)
                    (== `(,x ,y) q))))

(run* q
      (fresh (x)
             (fresh (y)
                    (== `(,x ,y ,x) q))))

(run* q
      (== '(pea) 'pea))

(run* q
      (fresh (x)
             (== `(,x) x)))

(run* q
      (conj2 SUCC SUCC))

(run* q
      (conj2 SUCC (== 'corn q)))

(run* q
      (conj2 FAIL (== 'corn q)))

(run* q
      (conj2 (== 'corn q) (== 'meal q)))

(run* q
      (conj2 (== 'corn q) (== 'corn q)))

(run* q
      (disj2 FAIL FAIL))

(run* q
      (disj2 FAIL SUCC))

(run* q
      (disj2 (== q 'olive) FAIL))

(run* q
      (disj2 FAIL (== q 'oil)))

(run* q
      (disj2 (== q 'olive) (== q 'oil)))

(run* q
      (fresh (x)
             (fresh (y)
                    (disj2 (== `(,x ,y) q)
                           (== `(,y ,x) q)))))

(run* q
      (fresh (x)
             (fresh (y)
                    (conj2 (== `(,x ,y) q)
                           (== `(,y ,x) q)))))

(run* x
      (disj2 (== 'olive x) (== 'oil x)))

(run* x
      (disj2 (== 'oil x) (== 'olive x)))

(run* x
      (disj2 (conj2 (== 'olive x) FAIL)
             (== 'oil x)))

(run* x
      (disj2 (conj2 (== 'olive x) SUCC)
             (== 'oil x)))

(run* x
      (disj2 (== 'oil x)
             (conj2 (== 'olive x) SUCC)))

(run* x
      (disj2
       (conj2 (== 'virgin x) FAIL)
       (disj2 (== 'olive x)
              (disj2 SUCC
                     (== 'oil x)))))

(run* r
      (fresh (x)
             (fresh (y)
                    (conj2 (== 'split x)
                           (conj2 (== 'pea y)
                                  (== `(,x ,y) r))))))

(run* r
      (fresh (x)
             (fresh (y)
                    (conj2 (conj2 (== 'split x)
                                  (== 'pea y))
                           (== `(,x ,y) r)))))

(run* (r x y)
      (conj2 (conj2 (== 'split x)
                    (== 'pea y))
             (== `(,x ,y) r)))

(run* (x y)
      (conj2 (== 'split x)
             (== 'pea y)))

(run* (x y)
      (disj2 (conj2 (== 'split x) (== 'pea y))
             (conj2 (== 'red x) (== 'bean y))))

(run* r
      (fresh (x y)
             (conj2 (disj2 (conj2 (== 'split x) (== 'pea y))
                           (conj2 (== 'red x) (== 'bean y)))
                    (== `(,x ,y soup) r))))

(run* r
      (fresh (x y)
             (disj2 (conj2 (== 'split x) (== 'pea y))
                    (conj2 (== 'red x) (== 'bean y)))
             (== `(,x ,y soup) r)))

(run* (x y z)
      (conj2
       (disj2 (conj2 (== 'split x) (== 'pea y))
              (conj2 (== 'red x) (== 'bean y)))
       (== `soup z)))

(run* (x y z)
      (disj2 (conj2 (== 'split x) (== 'pea y))
             (conj2 (== 'red x) (== 'bean y)))
      (== `soup z))

(run* (x y)
      (== 'split x)
      (== 'pea y))

(run* x
      (teacupo x))

(run* x
      (teacup0o x))

(run* (x y)
      (disj2 (conj2 (teacupo x) (== #t y))
             (conj2 (== #f x) (== #t y))))

(run* (x y)
      (teacupo x)
      (teacupo y))

(run* (x y)
      (teacupo x)
      (teacupo x))

(run* (x y)
      (disj2 (conj2 (teacupo x) (teacupo x))
             (conj2 (== #f x) (teacupo y))))

(run* (x y)
      (conde ((teacupo x) (teacupo x))
             ((== #f x) (teacupo y))))

(run* (x y)
      (conde ((== 'split x) (== 'pea y))
             ((== 'red x) (== 'bean y))))

(run* x
      (conde ((== 'olive x) FAIL)
             (SUCC (== 'oil x))))

(run* x
      (conde ((== 'olive x) FAIL)
             ((== 'oil x))))

(run* (x y)
      (conde ((fresh (z)
                     (== 'lentil z)))
             ((== x y))))

(run* (x y)
      (conde ((== 'split x) (== 'pea y))
             ((== 'red x) (== 'bean y))
             ((== 'green x) (== 'lentil y))))
