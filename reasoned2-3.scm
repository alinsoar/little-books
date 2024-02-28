;;;  -*- mode:scheme; buffer-read-only:nil -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run* x
      (listo `(a b ,x d)))

;;; no value, x is an infinite list
'(run* x
      (listo `(a b c . ,x)))

(run 1 x
     (listo `(a b c . ,x)))

(run 5 x
     (listo2 `(a b c . ,x)))

(run 5 x
     (listo3 `(a b c . ,x)))

(run 7 (x y)
     (conde ((== 'split x) (== 'pea y))
            ((== 'red x) (== 'bean y))
            ((== 'green x) (== 'lentil y))))

(run* q
      (fresh (x y)
             (lolo `((a b) (,x c) (d ,y)))))

(run 1 l
     (lolo l))

(run 1 x
     (lolo `((a b) (c d) . ,x)))

(run 5 x
     (lolo `((a b) (c d) . ,x)))

(run 5 l
     (lolo l))

(run 1 z
     (loso `((g) . ,z)))

(run 5 z
     (loso `((g) . ,z)))

(run 4 r
     (fresh (w x y z)
            (loso `((g) (e . ,w) (,x . ,y) . ,z))
            (== `(,w (,x . ,y) ,z) r)))

(run 3 out
     (fresh (w x y z)
            (== `((g) (e . ,w) (,x . ,y) . ,z) out)
            (loso out)))

(run* q
      (membero 'olive '(virgin olive oil)))

(run 1 y
     (membero y '(hummus with pita)))

(run* y
      (membero y '(hummus with pita)))

(run* y
      (membero y '(pear grape . peaches)))

(run* x
      (membero 'e `(pasta ,x fagioli)))

(run 1 x
      (membero 'e `(pasta e ,x fagioli)))

(run 1 x
      (membero 'e `(pasta ,x e fagioli)))

(run* (x y)
      (membero 'e `(pasta ,x fagioli ,y)))

(run* q
      (fresh (x y)
             (== `(pasta ,x fagioli ,y) q)
             (membero 'e q)))

(run 1 l
     (membero 'tofu l))

(run 5 l
     (membero 'tofu l))

(run 5 l
     (membero2 'tofu l))

(run 5 l
     (membero3 'tofu l))

(run 5 l
     (proper-membero 'tofu l))

(run 12 l
     (proper-membero 'tofu l))
