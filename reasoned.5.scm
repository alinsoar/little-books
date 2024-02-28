
(load "reasoned-mk.scm")

(define append
  (lambda (l s)
    (cond ((null? l) s)
          (else (cons (car l)
                      (append (cdr l)
                              s))))))

(append '(a b c)
        '(d e f))

(append '(a b c) '())

(append '() '(a b c))

'(append 'a '(a b c))

(append '(x y z) 'a)

(define appendo
  (lambda (l s out)
    (conde ((nullo l) (== s out))
           (SUCC
            (fresh (a d res)
                   ;; (cons (car l)
                   ;;       (append (cdr l)
                   ;;               s))
                   (caro l a)
                   (cdro l d)
                   (appendo d s res)
                   (conso a res out))))))

(run* (x)
      (appendo '(cake)
               '(tastes yummy)
               x))

(run* (x)
      (fresh (y)
             (appendo `(cake with ice ,y)
                      '(tastes yummy)
                      x)))

(run* (x)
      (fresh (y)
             (appendo `(cake with ice cream)
                      y
                      x)))

(run1 (x)
      (fresh (y)
             (appendo `(cake with ice . ,y)
                      '(d t)
                      x)))

(run1 (y)
      (fresh (x)
             (appendo `(cake with ice . ,y)
                      '(d t)
                      x)))

(define appendo
  (lambda (l s out)
    (conde ((nullo l) (== s out))
           (SUCC
            (fresh (a d res)
                   ;; (cons (car l)
                   ;;       (append (cdr l)
                   ;;               s))
                   ;; (caro l a)
                   ;; (cdro l d)
                   (conso a d l)
                   (appendo d s res)
                   (conso a res out))))))

(run1 (x)
      (fresh (y)
             (appendo `(cake with ice . ,y)
                      '(d t)
                      x)))

(run1 (y)
      (fresh (x)
             (appendo `(cake with ice . ,y)
                      '(d t)
                      x)))

(D
 (run5 (x)
       (fresh (y)
              (appendo `(cake with ice . ,y)
                       '(d t)
                       x))))

(D
 (run5 (y)
       (fresh (x)
              (appendo `(cake with ice . ,y)
                       '(d t)
                       x))))

(D
 (run5 (x)
       (fresh (y)
              (appendo `(cake with ice . ,y)
                       `(d t . ,y)
                       x))))

(D
 (run* (x)
       (fresh (z)
              (appendo `(cake with ice cream)
                       `(d t . ,z)
                       x))))

(D
 (run7 (x)
       (fresh (y)
              (appendo x
                       y
                       `(cake with ice cream d t)))))

(D
 (run6 (y)
       (fresh (x)
              (appendo x
                       y
                       `(cake with ice cream d t)))))

(D
 (run6 (r)
       (fresh (x y)
              (appendo x y `(cake with ice cream d t))
              (== (cons x (cons y '())) r))))

'infinite-loop

'(run8 (r)
      (fresh (x y)
             (appendo x y `(cake with ice cream d t))
             (== (cons x (cons y '())) r)))

(define appendo
  (lambda (l s out)
    (conde ((nullo l)
            (== s out))
           (SUCC
            (fresh (a d res)
                   (conso a d l)
                   (conso a res out)
                   (appendo d s res))))))

(D
 (run8 (r)
       (fresh (x y)
              (appendo x y `(cake with ice cream d t))
              (== (cons x (cons y '())) r))))

(D
 (run10 (x)
        (fresh (y z)
               (appendo x y z))))

(D
 (run10 (y)
        (fresh (x z)
               (appendo x y z))))

(D
 (run10 (z)
        (fresh (x y)
               (appendo x y z))))

(D
 (run10 (r)
        (fresh (x y z)
               (appendo x y z)
               (== (list x y z) r))))

(define swappendo
  (lambda (l s out)
    "should run for ever in simple-minikanren -- BUG"
    (conde (SUCC
            (fresh (a d res)
                   (conso a d l)
                   (conso a res out)
                   (swappendo d s res)))
           (SUCC
            (nullo l)
            (== s out)))))

'(D
  (run1 (z)
        (fresh (x y)
               (swappendo x y z))))

(define unwrap
  (lambda (x)
    (cond ((pair? x) (unwrap (car x)))
          (else x))))

(unwrap '(((((pizza))))))

(unwrap '(((((pizza))) with) extra cheese))

(define unwrapo
  (lambda (x out)
    (conde ((pairo x)
            (fresh (a)
                   (caro x a)
                   (unwrapo a out)))
           (SUCC
            (== x out)))))

(D
 (run* (x)
       (unwrapo '(((((pizza))) with) extra cheese) x)))

(D
 (run* (x)
       (unwrapo '(((((pizza))))) x)))

'infinite-loop

'(D
 (run1 (x)
       (unwrapo x 'pizza)))

'(D
 (run1 (x)
       (unwrapo `((,x)) 'pizza)))

(define unwrapo
  (lambda (x out)
    (conde (SUCC (== x out))
           (SUCC
            (fresh (a)
                   (caro x a)
                   (unwrapo a out))))))

(D
 (run10 (x)
       (unwrapo x 'pizza)))

(D
 (run10 (x)
       (unwrapo x '((((pizza)))))))

(D
 (run10 (x)
        (unwrapo `((((,x)))) 'pizza)))

(define flatten
  (lambda (s)
    (cond ((null? s) '())
          ((pair? s)
           (append (flatten (car s))
                   (flatten (cdr s))))
          (else
           (cons s '())))))

(flatten '((a b) c))

(define flatteno
  (lambda (s out)
    (conde ((nullo s) (== out '()))
           ((pairo s)
            (fresh (a d resD resA)
                   (conso a d s)
                   (flatteno d resD)
                   (flatteno a resA)
                   (appendo resA resD out)))
           (SUCC
            (conso s '() out)))))

(run1 (x)
      (flatteno '((a b) (((c)))) x))

(run1 (x)
      (flatteno '(a b (((c)))) x))

(D
 (run* (x)
       (flatteno '(a b (((c)))) x)))

(D
 (run* (x)
       (flatteno '(a) x)))

(D
 (run10 (x)
        (flatteno '((a)) x)))

'(D
 (run10 (x)
        (flatteno x '(a b c))))

(define flattenrevo
  (lambda (s out)
    (conde (SUCC (conso s '() out))
           ((nullo s) (== out '()))
           ((pairo s)
            (fresh (a d resD resA)
                   (conso a d s)
                   (flattenrevo d resD)
                   (flattenrevo a resA)
                   (appendo resA resD out))))))

(D
 (run10 (x)
        (flattenrevo '((a)) x)))

(D
 (run10 (x)
        (flattenrevo '(a) x)))

(D
 (run10 (x)
        (flattenrevo '((a b) c) x)))

(D
 (reverse
  (run* (x)
         (flattenrevo '((a b) c) x))))

(D
 (run2 (x)
       (flattenrevo x '(a b c))))

'(D
 (run3 (x)
       (flattenrevo x '(a b c))))

'done


