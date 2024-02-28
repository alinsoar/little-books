;;;  -*- mode:scheme; buffer-read-only:nil -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run* x
      (appendo '(a b c)
               '(d e)
               x))

(run* x
      (appendo '(a b c)
               `(d ,x)
               '(a b c d e)))

(run* x
      (appendo '(a b c)
               x
               '(a b c d e)))

(run* x
      (appendo2 '(a b c)
                '(d e)
                x))

(run* x
      (appendo2 '(a b c)
                `(d ,x)
                '(a b c d e)))

(run* x
      (appendo2 '(a b c)
                x
                '(a b c d e)))

(run* x
      (appendo3 '(a b c)
                '(d e)
                x))

(run* x
      (appendo3 '(a b c)
                `(d ,x)
                '(a b c d e)))

(run* x
      (appendo3 '(a b c)
                x
                '(a b c d e)))

(run* x
      (loso '(a b c)))

(run* x
      (loso '((a) (b) (c))))

(run* x
      (loso `((a) ,x (c))))

(run* x
      (loso2 '(a b c)))

(run* x
      (loso2 '((a) (b) (c))))

(run* x
      (loso2 `((a) ,x (c))))

(run* x
      (loso3 '(a b c)))

(run* x
      (loso3 '((a) (b) (c))))

(run* x
      (loso3 `((a) ,x (c))))

(run 6 x
     (fresh (y z)
            (appendo x y z)))

(run 6 y
     (fresh (x z)
            (appendo x y z)))

(run 6 z
     (fresh (x y)
            (appendo x y z)))

(run 6 (x y z)
     (appendo x y z))

(run* x
      (appendo '(cake)
               '(tastes yummy)
               x))

(run* x
      (fresh (y)
             (appendo `(cake&ice ,y)
                      '(tastes yummy)
                      x)))

(run* x
      (fresh (y)
             (appendo `(cake&ice cream)
                      y
                      x)))

(run 1 x
     (fresh (y)
            (appendo `(cake&ice . ,y)
                     '(d t)
                     x)))

(run 5 x
     (fresh (y)
            (appendo `(cake&ice . ,y)
                     '(d t)
                     x)))

(run 5 y
     (fresh (x)
            (appendo `(cake&ice . ,y)
                     '(d t)
                     x)))

(run 5 x
     (fresh (y)
            (appendo `(cake&ice . ,y)
                     `(d t . ,y)
                     x)))

(run* x
     (fresh (z)
            (appendo `(cake&ice cream)
                     `(d t . ,z)
                     x)))

(run 6 x
     (fresh (y)
            (appendo x y '(cake & ice d t))))


(run 6 y
     (fresh (x)
            (appendo x y '(cake & ice d t))))

(run 6 (x y)
     (appendo x y '(cake & ice d t)))

;;; no value, infinite search
'(run 7 (x y)
     (appendo x y '(cake & ice d t)))

(run 7 (x y)
     (appendo4 x y '(cake & ice d t)))

(run* (x y)
     (appendo4 x y '(cake & ice d t)))

(run* (x y)
     (swappedo x y '(cake & ice d t)))

(run* x
      (unwrapo '((((pizza)))) x))

(run 1 x
     (unwrapo x 'pizza))

(run 1 x
     (unwrapo `((,x)) 'pizza))

(run 5 x
     (unwrapo `((,x)) 'pizza))

(run 5 x
     (unwrapo x '((pizza))))

(run 5 x
     (unwrapo x 'pizza))


