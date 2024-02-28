;;;  -*- mode:scheme; buffer-read-only:nil -*- 

(load "libscm")
(load "reasoned2-10-impl.scm")

(define u (var 'u))
(define v (var 'v))
(define w (var 'w))

(define x (var 'x))
(define y (var 'y))
(define z (var 'z))

(let ((z (var '?)))
  (walk z
        `((,z . a)
          (,x . ,w)
          (,y . ,z))))

(let ((y (var '?)))
  (walk y
        `((,z . a)
          (,x . ,w)
          (,y . ,z))))

(let ((x (var '?x))
      (y (var '?y)))
  (occurs? x `(,y) `((,y . ,x))))

(let ((x (var '?)))
  (ext-s x `(,x) empty-s))

(let ((x (var '?x)) (y (var '?y)))
  (ext-s x `(,y) `((,y . ,x))))

(let ((x (var '?x))
      (y (var '?y))
      (z (var '?z)))
  (let ((s `((,z . ,x) (,y . ,z))))
    (let ((s (ext-s x 'e s)))
      (and s (walk y s)))))

((== true false) empty-s)

(FAIL empty-s)

((== false false) empty-s)

(SUCC empty-s)

(let ((x (var '?x)) (y (var '?y)))
  ((== x y) empty-s))

(let ((x (var '?x)) (y (var '?y)))
  ((== y x) empty-s))

(let ((x (var '?x)))
  ((disj2
    (== 'olive x)
    (== 'oil x))
   empty-s))

(define (nevero)
  (lambda (s)
    (lambda ()
      ((nevero) s))))

((nevero) empty-s)

(let ((sinf ((disj2
              (== 'olive x)
              (nevero))
             empty-s)))
  sinf)

(let ((sinf ((disj2
              (nevero)
              (== 'olive x))
             empty-s)))
  sinf)

(let ((sinf ((disj2
              (nevero)
              (== 'olive x))
             empty-s)))
  (sinf))

(define (alwayso)
  (lambda (s)
    (lambda ()
      ((disj2 SUCC (alwayso))
       s))))

(((alwayso) empty-s))

((disj2 SUCC (alwayso))
 empty-s)

(let ((sinf (((alwayso) empty-s))))
  (cons (car sinf) '()))

(let ((sinf (((alwayso) empty-s))))
  (cons (car sinf)
        (let ((sinf ((cdr sinf))))
          (cons (car sinf) '()))))

(define first-n-substitutions
  (lambda (n s col)
    (if (zero? n)
        (col '())
        (first-n-substitutions
         (- n 1)
         ((cdr s))
         (lambda (rest)
           (col
            (cons (car s) rest)))))))

(first-n-substitutions 37
                       (((alwayso) empty-s))
                       (lambda (l)
                         l))

;;; no value -- force a suspension created by nevero
'(take-inf 1 ((nevero) empty-s))

'(take-inf false ((nevero) empty-s))

(take-inf 3 ((alwayso) empty-s))

;;; no value -- maximum recursion depth exceeded
'(take-inf false ((alwayso) empty-s))

(let ((k (length (take-inf
                  5
                  ((disj2 (== 'olive x) (== 'oil x))
                   empty-s)))))
  `(Found ,k not 5 substitution))

(map length
     (take-inf
      5
      ((disj2 (== 'olive x) (== 'oil x))
       empty-s)))

(take-inf 1
          ((call/fresh 'x (lambda (fruit)
                            (== 'plum fruit)))
           empty-s))

(let ((x (var '?x)))
  (map (reify x)
       (take-inf 5
                 ((disj2 (== 'olive x)
                         (== 'oil x))
                  empty-s))))

(let ((x (var '?x)))
  (map (reify x)
       (run-goal 5
                 (disj2 (== 'olive x) (== 'oil x)))))

(define (appendo l t out)
  (lambda (s)
    (lambda ()
      ((disj2
        (conj2 (nullo l) (== t out))
        (call/fresh
         'a
         (lambda (a)
           (call/fresh
            'd
            (lambda (d)
              (call/fresh
               'res
               (lambda (res)
                 (conj2
                  (conso a d l)
                  (conj2
                   (conso a res out)
                   (appendo d t res))))))))))
       s))))

(define (conso a d p)
  (lambda (s)
    (lambda ()
      ((== `(,a . ,d) p) s))))

(define (nullo x)
  (lambda (s)
    (lambda ()
      ((== '() x) s))))

(let ((q (var 'q)))
  (map (reify q)
       (run-goal
        false
        (call/fresh
         'x
         (lambda (x)
           (call/fresh
            'y
            (lambda (y)
              (conj2 (== `(,x ,y) q)
                     (appendo x y
                              '(cake & ice d t))))))))))
