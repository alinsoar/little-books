
(load "reasoned-mk.scm")

(define list?
  (lambda (l)
    (cond ((null? l) #t)
          ((pair? l) (list? (cdr l)))
          (else #f))))

(list? '(a b c))

(list? 'abc)

(null? '())

(list? '())

(list? '(d a t e . s))

(define listo
  (lambda (l)
    (conde ((nullo l) SUCC)
           ((pairo l)
            (fresh (d)
                   (cdro l d)
                   (listo d)))
           (SUCC FAIL))))

'XX

(run* (x)
      (listo `(a b ,x d)))

(run1 (x)
      (listo `(a b c . ,x)))

'infinite-loop

'(run* (x)
       (listo `(a b c . ,x)))

(D
 (run5 (x)
       (listo `(a b c . ,x))))

(define twinso
  (lambda (s)
    (fresh (x y)
           (conso x y s)
           (conso x '() y))))

(run* (q)
      (twinso '(tofu tofu))
      (== #t q))

(run* (z)
      (twinso `(,z tofu)))

(define twinso
  (lambda (s)
    (fresh (x y z)
           (caro s x)
           (cdro s y)
           (caro y z)
           (== x z))))

(run* (q)
      (twinso '(tofu tofu))
      (== #t q))

(run* (z)
      (twinso `(,z tofu)))

(define twinso
  (lambda (s)
    (fresh (x)
           (== `(,x ,x) s))))

(run* (q)
      (twinso '(tofu tofu))
      (== #t q))

(run* (z)
      (twinso `(,z tofu)))

(define loto
  (lambda (l)
    (conde ((nullo l) SUCC)
           ((fresh (a)
                   (caro l a)
                   (twinso a))
            (fresh (d)
                   (cdro l d)
                   (loto d)))
           (SUCC FAIL))))

(run* (q)
      (loto '((a a) (b b)))
      (== q #t))

(run* (q)
      (loto '((a a) (b a)))
      (== q #t))

(D
 (run3 (z)
       (loto `((g g) . ,z))))

'AA

(run3 (z)
      (loto `((g x) . ,z)))

(run3 (z)
      (== z '())
      (loto `((g g) . ,z)))

(D
 (run5 (r)
       (fresh (w x y z)
              (loto `((g g) (e ,w) (,x ,y) . ,z))
              (== `(,w (,x ,y) ,z) r))))

(D
 (run3 (out)
       (fresh (w x y z)
              (== `((g g) (e ,w) (,x ,y) . ,z)
                  out)
              (loto out))))

(define listofo
  (lambda (predo l)
    (conde ((nullo l) SUCC)
           ((fresh (a)
                   (caro l a)
                   (predo a))
            (fresh (d)
                   (cdro l d)
                   (listofo predo d)))
           (SUCC FAIL))))

(D
 (run3 (out)
       (fresh (w x y z)
              (== `((g g) (e ,w) (,x ,y) . ,z) out)
              (listofo twinso out))))

(define loto
  (lambda (l)
    (listofo twinso l)))

(run3 (z)
      (loto `((g x) . ,z)))

(run3 (z)
      (== z '())
      (loto `((g g) . ,z)))

(D
 (run5 (r)
       (fresh (w x y z)
              (loto `((g g) (e ,w) (,x ,y) . ,z))
              (== `(,w (,x ,y) ,z) r))))

(D
 (run3 (out)
       (fresh (w x y z)
              (== `((g g) (e ,w) (,x ,y) . ,z)
                  out)
              (loto out))))

(define eq-car?
  (lambda (l x)
    (and (pair? l)
         (eq? (car l) x))))

(define member?
  (lambda (x l)
    (cond ((null? l) #f)
          ((eq-car? l x) #t)
          (else (member? x (cdr l))))))

(member? 'x '(a b c x))
(member? 'x '(a b c d))
(member? 'x '())

(define eq-caro
  (lambda (l x)
    (caro l x)))

(define membero
  (lambda (x l)
    (conde ((nullo l) FAIL)
           ((eq-caro l x) SUCC)
           (SUCC
            (fresh (d)
                   (cdro l d)
                   (membero x d))))))

(define membero
  (lambda (x l)
    (conde ;; ((nullo l) FAIL)
           ((eq-caro l x) SUCC)
           (SUCC
            (fresh (d)
                   (cdro l d)
                   (membero x d))))))

(run* (q)
      (membero 'olive '(virgin olive oil))
      (== #t q))

(run* (q)
      (membero 'olive '(virgin X oil))
      (== #t q))

(run1 (y)
      (membero y '(hummus with pita)))

(run* (y)
      (membero y '(hummus with pita)))

(define identity
  (lambda (l)
    (run* (y)
          (membero y l))))

(run* (x)
      (membero 'e `(pasta ,x fagioli)))

(run1 (x)
      (membero 'e `(pasta e ,x fagioli)))

(run3 (x)
      (membero 'e `(pasta e ,x fagioli)))

(run1 (x)
      (membero 'e `(pasta ,x e fagioli)))

(run* (r)
      (fresh (x y)
             (membero 'e `(pasta ,x fagioli ,y))
             (== (cons x y) r)))

(run1 (l)
      (membero 'tofu l))

(D
 (run5 (l)
       (membero 'tofu l)))

(define pmembero
  (lambda (x l)
    (conde ((eq-caro l x)
            (cdro l '()))
           (SUCC
            (fresh (d)
                   (cdro l d)
                   (pmembero x d))))))

(D
 (run5 (l)
       (pmembero 'tofu l)))

(run* (q)
      (pmembero 'tofu '(a b tofu d tofu))
      (== #t q))

(run* (q)
      (pmembero 'tofu '(a b tofu d X))
      (== #t q))

(run* (q)
      (pmembero 'tofu `(a b ,q d ,q)))

(define pmembero
  (lambda (x l)
    (conde ((eq-caro l x) SUCC)
           (SUCC
            (fresh (d)
                   (cdro l d)
                   (pmembero x d))))))

(run* (q)
      (pmembero 'tofu `(a b ,q d ,q)))

(run* (q)
      (pmembero 'tofu `(a b ,q d ,q))
      (== q #t))

(define pmembero
  (lambda (x l)
    (conde ((nullo l) FAIL)
           ((eq-caro l x)
            (cdro l '()))
           ((eq-caro l x)
            (fresh (a d)
                   (cdro l (cons a d))))
           (SUCC
            (fresh (d)
                   (cdro l d)
                   (pmembero x d))))))

(run* (q)
      (pmembero 'tofu `(a b ,q d ,q)))

(run* (q)
      (pmembero 'tofu `(a b ,q d ,q))
      (== q #t))

(run* (q)
      (pmembero 'tofu `(a b ,q d ,q))
      (== q 'tofu))

(run* (q)
      (pmembero 'tofu `(a b tofu d tofu))
      (== q #t))

(D
 (run12 (l)
        (pmembero 'tofu l)))

(define pmembero
  (lambda (x l)
    (conde ((nullo l) FAIL)
           ((eq-caro l x)
            (fresh (a d)
                   (cdro l (cons a d))))
           ((eq-caro l x)
            (cdro l '()))
           (SUCC
            (fresh (d)
                   (cdro l d)
                   (pmembero x d))))))

(D
 (run12 (l)
        (pmembero 'tofu l)))

(define first-value
  (lambda (l)
    (run1 (y)
          (membero y l))))

(first-value '(a b c))

(define memberrevo
  (lambda (x l)
    (conde ((nullo l) FAIL)
           ((== 1 1)
            (fresh (d)
                   (cdro l d)
                   (memberrevo x d)))
           ((== 1 1)
            (eq-caro l x)))))

(run* (q)
      (memberrevo 'a '(b a c a x))
      (== q #t))

(run* (q)
      (memberrevo q '(b a c a x)))

(define reverse-list
  (lambda (l)
    (run* (y)
          (memberrevo y l))))

(reverse-list '(b a c a x))

(define memberrevo
  (lambda (x l)
    "should reverse but it does not -- BUG"
    (conde (SUCC (fresh (d)
                     (cdro l d)
                     (memberrevo x d)))
           (SUCC (eq-caro l x)))))

(run* (x) 
      (memberrevo x '(pasta e fagioli)))




'DONE













