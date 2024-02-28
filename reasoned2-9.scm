;;;  -*- mode:scheme; buffer-read-only:nil -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run* x
      (conda (FAIL SUCC)
             (SUCC FAIL)))

(run* x
      (conda (FAIL SUCC)
             (SUCC SUCC)))

(run* x
      (conda (SUCC FAIL)
             (SUCC SUCC)))

(run* x
      (conda (SUCC SUCC)
             (SUCC FAIL)))

(run* x
      (conda ((== 'olive x) SUCC)
             (SUCC (SUCC FAIL))))

(run* x
      (conda ((== 'virgin x) FAIL)
             ((== 'olive x) SUCC)
             (SUCC (== 'oil x))))

(run* q
      (fresh (x y)
             (== 'split x)
             (== 'pea y)
             (conda
              ((== 'split x) (== x y))
              (SUCC SUCC))))

(run* q
      (fresh (x y)
             (== 'split x)
             (== 'pea y)
             (conda
              ((== x y) (== 'split x))
              (SUCC SUCC))))

(run* x
      (conda ((notpastao x) FAIL)
             ((== 'spaghetti x) SUCC)))

(run* x
      (== 'spaghetti x)
      (conda ((notpastao x) FAIL)
             ((== 'spaghetti x) SUCC)))

;; maximum recursion depth exceeded
'(run* q
      (conda ((alwayso) SUCC)
             (SUCC FAIL)))

(run* q
      (condu ((alwayso) SUCC)
             (SUCC FAIL)))

;; maximum recursion depth exceeded
'(run* q
      (condu (SUCC (alwayso))
             (SUCC FAIL)))

;;; no value
'(run 1 q
     (conda ((alwayso) SUCC)
            (SUCC FAIL))
     FAIL)

(run 1 q
     (condu ((alwayso) SUCC)
            (SUCC FAIL))
     FAIL)

(run* x
      (onceo (teacupo2 x)))

(run* r
      (conde ((teacupo2 r) SUCC)
             ((== false r) SUCC)))

(run* r
      (conda ((teacupo2 r) SUCC)
             (SUCC (== false r))))

(run* r
      (== false r)
      (conda ((teacupo2 r) SUCC)
             ((== false r) SUCC)
             (SUCC FAIL)))

(run* r
      (== false r)
      (condu ((teacupo2 r) SUCC)
             ((== false r) SUCC)
             (SUCC FAIL)))

(run* x
      (bumpo '(1 1 1) x))

(run* q
      (gen&test+o '(0 0 1) '(1 1) '(1 1 1)))

(run 5 (x y z)
     (pluso x y z))

;;; no value
'(run 1 q
     (gen&test+o '(0 0 1) '(1 1) '(0 1 1)))

(run* s
      (enumerate+o s '(1 1)))

;;; takes a lot of time
'(run* s
      (enumerate+o s '(1 1 1)))

;;; takes a lot of time
'(run* s
      (enumerate+o2 s '(1 1 1)))

;;; takes a lot of time
(run* s
      (enumerate+o3 pluso s '(1 1 1)))

