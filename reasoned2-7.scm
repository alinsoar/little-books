;;;  -*- mode:scheme; buffer-read-only:nil -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run* (x y)
      (bit-xoro x y 0))

(run* (x y)
      (bit-xoro2 x y 0))

(run* (x y)
      (bit-xoro x y 1))

(run* (x y)
      (bit-xoro2 x y 1))

(run* (x y r)
      (bit-xoro x y r))

(run* (x y)
      (bit-ando x y 1))

(run* (x y)
      (bit-ando2 x y 1))

(run* (r)
      (half-addero 1 1 r 1))

(run* (x y r c)
      (half-addero x y r c))

(run* (x y r c)
      (half-addero2 x y r c))

(run* (r c)
      (full-addero 0 1 1 r c))

(run* (r c)
      (full-addero 1 1 1 r c))

(run* (b x y r c)
      (full-addero b x y r c))

(run* (b x y r c)
      (full-addero2 b x y r c))

(build-num 0)

(build-num 1)

(build-num 3)

(build-num 7)

(build-num 6)

(build-num 19)

(build-num 1729)

(run* q
      (poso '(0 1 1)))

(run* q
      (poso '(1)))

(run* q
      (poso '()))

(run* r
      (poso r))

(run* q
      (>1o '(0 1 1)))

(run* q
      (>1o '(0 1)))

(run* q
      (>1o '(1)))

(run* q
      (>1o '()))

(run* r
      (>1o r))

(run 3 (x y r)
     (addero 0 x y r))

(run 19 (x y r)
     (addero 0 x y r))

(run* s
      (gen-addero
       1 '(0 1 1) '(1 1) s))

(run* (x y)
      (addero 0 x y '(1 0 1)))

(run* (n m)
      (pluso n m '(1 0 1)))

(run* q
      (minuso '(0 0 0 1)
              '(1 0 1)
              q))

(run* q
      (minuso '(0 1 1)
              '(0 0 0 1)
              q))

(run 1 n
     (lengtho '(jicama rhubarb guava) n))

(run* ls
      (lengtho ls '(1 0 1)))

(run* q
      (lengtho '(1 0 1) 3))

(run* q
      (lengtho '(1 0 1) '(1 1)))

(run 3 q
     (lengtho q q))

;;; no value
'(run 4 q
     (lengtho q q))


