;;;  -*- mode:scheme; buffer-read-only:nil -*-

(define (var name) (vector name))
(define (var? x) (vector? x))

(define empty-s '())

;;; invariant: if the result is a variable `x`, then `x` is fresh,
;;; otherwise `x` is bound
(define walk
  (lambda (v s)
    (let ((a (and (var? v) (assv v s))))
      (cond
       ((pair? a) (walk (cdr a) s))
       (else v)))))

;;; extends the substitution `s` with a new association (x . v) if
;;; this association does not create a cycle (`x` to be defined in
;;; terms of reference to `x`
(define (ext-s x v s)
  (cond
   ((occurs? x v s) #f)
   (else (cons `(,x . ,v) s))))

;;; tests whether `x` occurs or not in `v` using the substitution `s`.
(define (occurs? x v s)
  (let ((v (walk v s)))
    (cond
     ((var? v) (eqv? v x))
     ((pair? v)
      (or (occurs? x (car v) s)
          (occurs? x (cdr v) s)))
     (else #f))))

;;; returns either False or the substitution S extended with zero or
;;; more associations
(define (unify u v s)
  (let ((u (walk u s)) (v (walk v s)))
    (cond
     ;; eqv? works for strings, chars, numbers, booleans, symbols, ()
     ;; and our variables. here 2 fresh variables are unified.
     ;;
     ;; eqv? is false for 2 identical lists (equal? lists)
     ((eqv? u v) s)
     ;; u is fresh, v is not fresh
     ((var? u) (ext-s u v s))
     ;; v is fresh, u is not fresh
     ((var? v) (ext-s v u s))
     ((and (pair? u) (pair? v))
      ;; unify the cars of u and v and recurse with the resulting
      ;; substitution
      (let ((s (unify (car u) (car v) s)))
        (and s
             (unify (cdr u) (cdr v) s))))
     (else #f))))

;;; given a substitution, the goals produce a stream of substitutions
(define (== u v)
  (lambda (s)
    (let ((s (unify u v s)))
      (if s `(,s) '()))))

(define SUCC
  (lambda (s)
    `(,s)))

(define FAIL
  (lambda (s)
    '()))

(define (disj2 g1 g2)
  (lambda (s)
    (append-inf (g1 s) (g2 s))))

(define (append-inf s-inf t-inf)
  (cond
   ((null? s-inf) t-inf)
   ((pair? s-inf)
    (cons (car s-inf)
          (append-inf (cdr s-inf) t-inf)))
   (else (lambda ()
           (append-inf t-inf (s-inf))))))

(define (take-inf n s-inf)
  (define sub1 (lambda (n) (- n 1)))
  (cond
   ((and n (zero? n)) '())
   ((null? s-inf) '())
   ((pair? s-inf) 
    (cons (car s-inf)
          (take-inf (and n (sub1 n))
                    (cdr s-inf))))
   (else (take-inf n (s-inf)))))

(define (conj2 g1 g2)
  (lambda (s)
    (append-map-inf g2 (g1 s))))

(define (append-map-inf g s-inf)
  (cond
   ((null? s-inf) '())
   ((pair? s-inf)
    (append-inf (g (car s-inf))
                (append-map-inf g (cdr s-inf))))
   (else (lambda () 
           (append-map-inf g (s-inf))))))

(define (call/fresh name f)
  (f (var name)))

(define (reify-name n)
  (string->symbol
    (string-append "_"
      (number->string n))))

;;; if a value is walk*ed is a substitution s and walk* produces a
;;; value v, then we know that each variable in v is fresh
(define (walk* v s)
  (let ((v (walk v s)))
    (cond
     ((var? v) v)
     ((pair? v)
      (cons
       (walk* (car v) s)
       (walk* (cdr v) s)))
     (else v))))

(define-syntax project
  (syntax-rules ()
    ((project (x ...) g ...)
     (lambda (s)
       (let ((x (walk* x s)) ...)
         ((conj g ...) s))))))

(define (reify-s v r)
  (let ((v (walk v r)))
    (cond
     ((var? v)
      (let ((n (length r)))
        (let ((rn (reify-name n)))
          (cons `(,v . ,rn) r))))
     ((pair? v)
      (let ((r (reify-s (car v) r)))
        (reify-s (cdr v) r)))
     (else r))))

(define (reify v)
  (lambda (s)
    (let ((v (walk* v s)))
      (let ((r (reify-s v empty-s)))
        (walk* v r)))))

(define (run-goal n g)
  (take-inf n (g empty-s)))
