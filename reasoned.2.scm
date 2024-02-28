
(load "reasoned-mk.scm")

(let ((x (lambda (a) a))
      (y 'c))
  (x y))

(run* (r)
      (fresh (y x)
             (== `(,x ,y) r)))

(run* (r)
      (fresh (v w)
             (== (let ((x v)
                       (y w))
                   `(,x ,y))
                 r)))

(car '(raisin pear grape))

(car '(a corn))

(run* (r)
      (caro '(a corn) r))

(run* (q)
      (caro '(a caro) 'a)
      (== #t q))

(run* (q)
      (caro '(a caro) 'b)
      (== #t q))

(run* (r)
      (fresh (x y)
             (caro `(,r ,y) x)
             (== 'pear x)))

(run* (r)
      (fresh (x y)
             (caro `(,r ,y) x)))

(define caro
  (lambda (p a)
    (fresh (d)
           (== (cons a d) p))))

(cons (car '(grape raisin pear))
      (car '((a) (b) (c))))

(run* (r)
      (fresh (x y)
             (caro '(grape raisin pear) x)
             (caro '((a) (b) (c)) y)
             (== (cons x y) r)))

(cdr '(grape raisin pear))

(car (cdr '(a c o r n)))

(run* (r)
      (fresh (v)
             (cdro '(a c o r n) v)
             (caro v r)))

(define cdro
  (lambda (p d)
    (fresh (a)
           (== (cons a d) p))))

(cons (cdr '(grape raisin pear))
      (car '((a) (b) (c))))

(run* (r)
      (fresh (x y)
             (cdro '(grape raisin pear) x)
             (caro '((a) (b) (c)) y)
             (== (cons x y) r)))

(run* (q)
      (cdro '(a c o r n) '(c o r n))
      (== #t q))

(run* (q)
      (cdro '(a c o r n) '(x o r n))
      (== #t q))

(run* (x)
      (cdro '(c o r n) `(x r n)))

(run* (x)
      (cdro '(c o r n) `(,x r n)))

(run* (l)
      (fresh (x)
             (cdro l '(c o r n))
             (caro l x)
             (== 'a x)))

(run* (l)
      (fresh (x)
             (cdro l '(c o r n))
             ;; (caro l x)
             (== 'a x)))

(run* (l)
      (conso '(a b c)
             '(d e)
             l))

(run* (x)
      (conso x '(a b c) '(d a b c)))

(run* (r)
      (fresh (x y z)
             (== `(e a d ,x) r)
             (conso y `(a ,z c) r)))

(run* (x)
      (conso x `(a ,x c) `(d a ,x c)))

(run* (l)
      (fresh (x)
             (== `(d a ,x c) l)
             (conso x `(a ,x c) l)))

(run* (l)
      (fresh (x)
             (conso x `(a ,x c) l)
             (== `(d a ,x c) l)))

(define conso
  (lambda (x y z)
    (== (cons x y) z)))

(run* (l)
      (fresh (x y)
             (conso x y '(a b c d))
             (== l (cons x (cons y '())))))

(run* (l)
      (fresh (d x y w s)
             (conso w '(a n s) s)
             (cdro l s)
             (caro l x)
             (== 'b x)
             (cdro l d)
             (caro d y)
             (== 'e y)))

(null? '(grape pear))

(null? '())

(run* (q)
      (nullo '(grape pear))
      (== #t q))

(run* (q)
      (nullo '())
      (== #t q))

(run* (x)
      (nullo x))

(define nullo
  (lambda (x)
    (== '() x)))

(run* (x)
      (nullo x))

(run* (x)
      (nullo '()))

(run* (x)
      (nullo '(a)))

(eq? 'pear 'plum)

(eq? 'pear 'pear)

(run* (q)
      (eqo 'pear 'plum)
      (== #t q))

(run* (q)
      (eqo 'pear 'pear)
      (== #t q))

(define eqo
  (lambda (x y)
    (== x y)))

(pair? '(split . pea))

(run* (a)
      (fresh (x)
             (== a (pair? `(split . x)))))

(pair? '())

(pair? 'pair)

(pair? '(pear))

(car '(pear))

(cdr '(pear))

(cons '(split) 'pea)

(run* (r)
      (fresh (x y)
             (== (cons x (cons y 'salad))
                 r)))

(define pairo
  (lambda (p)
    (fresh (a d)
           (conso a d p))))

(run* (q)
      (pairo (cons q q))
      (== #t q))

(run* (q)
      (pairo '())
      (== #t q))

(run* (q)
      (pairo 'pair)
      (== #t q))

(run* (x)
      (pairo x))

(run* (r)
      (pairo (cons r 'pear)))

(define caro
  (lambda (p a)
    (fresh (d)
           (conso a d p))))

(define cdro
  (lambda (p d)
    (fresh (a)
           (conso a d p))))

(run* (q)
      (caro '(a b c) q))

(run* (q)
      (cdro '(a b c) q))



