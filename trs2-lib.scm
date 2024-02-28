
(load "trs2-impl.scm")

;;; chapter 1

(defrel (teacupo t)
  (disj2 (== 'tea t)
         (== 'cup t)))

(define teacup0o
  (lambda (t)
    (lambda (s)
      (lambda ()
        ((disj2 (== 'tea t) (== 'cup t))
         s)))))

;;; chapter 2

(defrel (caro p a)
  (fresh (d)
         (== (cons a d) p)))

(defrel (cdro p d)
  (fresh (a)
         (== (cons a d) p)))

(defrel (conso2 a d p)
  (== (cons a d) p))

(defrel (conso a d p)
  (caro p a)
  (cdro p d))

(defrel (nullo x)
  (== '() x))

(defrel (pairo p)
  (fresh (a d)
         (conso a d p)))

(defrel (singletono l)
  (conde ((pairo l)
          (fresh (d)
                 (cdro l d)
                 (nullo d)))
         (SUCC FAIL)))

(defrel (singletono2 l)
  (conde ((pairo l)
          (fresh (d)
                 (cdro l d)
                 (nullo d)))))

(defrel (singletono3 l)
  (fresh (d)
         (cdro l d)
         (nullo d)))

(defrel (caro2 p a)
  (fresh (d)
         (conso a d p)))

(defrel (cdro2 p d)
  (fresh (a)
         (conso a d p)))

;;; chapter 3

(defrel (listo l)
  (conde ((nullo l) SUCC)
         ((pairo l)
          (fresh (d)
                 (cdro l d)
                 (listo d)))
         (SUCC FAIL)))

(defrel (listo2 l)
  (conde ((nullo l) SUCC)
         ((fresh (d)
                 (cdro l d)
                 (listo d)))))

(defrel (listo3 l)
  (conde ((nullo l))
         ((fresh (d)
                 (cdro l d)
                 (listo d)))))

(defrel (lolo l)
  (conde ((nullo l) SUCC)
         ((fresh (a)
                 (caro l a)
                 (listo a))
          (fresh (d)
                 (cdro l d)
                 (lolo d)))
         (SUCC FAIL)))

(defrel (lolo2 l)
  (conde ((nullo l))
         ((fresh (a)
                 (caro l a)
                 (listo a))
          (fresh (d)
                 (cdro l d)
                 (lolo d)))))

(defrel (loso l)
  (conde ((nullo l))
         ((fresh (a)
                 (caro l a)
                 (singletono a))
          (fresh (d)
                 (cdro l d)
                 (loso d)))))

(defrel (membero x l)
  (conde ((nullo l) FAIL)
         ((fresh (a)
                 (caro l a)
                 (== a x))
          SUCC)
         (SUCC
          (fresh (d)
                 (cdro l d)
                 (membero x d)))))

(defrel (membero2 x l)
  (conde ((fresh (a)
                 (caro l a)
                 (== a x)))
         ((fresh (d)
                 (cdro l d)
                 (membero2 x d)))))

(defrel (membero3 x l)
  (conde ((caro l x))
         ((fresh (d)
                 (cdro l d)
                 (membero3 x d)))))

(defrel (proper-membero x l)
  (conde ((caro l x)
          (fresh (d)
                 (cdro l d)
                 (listo d)))
         ((fresh (d)
                 (cdro l d)
                 (proper-membero x d)))))

;;; chapter 4

(defrel (appendo0 l t out)
  (conde ((nullo l) (== t out))
         ((fresh (res)
                 (fresh (d)
                        (cdro l d)
                        (appendo0 d t res))
                 (fresh (a)
                        (caro l a)
                        (conso a res out))))))

(defrel (appendo2 l t out)
  (conde ((nullo l) (== t out))
         ((fresh (a d res)
                 (cdro l d)
                 (appendo2 d t res)
                 (caro l a)
                 (conso a res out)))))

(defrel (appendo3 l t out)
  (conde ((nullo l) (== t out))
         ((fresh (a d res)
                 (conso a d l)
                 (appendo3 d t res)
                 (conso a res out)))))

(defrel (appendo l t out)
  (conde ((nullo l) (== t out))
         ((fresh (a d res)
                 (conso a d l)
                 (conso a res out)
                 (appendo d t res)))))

(defrel (loso2 l)
  (conde ((nullo l))
         ((fresh (a d)
                 (caro l a)
                 (singletono a)
                 (cdro l d)
                 (loso2 d)))))

(defrel (loso3 l)
  (conde ((nullo l))
         ((fresh (a d)
                 (conso a d l)
                 (singletono a)
                 (loso3 d)))))

(defrel (appendo4 l t out)
  (conde ((nullo l) (== t out))
         ((fresh (a d res)
                 (conso a d l)
                 (conso a res out)
                 (appendo4 d t res)))))

(defrel (swappedo l t out)
  (conde ((fresh (a d res)
                 (conso a d l)
                 (conso a res out)
                 (appendo4 d t res)))
         ((nullo l) (== t out))))

(defrel (unwrapo x out)
  (conde ((fresh (a)
                 (caro x a)
                 (unwrapo a out)))
         ((== x out))))

;;; chapter 5

(defrel (memo x l out)
  (conde ((nullo l) FAIL)
         ((fresh (a)
                 (caro l a)
                 (== a x))
          (== l out))
         (SUCC
          (fresh (d)
                 (cdro l d)
                 (memo x d out)))))

(defrel (memo2 x l out)
  (conde ((caro l x)
          (== l out))
         ((fresh (d)
                 (cdro l d)
                 (memo2 x d out)))))

(defrel (rembero0 x l out)
  (conde ((nullo l) (== '() out))
         ((fresh (a)
                 (caro l a)
                 (== a x))
          (cdro l out))
         (SUCC
          (fresh (res)
                 (fresh (d)
                        (cdro l d)
                        (rembero0 x d res))
                 (fresh (a)
                        (caro l a)
                        (conso a res out))))))

(defrel (rembero x l out)
  (conde ((nullo l) (== '() out))
         ((conso x out l))
         (SUCC
          (fresh (a d res)
                 (conso a d l)
                 (conso a res out)
                 (rembero x d res)))))

;;; chapter 6

(defrel (alwayso)
  (conde (SUCC)
         ((alwayso))))

(defrel (nevero)
  (nevero))

(defrel (very-recursive)
  (conde ((nevero))
         ((very-recursive))
         ((alwayso))
         ((very-recursive))
         ((nevero))))

;;; chapter 7

(defrel (bit-xoro x y r)
  (conde ((== 0 x) (== 0 y) (== 0 r))
         ((== 0 x) (== 1 y) (== 1 r))
         ((== 1 x) (== 0 y) (== 1 r))
         ((== 1 x) (== 1 y) (== 0 r))))

(defrel (bit-xoro2 x y r)
  (fresh (s t u)
         (bit-nando x y s)
         (bit-nando s y u)
         (bit-nando x s t)
         (bit-nando t u r)))

(defrel (bit-nando x y r)
  (conde ((== 0 x) (== 0 y) (== 1 r))
         ((== 0 x) (== 1 y) (== 1 r))
         ((== 1 x) (== 0 y) (== 1 r))
         ((== 1 x) (== 1 y) (== 0 r))))

(defrel (bit-ando x y r)
  (conde ((== 0 x) (== 0 y) (== 0 r))
         ((== 0 x) (== 1 y) (== 0 r))
         ((== 1 x) (== 0 y) (== 0 r))
         ((== 1 x) (== 1 y) (== 1 r))))

(defrel (bit-ando2 x y r)
  (fresh (s)
         (bit-nando x y s)
         (bit-noto s r)))

(defrel (bit-noto x r)
  (conde ((== 0 x) (== 1 r))
         ((== 1 x) (== 0 r))))

(defrel (bit-noto2 x r)
  (bit-nando x x r))

(defrel (half-addero x y r c)
  (bit-xoro x y r)
  (bit-ando x y c))

(defrel (half-addero2 x y r c)
  (conde ((== 0 x) (== 0 y) (== 0 r) (== 0 c))
         ((== 1 x) (== 0 y) (== 1 r) (== 0 c))
         ((== 0 x) (== 1 y) (== 1 r) (== 0 c))
         ((== 1 x) (== 1 y) (== 0 r) (== 1 c))))

(defrel (full-addero b x y r c)
  (fresh (w xy wz)
         (half-addero2 x y w xy)
         (half-addero2 w b r wz)
         (bit-xoro xy wz c)))

(defrel (full-addero2 b x y r c)
  (conde ((== 0 b) (== 0 x) (== 0 y) (== 0 r) (== 0 c))
         ((== 1 b) (== 0 x) (== 0 y) (== 1 r) (== 0 c))
         ((== 0 b) (== 1 x) (== 0 y) (== 1 r) (== 0 c))
         ((== 1 b) (== 1 x) (== 0 y) (== 0 r) (== 1 c))
         ((== 0 b) (== 0 x) (== 1 y) (== 1 r) (== 0 c))
         ((== 1 b) (== 0 x) (== 1 y) (== 0 r) (== 1 c))
         ((== 0 b) (== 1 x) (== 1 y) (== 0 r) (== 1 c))
         ((== 1 b) (== 1 x) (== 1 y) (== 1 r) (== 1 c))))

(define (build-num n)
  (cond
   ((zero? n) '())
   ((even? n) (cons 0 (build-num (quotient n 2))))
   ((odd? n)  (cons 1 (build-num (quotient (- n 1) 2))))))

(defrel (poso n)
  ;; positive
  (fresh (a d)
         (== `(,a . ,d) n)))

(defrel (>1o n)
  ;; greater than 1
  (fresh (a ad dd)
         (== `(,a ,ad . ,dd) n)))

(defrel (addero b n m r)
  (conde
   ((== 0 b) (== '() m) (== n r))
   ((== 0 b) (== '() n) (== m r) (poso m))
   ((== 1 b) (== '() m) (addero 0 n '(1) r))
   ((== 1 b) (== '() n) (poso m) (addero 0 '(1) m r))
   ((== '(1) n) (== '(1) m)
    (fresh (a c)
           (== `(,a ,c) r)
           (full-addero b 1 1 a c)))
   ((== '(1) n) (gen-addero b n m r))
   ((== '(1) m) (>1o n) (>1o r) (addero b '(1) n r))
   ((>1o n) (gen-addero b n m r))))

(defrel (gen-addero b n m r)
  ;; b+n+m=r
  (fresh (a c d e x y z)
         (== `(,a . ,x) n)
         (== `(,d . ,y) m)
         (poso y)
         (== `(,c . ,z) r)
         (poso z)
         (full-addero b a d c e)
         (addero e x y z)))

(defrel (pluso n m k)
  (addero 0 n m k))

(defrel (minuso n m k)
  (pluso m k n))

(defrel (lengtho l n)
  (conde ((nullo l) (== '() n))
         ((fresh (d res)
                 (cdro l d)
                 (pluso '(1) res n)
                 (lengtho d res)))))

;;; chapter 8

(defrel (*o n m p)
  (conde
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
           (odd-*o x n m p)))))

(defrel (odd-*o x n m p)
  (fresh (q)
         (bound-*o q p n m)
         (*o x m q)
         (pluso `(0 . ,q) m p)))

(defrel (bound-*o q p n m)
  (conde
   ((== '() q) (poso p))
   ((fresh (a0 a1 a2 a3 x y z)
           (== `(,a0 . ,x) q)
           (== `(,a1 . ,y) p)
           (conde
            ((== '() n)
             (== `(,a2 . ,z) m)
             (bound-*o x y z '()))
            ((== `(,a3 . ,z) n) 
             (bound-*o x y z m)))))))

(defrel (=lo n m)
  (conde
   ((== '() n) (== '() m))
   ((== '(1) n) (== '(1) m))
   ((fresh (a x b y)
           (== `(,a . ,x) n) (poso x)
           (== `(,b . ,y) m) (poso y)
           (=lo x y)))))

(defrel (<lo n m)
  (conde
   ((== '() n) (poso m))
   ((== '(1) n) (>1o m))
   ((fresh (a x b y)
           (== `(,a . ,x) n) (poso x)
           (== `(,b . ,y) m) (poso y)
           (<lo x y)))))

(defrel (<=lo n m)
  (conde
   ((=lo n m))
   ((<lo n m))))

(defrel (<o n m)
  (conde
   ((<lo n m))
   ((=lo n m)
    (fresh (x)
           (poso x)
           (pluso n x m)))))

(defrel (<=o n m)
  (conde
   ((== n m))
   ((<o n m))))

;;; Flawed def. of '/o' -- frame 8:54
(defrel (/o.54 n m q r)
  (conde
   ((== '() q) (== n r) (<o n m))
   ((== '(1) q) (== '() r) (== n m) (<o r m))
   ((<o m n) (<o r m)
    (fresh (mq)
           (<=lo mq n)
           (*o m q mq)
           (pluso mq r n)))))

; Flawed def. of '/o' -- frame 8:64
(defrel (/o.64 n m q r)
  (fresh (mq)
         (<o r m)
         (<=lo mq n)
         (*o m q mq)
         (pluso mq r n)))

(defrel (splito n r l h)
  (conde
   ((== '() n) (== '() h) (== '() l))
   ((fresh (b n^)
           (== `(0 ,b . ,n^) n) (== '() r)
           (== `(,b . ,n^) h) (== '() l)))
   ((fresh (n^)
           (==  `(1 . ,n^) n) (== '() r)
           (== n^ h) (== '(1) l)))
   ((fresh (b n^ a r^)
           (== `(0 ,b . ,n^) n)
           (== `(,a . ,r^) r) (== '() l)
           (splito `(,b . ,n^) r^ '() h)))
   ((fresh (n^ a r^)
           (== `(1 . ,n^) n)
           (== `(,a . ,r^) r) (== '(1) l)
           (splito n^ r^ '() h)))
   ((fresh (b n^ a r^ l^)
           (== `(,b . ,n^) n)
           (== `(,a . ,r^) r)
           (== `(,b . ,l^) l)
           (poso l^)
           (splito n^ r^ l^ h)))))

(defrel (/o n m q r)
  (conde
   ((== '() q) (== r n) (<o n m))
   ((== '(1) q) (=lo m n) (pluso r m n) (<o r m))
   ((poso q) (<lo m n) (<o r m)
    (n-wider-than-mo n m q r))))

(defrel (n-wider-than-mo n m q r)
  (fresh (nh nl qh ql)
         (fresh (mql mrql rr rh)
                (splito n r nl nh)
                (splito q r ql qh)
                (conde
                 ((== '() nh)
                  (== '() qh)
                  (minuso nl r mql)
                  (*o m ql mql))
                 ((poso nh)
                  (*o m ql mql)
                  (pluso r mql mrql)
                  (minuso mrql nl rr)
                  (splito rr r '() rh)
                  (/o nh m qh rh))))))

(defrel (logo n b q r)
  (conde
   ((== '() q) (<=o n b)
    (pluso r '(1) n))
   ((== '(1) q) (>1o b) (=lo n b)
    (pluso r b n))
   ((== '(1) b) (poso q)
    (pluso r '(1) n))
   ((== '() b) (poso q) (== r n))
   ((== '(0 1) b)
    (fresh (a ad dd)
           (poso dd)
           (== `(,a ,ad . ,dd) n)
           (exp2o n '() q)
           (fresh (s)
                  (splito n dd r s))))
   ((<=o '(1 1) b) (<lo b n)
    (base-three-or-moreo n b q r))))

(defrel (exp2o n b q)
  (conde
   ((== '(1) n) (== '() q))
   ((>1o n) (== '(1) q)
    (fresh (s)
           (splito n b s '(1))))
   ((fresh (q1 b2)
           (== `(0 . ,q1) q) (poso q1)
           (<lo b n)
           (appendo b `(1 . ,b) b2)
           (exp2o n b2 q1)))
   ((fresh (q1 nh b2 s)
           (== `(1 . ,q1) q) (poso q1)
           (poso nh)
           (splito n b s nh)
           (appendo b `(1 . ,b) b2)
           (exp2o nh b2 q1)))))

(defrel (base-three-or-moreo n b q r)
  (fresh (bw1 bw nw nw1 ql1 ql s)
         (exp2o b '() bw1)
         (pluso bw1 '(1) bw)
         (<lo q n)
         (fresh (q1 bwq1)
                (pluso q '(1) q1)
                (*o bw q1 bwq1)
                (<o nw1 bwq1))
         (exp2o n '() nw1)
         (pluso nw1 '(1) nw)
         (/o nw bw ql1 s)
         (pluso ql '(1) ql1)
         (<=lo ql q)
         (fresh (bql qh s qdh qd)
                (repeated-mulo b ql bql)
                (/o nw bw1 qh s)
                (pluso ql qdh qh)
                (pluso ql qd q)
                (<=o qd qdh)
                (fresh (bqd bq1 bq)
                       (repeated-mulo b qd bqd)
                       (*o bql bqd bq)
                       (*o b bq bq1)
                       (pluso bq r n)
                       (<o n bq1)))))

(defrel (repeated-mulo n q nq)
  (conde
   ((poso n) (== '() q) (== '(1) nq))
   ((== '(1) q) (== n nq))
   ((>1o q)
    (fresh (q1 nq1)
           (pluso q1 '(1) q)
           (repeated-mulo n q1 nq1)
           (*o nq1 n nq)))))

(defrel (expo b q n)
  (logo n b q '()))

;;; chapter 9

(defrel (notpastao x)
  (conda ((== 'pasta x) FAIL)
         (SUCC SUCC)))

(defrel (teacupo2 t)
  (conde ((== 'tea t))
         ((== 'cup t))))

(defrel (onceo g)
  (condu (g SUCC)
         (SUCC SUCC)))

(defrel (bumpo n x)
  (conde ((== n x))
         ((fresh (m)
                 (minuso n '(1) m)
                 (bumpo m x)))))

(defrel (gen&test+o i j k)
  (onceo (fresh (x y z)
                (pluso x y z)
                (== i x)
                (== j y)
                (== k z))))

(defrel (enumerate+o r n)
  (fresh (i j k)
         (bumpo n i)
         (bumpo n j)
         (pluso i j k)
         (gen&test+o i j k)
         (== `(,i ,j ,k) r)))

(defrel (enumerate+o2 r n)
  (fresh (i j k)
         (bumpo n i)
         (bumpo n j)
         (pluso i j k)
         (onceo
          (fresh (x y z)
                 (pluso x y z)
                 (== i x)
                 (== j y)
                 (== k z)))
         (== `(,i ,j ,k) r)))

(defrel (enumerate+o3 op r n)
  (fresh (i j k)
         (bumpo n i)
         (bumpo n j)
         (op i j k)
         (onceo
          (fresh (x y z)
                 (op x y z)
                 (== i x)
                 (== j y)
                 (== k z)))
         (== `(,i ,j ,k) r)))

