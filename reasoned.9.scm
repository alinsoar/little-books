
(load "reasoned-mk.scm")

(var 'u)
(var 'v)
(var 'w)

(define u (var 'u))
(define v (var 'v))
(define w (var 'w))

(define x (var 'x))
(define y (var 'y))
(define z (var 'z))

(rhs (cons z 'a))
(rhs (cons z x))
(lhs (cons z 'a))

(list (cons z 'a)
      (cons x w)
      (cons y z))

(define empty-s
  '())

(walk z (list (cons z 'a)
              (cons x w)
              (cons y z)))
(walk y (list (cons z 'a)
              (cons x w)
              (cons y z)))
(walk x (list (cons z 'a)
              (cons x w)
              (cons y z)))
(walk w (list (cons z 'a)
              (cons x w)
              (cons y z)))
'(walk x (list (cons x y)
              (cons z x)
              (cons y z)))
(walk w (list (cons x y)
              (cons w 'b)
              (cons z x)
              (cons y z)))

(define walk
  (lambda (v s)
    (cond ((and (var? v) (assq v s)) => (lambda (a) (walk (rhs a) s)))
          (else v))))

(walk z (list (cons z 'a)
              (cons x w)
              (cons y z)))
(walk y (list (cons z 'a)
              (cons x w)
              (cons y z)))
(walk x (list (cons z 'a)
              (cons x w)
              (cons y z)))
(walk w (list (cons z 'a)
              (cons x w)
              (cons y z)))
'(walk x (list (cons x y)
              (cons z x)
              (cons y z)))
(walk w (list (cons x y)
              (cons w 'b)
              (cons z x)
              (cons y z)))

(define ext-s
  (lambda (x v s)
    (cons `(,x . ,v) s)))

'(walk x
      (ext-s x y
             (list (cons z x)
                   (cons y z))))

(walk y (list (cons x 'e)))

(walk y (ext-s
         y x
         (list (cons x 'e))))

(walk x (list (cons y z)
              (cons x y)))

(walk x (ext-s z 'b (list (cons y z)
                          (cons x y))))

(walk x (ext-s z w (list (cons y z)
                         (cons x y))))

(unify v w empty-s)

(define unify
  (lambda (v w s)
    (let ((v (walk v s))
          (w (walk w s)))
      (cond
        ((eq? v w) s)
        ((var? v) (ext-s v w s))
        ((var? w) (ext-s w v s))
        ((and (pair? v) (pair? w))
         (cond
           ((unify (car v) (car w) s) =>
            (lambda (s)
              (unify (cdr v) (cdr w) s)))
           (else #f)))
        ((equal? v w) s)
        (else #f)))))

(unify v w empty-s)

(define unify
  (lambda (v w s)
    (let ((v (walk v s))
          (w (walk w s)))
      (cond
        ((equal? v w) s)
        ((var? v) (ext-s v w s))
        ((var? w) (ext-s w v s))
        ((and (pair? v) (pair? w))
         (cond
           ((unify (car v) (car w) s) =>
            (lambda (s)
              (unify (cdr v) (cdr w) s)))
           (else #f)))
        (else #f)))))

(unify v w empty-s)

(define walk*
  (lambda (v s)
    (let ((v (walk v s)))
      (cond ((pair? v)
             (cons
              (walk* (car v) s)
              (walk* (cdr v) s)))
            (else v)))))

(define reify-s
  (lambda (v s)
    (let ((v (walk v s)))
      (cond ((var? v) (ext-s v
                             (reify-name (size-s s))
                             s))
            ((pair? v) (reify-s (cdr v)
                                (reify-s (car v) s)))
            (else s)))))

(reify-s v empty-s)

(let ((r (list w x y)))
  (walk* r (reify-s r empty-s)))

(let ((r (walk* (list x y z) empty-s)))
  (walk* r (reify-s r empty-s)))

(let ((r (list u
               (list v
                     (list w x)
                     y)
               x)))
  (walk* r (reify-s r empty-s)))

(let ((s `((,y . (,z ,w c ,w)) (,x . ,y) (,z . a))))
  (let ((r (walk* x s)))
    (walk* r (reify-s r empty-s))))

(let ((r (list 'a w 'c w)))
  (walk* r (reify-s r empty-s)))

(define reify-name
  (lambda (n)
    (string->symbol
     (string-append "_" "." (number->string n)))))

(define reify
  (lambda (v)
    (walk* v (reify-s v empty-s))))

(reify (list 'a w 'c w))


'done


