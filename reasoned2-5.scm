;;;  -*- mode:scheme; buffer-read-only:nil -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run* q
      (memo 'fig '(pea) '(pea)))

(run* out
      (memo 'fig '(fig) out))

(run* out
      (memo 'fig '(fig pea) out))

(run* r
      (memo r
            '(roll okra fig beet fig pea)
            '(fig beet fig pea)))

(run* x
      (memo 'fig
            '(fig pea)
            `(pea ,x)))

(run* x
      (memo 'fig
            '(fig pea)
            `(,x pea)))

(run* out
      (memo 'fig
            '(beet fig pea)
            out))

(run 1 out
     (memo 'fig '(fig fig pea)
           out))

(run* out
      (memo 'fig '(fig fig pea)
            out))

(run* out
      (fresh (x)
             (memo 'fig `(a ,x c fig e)
                   out)))

(run 5 (x y)
     (memo 'fig `(fig d fig e . ,y)
           x))

(run* out
      (rembero0 'pea '(pea) out))

(run* out
      (rembero 'pea '(pea) out))

(run* out
      (rembero 'pea '(pea pea) out))

(run* out
      (fresh (y z)
             (rembero y `(a b ,y d ,z e)
                      out)))

(run* (y z)
      (rembero y `(,y d ,z e)
               `(,y d e)))

(run 4 (y z w out)
     (rembero y `(,z . ,w)
              out))

(run 5 (y z w out)
     (rembero y `(,z . ,w)
              out))
