;;;  -*- mode:scheme; buffer-read-only:nil -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run 10 (x y z)
     (*o x y z))

(run* p
      (*o '(0 1) '(0 0 1) p))

(run 1 (x y r)
     (== `(,x ,y ,r)
         '((1 1) (1 1) (1 0 0 1)))
     (*o x y r))

(run 1 (n m)
     (*o n m '(1)))

(run 1 (n m)
     (>1o n)
     (>1o m)
     (*o n m '(1 1)))

(run 2 (n m)
     (*o n m '(1)))

(run* p
      (*o '(1 1 1)
          '(1 1 1 1 1 1)
          p))

(run* (w x y)
      (=lo `(1 ,w ,x . ,y)
           '(0 1 1 0 1)))

(run* b
      (=lo '(1) `(,b)))

(run* n
      (=lo `(1 0 1 . ,n)
           '(0 1 1 0 1)))

(run 5 (y z)
     (=lo `(1 . ,y)
          `(1 . ,z)))

(run 5 (y z)
     (=lo `(1 . ,y)
          `(0 . ,z)))

(run 5 (y z)
     (=lo `(1 . ,y)
          `(0 1 1 0 1 . ,z)))

(run 8 (y z)
     (<lo `(1 . ,y)
          `(0 1 1 0 1 . ,z)))

;;; no value
'(run 1 n
     (<lo n n))

(run 8 (n m)
     (<=lo n m))

(run 1 (n m)
     (<=lo n m)
     (*o n '(0 1) m))

(run 10 (n m)
     (<=lo n m)
     (*o n '(0 1) m))

(run 9 (n m)
     (<=lo n m))

(run* q
      (<o '(1 0 1) '(1 1 1)))

(run* q
      (<o '(1 1 1) '(1 0 1)))

(run* q
      (<o '(1 0 1) '(1 0 1)))

(run 6 n
     (<o n '(1 0 1)))

(run 6 m
     (<o '(1 0 1) m))

;;; no value
'(run* n
      (<o n n))

;; (run 4 (n m q r)
;;      (/o.54 n m q r))

;; (run* m
;;       (fresh (r)
;;              (/o.54 '(1 0 1)
;;                     m
;;                     '(1 1 1)
;;                     r)))

;; ;;; no value
;; '(run* m
;;        (fresh (r)
;;               (/o.64 '(1 0 1)
;;                      m
;;                      '(1 1 1)
;;                      r)))

(run* (l h)
      (splito '(0 0 1 0 1)
              '()
              l h))

(run* (l h)
      (splito '(0 0 1 0 1)
              '(1)
              l h))

(run* (l h)
      (splito '(0 0 1 0 1)
              '(0 1)
              l h))

(run* (l h)
      (splito '(0 0 1 0 1)
              '(1 1)
              l h))

(run* (r l h)
      (splito '(0 0 1 0 1)
              r l h))

(run 3 (y z)
     (/o `(1 0 . ,y) '(0 1) z '()))

(run* r
      (logo '(0 1 1 1) '(0 1) '(1 1) r))

;;; takes a lot of time
(run 9 (b q r)
     (logo '(0 0 1 0 0 0 1) b q r)
     (>1o q))

;;; takes a lot of time as well
(run* t
      (expo '(1 1) '(1 0 1) t))

(build-num 243)

(build-num (expt 3 5))


