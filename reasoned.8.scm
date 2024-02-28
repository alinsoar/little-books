
(load "reasoned-mk.scm")

(D
 (run34 (t)
        (fresh (x y r)
               (*o x y r)
               (== (list x y r) t))))

(define odd-*o
  (lambda (x n m p)
    (fresh (q)
      (bound-*o q p n m)
      (*o x m q)
      (+o `(0 . ,q) m p))))

(define *o
  (lambda (n m p)
    (condi
     ((== '() n) (== '() p))
     ((poso n) (== '() m) (== '() p))  
     ((== '(1) n) (poso m) (== m p))   
     ((>1o n) (== '(1) m) (== n p))
     ((fresh (x z)
             (== `(0 . ,x) n) (poso x)
             (== `(0 . ,z) p) (poso z)
             (>1o m)
             (*o x m z)))
     ((fresh (x y)
             (== `(1 . ,x) n) (poso x)
             (== `(0 . ,y) m) (poso y)
             (*o m n p)))
     ((fresh (x y)
             (== `(1 . ,x) n) (poso x)      
             (== `(1 . ,y) m) (poso y)
             (odd-*o x n m p)))
     (else FAIL))))

(D
 (run34 (t)
        (fresh (x y r)
               (*o x y r)
               (== (list x y r) t))))

(run1 (t)
      (fresh (n m)
             (*o n m '(1))
             (== (list n m) t)))

(define bound-*o
  (lambda (q p n m)
    SUCC))

'(run2 (t)
      (fresh (n m)
             (*o n m '(1))
             (== (list n m) t)))

(define bound-*o
  (lambda (q p n m)
    (conde
     ((nullo q) (pairo p))
     (else
      (fresh (x y z)
             (cdro q x)
             (cdro p y)
             (condi
              ((nullo n)
               (cdro m z)
               (bound-*o x y z '()))
              (else
               (cdro n z) 
               (bound-*o x y z m))))))))

(run* (t)
      (fresh (n m)
             (*o n m '(1))
             (== (list n m) t)))

(run* (p)
      (*o '(1 1 1)
          '(1 1 1 1 1 1)
          p))

(define =lo
  (lambda (n m)
    (conde
     ((== '() n) (== '() m))
     ((== '(1) n) (== '(1) m))
     (else
      (fresh (a x b y)
             (== `(,a . ,x) n) (poso x)
             (== `(,b . ,y) m) (poso y)
             (=lo x y))))))

(run* (t)
      (fresh (w x y)
             (=lo (cons 1
                        (cons w
                              (cons x y)))
                  '(0 1 1 0 1))
             (== (list w x y)
                 t)))

(run* (b)
      (=lo '(1) `(,b)))

(run* (n)
      (=lo `(1 0 1 . ,n)
           '(0 1 1 0 1)))

(D
 (run5 (t)
       (fresh (y z)
              (=lo (cons 1 y)
                   (cons 1 z))
              (== (list y z)
                  t))))

(D
 (run5 (t)
       (fresh (y z)
              (=lo (cons 1 y)
                   (cons 0 z))
              (== (list y z)
                  t))))

(D
 (run5 (t)
       (fresh (y z)
              (=lo (cons 1 y) `(0 1 1 0 1 . ,z))
              (== (list y z)
                  t))))

