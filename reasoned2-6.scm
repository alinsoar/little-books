;;;  -*- mode:scheme; buffer-read-only:nil -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run 1 q
     (alwayso))

(run 1 q
     (conde (SUCC)
            ((alwayso))))

;;; no value -- max recursion depth
'(run* q
     (alwayso))

;;; no value -- max recursion depth
'(run* q
      (conde (SUCC)
             ((alwayso))))

(run 5 q
     (alwayso))

(run 5 q
     (== 'onion q)
     (alwayso))

;;; no value -- max recursion depth
'(run 1 q
     (alwayso)
     FAIL)

(run 1 q
     (== 'garlic q)
     SUCC
     (== 'onion q))

(run 1 q
     (conde
      ((== 'garlic q) (alwayso))
      ((== 'onion q)))
     (== 'onion q))

;;; no value
'(run 2 q
     (conde
      ((== 'garlic q) (alwayso))
      ((== 'onion q)))
     (== 'onion q))

(run 5 q
     (conde
      ((== 'garlic q) (alwayso))
      ((== 'onion q) (alwayso)))
     (== 'onion q))

;;; no value
'(run 1 q
     (nevero))

(run 1 q
     FAIL
     (nevero))

(run 1 q
     (conde
      (SUCC)
      ((nevero))))

(run 1 q
     (conde
      ((nevero))
      (SUCC)))

;;; no value
'(run 2 q
     (conde
      (SUCC)
      ((nevero))))

;;; no value
'(run 1 q
     (conde
      (SUCC)
      ((nevero)))
     FAIL)

(run 5 q
     (conde
      ((nevero))
      ((alwayso))
      ((nevero))))

(run 6 q
     (conde
      ((== 'spicy q) (nevero))
      ((== 'hot q) (nevero))
      ((== 'apple q) (alwayso))
      ((== 'cider q) (alwayso))))

(run 100 q (very-recursive))
