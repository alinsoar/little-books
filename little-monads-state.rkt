#lang racket

;;; Make experiments using
;;; 
;;; A Schemer’s View of Monads
;;; Daniel P. Friedman  &  Adam C. Foltzer
;;; 2010, 2011


(define p
  (lambda a
    (map (lambda (x)
           (display (~a x ":")))
         a)
    (newline)))

(define p0
  (lambda a
    (map (lambda (x)
           (display (~a x)))
         a)
    (newline)))

;;; STATE MONAD

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> STATE-MONAD--EVEN-LENGTH?")
(define even-length?
  (lambda (ls)
    (cond ((null? ls) true)
          (else (not (even-length? (cdr ls)))))))

(module+ test
 (even-length? '(1 2 3 4))
 (even-length? '(1 2 3)))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> even-length? -- Using Store-passing-style")
(define even-length/store?
  (lambda (ls s)
    (cond ((null? ls) s)
          (else (even-length/store? (cdr ls)
                                    (not s))))))

(module+ test
  (even-length/store? '(1 2 3 4) true)
  (even-length/store? '(1 2 3) true))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> even-length? -- Using the state monad")

(define even-length/state-monad?
  (lambda (ls)
    (if (null? ls)
        (unit '_)
        (>>=
         ;; this is the computation of the state
         (lambda (s)
           (cons '_ (not s)))
         ;; this is the sequel computation
         (lambda (_)
           (even-length/state-monad? (cdr ls)))))))

(define unit
  (lambda (a)
    (lambda (s)                              ; This function is ma
      (cons a s))))

(define star
  (lambda (sequel)
    (lambda (ma)
      (lambda (s)               ; <== This function is a monad
        (let* ((pair (ma s))
               (pure-val (car pair))
               (extra-val (cdr pair)))
          (let ((mb (sequel pure-val)))
            (mb extra-val)))))))

;;; the job of bind-state is to thread the state from the first
;;; computation to the computation returned by sequel.
(define >>=
  (lambda (ma sequel)                        ; ma is the 1st computattion
                                        ; that computes the next state
    (lambda (s)                              ; s is the state (F/T) of the
                                        ; previous computation
      (let ((p (ma s)))                 ; the result of ma is a cons
                                        ; such as
                                        ;
                                        ; (NATURAL-VALUE . STATE).
                                        ;
        (let ((nat-val (car p))         ; NATURAL VALUE
              (state   (cdr p)))        ; RESULTING STATE
                                        ; returned by ma.
          (let ((mb (sequel nat-val)))  ; mb is the second computation
                                        ; NAT-VAL -> Monad. Monad is
                                        ;
                                        ; (STATE->(NAT-VAL . STATE))
                                        ;
            (mb state)))))))            ; composed computations

(module+ test
  ((even-length/state-monad? '(1 2 3 4)) true)
  ((even-length/state-monad? '(1 2 3)) true)
  ((even-length/state-monad? '()) true))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> RemberEvenS -- direct style, 2 passes")

(define remberevensXcountevens/2pass
  (lambda (l)
    (cons (remberevens/direct l) (countevens/direct l))))

(define remberevens/direct
  (lambda (l)
    (cond ((null? l) '())
          ((pair? (car l)) (cons (remberevens/direct (car l))
                                 (remberevens/direct (cdr l))))
          ((or (null? (car l)) (odd? (car l)))
           (cons (car l) (remberevens/direct (cdr l))))
          (else (remberevens/direct (cdr l))))))

(define countevens/direct
  (lambda (l)
    (cond ((null? l) 0)
          ((pair? (car l)) (+ (countevens/direct (car l))
                              (countevens/direct (cdr l))))
          ((or (null? (car l)) (odd? (car l)))
           (countevens/direct (cdr l)))
          (else (add1 (countevens/direct (cdr l)))))))

(module+ test
 (remberevensXcountevens/2pass '(2 3 (7 4 5 6) 8 (9 2))))


;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> RemberEvenS -- CPS")

(define 1+ (lambda (m x) (p0 "::" m ";\n" "1 + " x) (add1 x)))
(define add (lambda (m x y) (p0 "::" m ";\n" x " + " y) (add1 x)))

(define remberevensXcountevens/cps
  (lambda (l co)
    (cond ((null? l) (co '() 0))
          ((pair? (car l))
           (remberevensXcountevens/cps
            (car l)
            (lambda (l1 v1)
              (remberevensXcountevens/cps
               (cdr l)
               (lambda (l2 v2)
                 (co (cons l1 l2)
                     (add (car l) v1 v2)))))))
          ((or (null? (car l))
               (odd? (car l)))
           (remberevensXcountevens/cps
            (cdr l)
            (lambda (l2 v2)
              (co (cons (car l) l2) v2))))
          (else (remberevensXcountevens/cps
                 (cdr l)
                 (lambda (l2 v2)
                   (co l2 (1+ (car l) v2))))))))

(define remberevensXcountevens/cps2
  (lambda (l co)
    (cond ((null? l) (co '(() . 0)))
          ((list? (car l))
           (remberevensXcountevens/cps2
            (car l)
            (lambda (a)
              (remberevensXcountevens/cps2
               (cdr l)
               (lambda (d)
                 (co (cons (cons (car a) (car d))
                           (add "@" (cdr a) (cdr d)))))))))
          ((odd? (car l))
           (remberevensXcountevens/cps2
            (cdr l)
            (lambda (q)
              (co (cons (cons (car l) (car q))
                        (cdr q))))))
          (else (remberevensXcountevens/cps2
                 (cdr l)
                 (lambda (q)
                   (co (cons (car q)
                             (1+ "?" (cdr q))))))))))

(module+ test
  (remberevensXcountevens/cps2 '(2 3 (7 4 5 6) 8 (9) 2) (lambda (x) x))
  
  (remberevensXcountevens/cps '(2 3 (7 4 5 6) 8 (9) 2) cons))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> RemberEvenS -- monadic style -- missing state")

(define remberevens/monad
  (lambda (l)
    (cond ((null? l) (unit '()))
          ((pair? (car l))
           (>>=
            (remberevens/monad (car l))
            (lambda (va)
              (>>=
               (remberevens/monad (cdr l))
               (lambda (vd)
                 (unit (cons va vd)))))))
          ((or (null? (car l)) (odd? (car l)))
           (>>=
            (remberevens/monad (cdr l))
            (lambda (vd)
              (unit (cons (car l) vd)))))
          (else
           (remberevens/monad (cdr l))))))

(module+ test
 ((remberevens/monad '(2 3 (7 4 5 6) 8 (9 2))) 0))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> RemberEvenS X CountEvenS -- almost monadic style")

(define remberevensXcountevens/almost-monad
  (lambda (l)
    (cond ((null? l) (unit '()))
          ((pair? (car l))
           (>>=
            (remberevensXcountevens/almost-monad (car l))
            (lambda (va)
              (>>=
               (remberevensXcountevens/almost-monad (cdr l))
               (lambda (vd)
                 (unit (cons va vd)))))))
          ((or (null? (car l)) (odd? (car l)))
           (>>=
            (remberevensXcountevens/almost-monad (cdr l))
            (lambda (vd) (unit (cons (car l) vd)))))
          (else
           (remberevensXcountevens/almost-monad (cdr l))))))

(module+ test
 ((remberevensXcountevens/almost-monad '(2 3 (7 4 5 6) 8 (9 2)))
  'missing-integer-state))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> RemberEvenS X CountEvenS -- monadic style")

(define remberevensXcountevens/monad
  (lambda (l)
    (cond ((null? l)
           (unit '()))
          ((pair? (car l))
           (>>=
            (remberevensXcountevens/monad (car l))
            (lambda (va)
              (>>=
               (remberevensXcountevens/monad (cdr l))
               (lambda (vd)
                 (unit (cons va vd)))))))
          ((or (null? (car l)) (odd? (car l)))
           (>>=
            (remberevensXcountevens/monad (cdr l))
            (lambda (vd)
              (unit (cons (car l) vd)))))
          (else (>>=
                 (lambda (s)
                   (cons '_ (1+ s)))
                 (lambda (_)
                   (remberevensXcountevens/monad (cdr l))))))))

(module+ test
  ((remberevensXcountevens/monad '(2 3 (7 4 5 6) 8 (9 2))) 0)
  ((remberevensXcountevens/monad '(4 4 4)) 0))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "---> Deriving the monad from Store Passing Style")

(define remberevensXcountevens/s-p-s
  (lambda (l STATE)
    "remove evens and count removed evens"
    ;; (p "> " l)
    (cond ((null? l)
           (cons '() STATE))
          ((pair? (car l))
           (let ((va (remberevensXcountevens/s-p-s (car l) STATE)))
             (let ((vd (remberevensXcountevens/s-p-s (cdr l) (cdr va))))
               (cons (cons (car va) (car vd))
                     (cdr vd)))))
          ((or (null? (car l)) (odd? (car l)))
           (let ((vd (remberevensXcountevens/s-p-s (cdr l) STATE)))
             (cons (cons (car l) (car vd))
                   (cdr vd))))
          (else
           (let ((vd (remberevensXcountevens/s-p-s (cdr l) STATE)))
             (cons (car vd)
                   (1+ (cdr vd))))))))

(module+ test
 (remberevensXcountevens/s-p-s '(2 3 (7 4 5 6) 8 (9 2)) 0))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(p "===> Reverse list of integers and count the even integers")

(define reverse-and-count-evens
  (lambda (l)
    "remove evens and count removed evens"
    (cond ((null? l)
           (unit '()))
          ((even? (car l))
           (>>=
            (lambda (s) (cons '_ (+ 1 s)))
            (lambda (_)
              (>>=
               (reverse-and-count-evens (cdr l))
               (lambda (v)
                 (unit (append v (list (car l)))))))))
          (else
           (>>=
            (reverse-and-count-evens (cdr l))
            (lambda (v)
              (unit (append v (list (car l))))))))))

(module+ test
  ((reverse-and-count-evens '()) 0)
  ((reverse-and-count-evens '(1)) 0)
  ((reverse-and-count-evens '(1 2 3 4 5 6)) 0))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define remberevens
  (lambda (l)
    "remove evens"
    (cond ((null? l)
           (unit '()))
          ((list? (car l))
           ((star (lambda (a)
                    ((star (lambda (d)
                             (unit (cons a d))))
                     (remberevens (cdr l)))))
            (remberevens (car l))))
          ((odd? (car l))
           ((star (lambda (d)
                    (unit (cons (car l) d))))
            (remberevens (cdr l))))
          (else
           (remberevens (cdr l))))))

(module+ test
  ((remberevens '(1 2 3 (4 5 6))) 0))

(define remberevensXcount
  (lambda (l)
    "remove evens and count removed evens"
    (cond ((null? l)
           (unit '()))
          ((list? (car l))
           ((star (lambda (a)
                    ((star (lambda (d)
                             (unit (cons a d))))
                     (remberevensXcount (cdr l)))))
            (remberevensXcount (car l))))
          ((odd? (car l))
           ((star (lambda (d)
                    (unit (cons (car l) d))))
            (remberevensXcount (cdr l))))
          (else
           ((star (lambda (_) (remberevensXcount (cdr l))))
            (lambda (s) (cons '_ (add1 s))))))))

((remberevensXcount '(1 2 3 (4 5 6) (((0))))) 0)