(define <lo
  (lambda (n m)
    (conde
     ((== '() n) (poso m))
     ((== '(1) n) (>1o m))
     (else
      (fresh (a x b y)
             (== `(,a . ,x) n) (poso x)
             (== `(,b . ,y) m) (poso y)
             (<lo x y))))))

(D
 (run8 (t)
       (fresh (y z)
              (<lo (cons 1 y)
                   `(0 1 1 0 1 . ,z))
              (== (list y z) t))))

'(run1 (n)
      (<lo n n))

(define <=lo
  (lambda (n m)
    (conde
      ((=lo n m) SUCC)
      ((<lo n m) SUCC)
      (else FAIL))))

(D
 (run8 (t)
       (fresh (n m)
              (<=lo n m)
              (== (list n m) t))))

(run1 (t)
      (fresh (n m)
             (<=lo n m)
             (*o n '(0 1) m)
             (== (list n m) t)))

'(D
 (run2 (t)
       (fresh (n m)
              (<=lo n m)
              (*o n '(0 1) m)
              (== (list n m) t))))

(define <=lo
  (lambda (n m)
    (condi
     ((=lo n m) SUCC)
     ((<lo n m) SUCC)
     (else FAIL))))

(D
 (run2 (t)
       (fresh (n m)
              (<=lo n m)
              (*o n '(0 1) m)
              (== (list n m) t))))

(D
 (run10 (t)
       (fresh (n m)
              (<=lo n m)
              (*o n '(0 1) m)
              (== (list n m) t))))

(D
 (run15 (t)
        (fresh (n m)
               (<=lo n m)
               (== (list n m) t))))

(define <o
  (lambda (n m)
    (condi
     ((<lo n m) SUCC)
     ((=lo n m)
      (fresh (x)
             (poso x)
             (+o n x m)))
     (else FAIL))))

(define <=o
  (lambda (n m)
    (condi
      ((== n m) SUCC)
      ((<o n m) SUCC)
      (else FAIL))))

(run* (q)
      (<o '(1 0 1) '(1 1 1))
      (== #t q))

(run* (q)
      (<o '(1 1 1) '(1 0 1))
      (== #t q))

(run* (q)
      (<o '(1 1 1) '(1 1 1))
      (== #t q))

(run6 (n)
      (<o n '(1 0 1)))

(run6 (k)
      (<o '(1 0 1) k))

'(run* (n)
      (<o n n))

(D
 (run15 (t)
        (fresh (n m q r)
               (/o n m q r)
               (== (list n m q r)
                   t))))

(define /o
  (lambda (n m q r)
    (condi
      ((== r n) (== '() q) (<o n m))
      ((== '(1) q) (=lo n m) (+o r m n)
       (<o r m))
      (else
        (alli
          (<lo m n)                        
          (<o r m)                        
          (poso q)                 
          (fresh (nh nl qh ql qlm qlmr rr rh)
            (alli
              (splito n r nl nh)
              (splito q r ql qh)
              (conde
                ((== '() nh)
                 (== '() qh)
                 (-o nl r qlm)
                 (*o ql m qlm))
                (else
                  (alli 
                    (poso nh)
                    (*o ql m qlm)
                    (+o qlm r qlmr)
                    (-o qlmr nl rr)
                    (splito rr r '() rh)
                    (/o nh m qh rh)))))))))))

(define splito
  (lambda (n r l h)
    (condi
      ((== '() n) (== '() h) (== '() l))
      ((fresh (b n^)
         (== `(0 ,b . ,n^) n)
         (== '() r)
         (== `(,b . ,n^) h)
         (== '() l)))
      ((fresh (n^)
         (==  `(1 . ,n^) n)
         (== '() r)
         (== n^ h)
         (== '(1) l)))
      ((fresh (b n^ a r^)
         (== `(0 ,b . ,n^) n)
         (== `(,a . ,r^) r)
         (== '() l)
         (splito `(,b . ,n^) r^ '() h)))
      ((fresh (n^ a r^)
         (== `(1 . ,n^) n)
         (== `(,a . ,r^) r)
         (== '(1) l)
         (splito n^ r^ '() h)))
      ((fresh (b n^ a r^ l^)
         (== `(,b . ,n^) n)
         (== `(,a . ,r^) r)
         (== `(,b . ,l^) l)
         (poso l^)
         (splito n^ r^ l^ h)))
      (else FAIL))))

(run* (m)
      (fresh (r)
             (/o '(1 0 1)
                 m
                 '(1 1 1)
                 r)))

(define logo
  (lambda (n b q r)
    (condi
     ((== '(1) n) (poso b) (== '() q) (== '() r))
     ((== '() q) (<o n b) (+o r '(1) n))
     ((== '(1) q) (>1o b) (=lo n b) (+o r b n))
     ((== '(1) b) (poso q) (+o r '(1) n))
     ((== '() b) (poso q) (== r n))
     ((== '(0 1) b)
      (fresh (a ad dd)
             (poso dd)
             (== `(,a ,ad . ,dd) n)
             (exp2 n '() q)
             (fresh (s)
                    (splito n dd r s))))
     ((fresh (a ad add ddd)
             (conde
              ((== '(1 1) b))
              (else (== `(,a ,ad ,add . ,ddd) b))))
      (<lo b n)
      (fresh (bw1 bw nw nw1 ql1 ql s)
             (exp2 b '() bw1)
             (+o bw1 '(1) bw)
             (<lo q n)
             (fresh (q1 bwq1)
                    (+o q '(1) q1)
                    (*o bw q1 bwq1)
                    (<o nw1 bwq1))
             (exp2 n '() nw1)
             (+o nw1 '(1) nw)
             (/o nw bw ql1 s)
             (+o ql '(1) ql1)
             (conde
              ((== q ql))
              (else (<lo ql q)))
             (fresh (bql qh s qdh qd)
                    (repeated-mul b ql bql)        
                    (/o nw bw1 qh s)                
                    (+o ql qdh qh)
                    (+o ql qd q)
                    (conde
                     ((== qd qdh))
                     (else (<o qd qdh)))
                    (fresh (bqd bq1 bq)
                           (repeated-mul b qd bqd)        
                           (*o bql bqd bq)                
                           (*o b bq bq1)                
                           (+o bq r n)
                           (<o n bq1)))))
     (else fail))))

(define exp2
  (lambda (n b q)
    (condi
     ((== '(1) n) (== '() q))
     ((>1o n) (== '(1) q)
      (fresh (s)
             (splito n b s '(1))))
     ((fresh (q1 b2)                        
             (alli                 
              (== `(0 . ,q1) q)
              (poso q1)
              (<lo b n)
              (appendo b `(1 . ,b) b2)
              (exp2 n b2 q1))))
     ((fresh (q1 nh b2 s)                
             (alli
              (== `(1 . ,q1) q)
              (poso q1)
              (poso nh)
              (splito n b s nh)
              (appendo b `(1 . ,b) b2)
              (exp2 nh b2 q1))))
     (else fail))))

(define repeated-mul
  (lambda (n q nq)
    (conde
     ((poso n) (== '() q) (== '(1) nq))
     ((== '(1) q) (== n nq))
     ((>1o q)
      (fresh (q1 nq1)
             (+o q1 '(1) q)
             (repeated-mul n q1 nq1)
             (*o nq1 n nq)))
     (else fail))))

(define expo
  (lambda (b q n)
    (logo n b q '())))

(run* (r)
      (logo '(0 1 1 1)
            '(0 1)
            '(1 1)
            r))



'DONE



