
(load "reasoned-mk.scm")

(define eq-car?
  (lambda (l x)
    (and (pair? l)
         (eq? (car l) x))))

(define mem
  (lambda (x l)
    (cond ((null? l) #f)
          ((eq-car? l x) l)
          (else (mem x (cdr l))))))

(mem 'tofu '(a b tofu d peas))

(mem 'tofu '(a b X d peas))

(run* (out)
      (== (mem 'tofu '(a b tofu d peas))
          out))

(mem 'peas
     (mem 'tofu '(a b tofu d peas e)))

(mem 'tofu
     (mem 'tofu '(a b tofu f tofu e)))

(mem 'tofu
     (cdr (mem 'tofu '(a b tofu f tofu e))))

(define eq-caro
  (lambda (l x)
    (fresh (a)
           (caro l a)
           (== x a))))

(define memo
  (lambda (x l out)
    (conde ((nullo l) FAIL)
           ((eq-caro l x)
            (== l out))
           (SUCC
            (fresh (d)
                   (cdro l d)
                   (memo x d out))))))

(run1 (out)
      (memo 'tofu
            '(a b tofu d tofu e)
            out))

(run2 (out)
      (memo 'tofu
            '(a b tofu d tofu e)
            out))

(run3 (out)
      (memo 'tofu
            '(a b tofu d tofu e)
            out))

(run1 (out)
      (fresh (x)
             (memo 'tofu `(a b ,x d tofu e)
                   out)))

(run2 (out)
      (fresh (x)
             (memo 'tofu `(a b ,x d tofu e)
                   out)))

(run3 (out)
      (fresh (x)
             (memo 'tofu `(a b ,x d tofu e)
                   out)))

(run* (r)
      (memo r
            '(a b tofu d tofu e)
            '(tofu d tofu e)))

(run* (q)
      (memo 'tofu
            '(tofu e)
            '(tofu e))
      (== #t q))

(run* (q)
      (memo 'tofu '(tofu e) '(tofu))
      (== #t q))

(run* (x)
      (memo 'tofu '(tofu e) `(,x e)))

(run* (x)
      (memo 'tofu '(tofu e) `(peas ,x)))

(run* (out)
      (fresh (x)
             (memo 'tofu
                   `(a b ,x d tofu e)
                   out)))

(D
 (run 12 (x)
      (fresh (u)
             (memo 'tofu
                   `(a b tofu d tofu e . ,x)
                   u))))

(define memo
  (lambda (x l out)
    (conde ((eq-caro l x)
            (== l out))
           (SUCC
            (fresh (d)
                   (cdro l d)
                   (memo x d out))))))

(define rember
  (lambda (x l)
    (cond ((null? l) ' ())
          ((eq-car? l x) (cdr l))
          (else (cons (car l)
                      (rember x (cdr l)))))))

(rember 'peas '(a b peas d peas e))

(define rembero
  (lambda (x l out)
    (conde ((nullo l) (== l out))
           ((eq-caro l x)
            (cdro l out))
           (SUCC
            (fresh (res)
                   (fresh (d)
                          (cdro l d)
                          (rembero x d res))
                   (fresh (a)
                          (caro l a)
                          (conso a res out)))))))

(define rembero
  (lambda (x l out)
    (conde ((nullo l) (== l out))
           ((eq-caro l x)
            (cdro l out))
           (SUCC
            (fresh (res a d)
                   (cdro l d)
                   (rembero x d res)
                   (caro l a)
                   (conso a res out))))))

(define rembero
  (lambda (x l out)
    (conde ((nullo l) (== l out))
           ((eq-caro l x)
            (cdro l out))
           (SUCC
            (fresh (res a d)
                   (conso a d l)
                   (rembero x d res)
                   (conso a res out))))))

(run1 (out)
      (fresh (y)
             (rembero 'peas
                      `(a b ,y d peas e)
                      out)))

(D
 (run10 (out)
       (fresh (y)
              (rembero 'peas
                       `(a b ,y d peas e)
                       out))))

(D
 (run* (out)
       (fresh (y z)
              (rembero y
                       `(a b ,y d ,z e)
                       out))))

(D
 (run* (r)
       (fresh (y z)
              (rembero y `(,y d ,z e) `(,y d e))
              (== (cons y z) r))))

(D
 (run13 (w)
        (fresh (y z out)
               (rembero y
                        `(a b ,y d ,z . ,w)
                        out))))

(define surpriseo
  (lambda (s)
    (rembero s '(a b c) '(a b c))))

(run* (r)
      (== 'd r)
      (surpriseo r))

(run* (r)
      (== 'c r)
      (surpriseo r))

(run* (r)
      (== 'a r)
      (surpriseo r))

(run* (r)
      (surpriseo r))

(run* (r)
      (surpriseo r)
      (== 'b r))

(define remberXo
  (lambda (x l out)
    (conde ((nullo l) (== l out))
           (SUCC
            (fresh (res a d)
                   (conso a d l)
                   (remberXo x d res)
                   (conso a res out))))))

(define surpriseXo
  (lambda (s)
    (remberXo s '(a b c) '(a b c))))

(run* (r)
      (surpriseXo r)
      (== 'b r))

'done

