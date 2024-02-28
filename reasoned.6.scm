
(load "reasoned-mk.scm")

(load "reasoned.1.scm")

(define anyo
  (lambda (g)
    (conde (g SUCC)
           (SUCC (anyo g)))))

(define nevero
  (anyo FAIL))

(run* (x)
      (nevero SUCC))

(run* (x)
      (nevero FAIL))

(run* (x)
      nevero)

(run1 (q)
      nevero
      (== #t q))

(run1 (q)
      (== 10 q))

(run1 (q)
      FAIL
      (== 10 q))

(run1 (q)
      FAIL
      nevero)

(run1 (q)
      FAIL
      (nevero 100))

(define always
  (anyo SUCC))

'(run* (q)
       always
       )
;;;Aborting!: out of memory
;;;GC #4: took:   0.10   (2%) CPU time,   0.20   (4%) real time; free: 16737522
;;;GC #5: took:   0.10  (50%) CPU time,   0.20  (95%) real time; free: 16737582

(run10 (q)
       always
       (== q #t))

(run10 (q)
       always)

(define salo
  (lambda (g)
    (conde (SUCC SUCC)
           (SUCC g))))

(run20 (q)
       (salo alwayso)
       (== #t q))

(run20 (q)
       (salo nevero)
       (== #t q))

(run1 (q)
      (salo nevero)
      (== #t q))

(run1 (q)
      (salo nevero)
      FAIL
      (== #t q))

'infinite-loop

'(run10 (q)
        (salo alwayso)
        FAIL
        (== #t q))

'(run1 (q)
       (salo alwayso)
       FAIL
       (== #t q))

(run1 (q)
      (salo nevero)
      FAIL
      (== #t q))

'(run1 (q)
      (conde ((== #f q) alwayso)
             (SUCC (anyo (== #t q))))
      (== #t q))

(run1 (q)
      (condi ((== #f q) alwayso)
             (SUCC (anyo (== #t q))))
      (== #t q))

'(run10 (q)
       (condi ((== #f q) alwayso)
              (SUCC (== #t q)))
       (== #t q))

(run10 (q)
       (condi ((== #f q) alwayso)
              (SUCC (anyo (== #t q))))
       (== #t q))

(run5 (r)
      (condi ((teacup r) SUCC)
             ((== #f r) SUCC)
             (SUCC FAIL)))

(run5 (r)
      (conde ((teacup r) SUCC)
             ((== #f r) SUCC)
             (SUCC FAIL)))

(run5 (r)
      (condi ((== #f r) alwayso)
             ((== #t r) alwayso)
             (SUCC FAIL)))

(run5 (r)
      (conde ((== #f r) alwayso)
             ((== #t r) alwayso)
             (SUCC FAIL)))

'loop

'(run5 (r)
      (conde ((== #f r) alwayso)
             ((== #t r) alwayso)
             (SUCC FAIL))
      (== r #t))

(run5 (r)
      (condi ((== #f r) alwayso)
             ((== #t r) alwayso)
             (SUCC FAIL))
      (== r #t))

(run5 (r)
      (condi (alwayso SUCC)
             (SUCC nevero))
      (== r #t))

'(run1 (q)
      (all
       (conde ((== #f q) SUCC)
              (SUCC (== #t q)))
       alwayso)
      (== q #t))

(run1 (q)
      (alli
       (conde ((== #f q) SUCC)
              (SUCC (== #t q)))
       alwayso)
      (== #t q))

(run10 (q)
      (alli
       (conde ((== #f q) SUCC)
              (SUCC (== #t q)))
       alwayso)
      (== #t q))

(run10 (q)
      (alli
       (conde ((== #t q) SUCC)
              (SUCC (== #f q)))
       alwayso)
      (== #t q))

(run10 (q)
       (all (conde (SUCC SUCC)
                   (SUCC nevero))
            alwayso)
       (== #t q))

(run10 (q)
       (alli (conde (SUCC SUCC)
                    (SUCC nevero))
             nevero)
       (== #t q))














'DONE

