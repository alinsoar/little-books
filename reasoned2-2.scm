;;;  -*- mode:scheme; buffer-read-only:t -*- 

(load "trs2-impl.scm")
(load "trs2-lib.scm")

(run* q
      (caro '(a c o r n) q))

(run* q
      (caro '(a c o r n) 'a))

(run* r
      (fresh (x y)
             (caro '(grape raisin pear) x)
             (caro '((a) (b) (c)) y)
             (== (cons x y) r)))

(run* r
      (fresh (v)
             (cdro '(a c o r n) v)
             (fresh (w)
                    (cdro v w)
                    (caro w r))))

(run* r
      (fresh (x y)
             (cdro '(grape raisin pear) x)
             (caro '((a) (b) (c)) y)
             (== (cons x y) r)))

(run* q
      (cdro '(a c o r n)
            '(c o r n)))

(run* q
      (cdro '(a c o r n)
            '(o r n)))

(run* x
      (cdro '(c o r n)
            `(,x r n)))

(run* l
      (fresh (x)
             (cdro l '(c o r n))
             (caro l x)
             (== 'a x)))

(run* l
      (conso '(a b c) '(d e) l))

(run* l
      (conso2 '(a b c) '(d e) l))

(run* x
      (conso x '(a b c) '(d a b c)))

(run* r
      (fresh (x y z)
             (== `(e a d ,x) r)
             (conso y `(a ,z c) r)))

(run* x
      (conso x `(a ,x c) `(d a ,x c)))

(run* l
      (fresh (x)
             (== `(d a ,x c) l)
             (conso x `(a ,x c) l)))

(run* l
      (fresh (x)
             (conso x `(a ,x c) l)
             (== `(d a ,x c) l)))

(run* l
      (fresh (d t x y w)
             (conso w '(n u s) t)
             (cdro l t)
             (caro l x)
             (== 'b x)
             (cdro l d)
             (caro d y)
             (== 'o y)))

(run* q
      (nullo '(grape raisin pear)))

(run* q
      (nullo '( )))

(run* q
      (nullo q))

(run* r
      (fresh (x y)
             (== (cons x (cons y 'salad))
                 r)))

(run* q
      (pairo (cons q q)))

(run* q
      (pairo '(a b)))

(run* q
      (pairo '()))

(run* q
      (pairo 'pair))

(run* x
      (pairo x))

(run* r
      (pairo (cons r '())))

(run* r
      (singletono '()))

(run* r
      (singletono '(single)))

(run* r
      (singletono2 r))

(run* r
      (singletono3 '(a b)))

(run* r
      (caro2 '(a b) r))

(run* r
      (cdro2 '(a b) r))
