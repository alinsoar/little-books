
(load "prover-load-j-bob.scm")

(jbob.step (prelude)
           '(car (cons 'ham '(cheese)))
           '())

(jbob.step (prelude)
           '(car (cons 'ham '(cheese)))
           '((() (car/cons 'ham '(cheese)))))

(jbob.step (prelude)
           '(equal 'flapjack (atom (cons a b)))
           '(((2) (atom/cons a b))
             (() (equal 'flapjack 'nil))))

(jbob.step (prelude)
           '(atom (cdr (cons (car (cons p q)) '())))
           '(((1 1 1) (car/cons p q))
             ((1) (cdr/cons p '()))
             (() (atom '()))))

(jbob.step (prelude)
           '(if a c c)
           '())

(jbob.step (prelude)
           '(if a c c)
           '((() (if-same a c))))

(jbob.step (prelude)
           '(if a c c)
           '((() (if-same a c))
             (() (if-same
                  (if (equal a 't)
                      (if (equal 'nil 'nil)
                          a
                          b)
                      (equal 'or (cons 'black '(coffee))))
                  c))
             ;;((Q E 2) (cons 'black '(coffee)))
             ))

(jbob.step (prelude)
           '(if a c c)
           '((() (if-same a c))
             (() (if-same
                  (if (equal a 't)
                      (if (equal 'nil 'nil)
                          a
                          b)
                      (equal 'or (cons 'black '(coffee))))
                  c))
             ((Q E 2) (cons 'black '(coffee)))))

(jbob.step (prelude)
           '(if a c c)
           '((() (if-same a c))
             (() (if-same
                  (if (equal a 't)
                      (if (equal 'nil 'nil)
                          a
                          b)
                      (equal 'or
                             (cons 'black '(coffee))))
                  c))
             ((Q E 2) (cons 'black '(coffee)))
             ((Q A Q) (equal-same 'nil))))

(jbob.step (prelude)
           '(if a c c)
           '((() (if-same a c))
             (() (if-same
                  (if (equal a 't)
                      (if (equal 'nil 'nil)
                          a
                          b)
                      (equal 'or
                             (cons 'black '(coffee))))
                  c))
             ((Q E 2) (cons 'black '(coffee)))
             ((Q A Q) (equal-same 'nil))
             ((Q A 2) (if-true a b))))

(jbob.step (prelude)
           '(if a c c)
           '((() (if-same a c))
             (() (if-same
                  (if (equal a 't)
                      (if (equal 'nil 'nil)
                          a
                          b)
                      (equal 'or
                             (cons 'black '(coffee))))
                  c))
             ((Q E 2) (cons 'black '(coffee)))
             ((Q A Q) (equal-same 'nil))
             ((Q A) (if-true a b))))

(jbob.prove (prelude)
            '())

(jbob.prove (prelude)
            '(((defun pair (x y)
                 (cons x (cons y '())))
               nil)))

(jbob.prove (prelude)
            '(((defun pair (x y)
                 (cons x (cons y '())))
               nil)
              ((defun first-of (x)
                 (car x))
               nil)
              ((defun second-of (x)
                 (car (cdr x)))
               nil)))

(jbob.prove (prelude)
            '(((defun pair (x y)
                 (cons x (cons y '())))
               nil)
              ((defun first-of (x)
                 (car x))
               nil)

              ((defun second-of (x)
                 (car (cdr x)))
               nil)

              ((dethm first-of-pair (a b)
                      (equal (first-of (pair a b))
                             a))
               nil
               ((1 1) (pair a b))
               ;; ((1) (first-of (cons a (cons b '()))))
               )))

(jbob.prove (prelude)
            '(((defun pair (x y)
                 (cons x (cons y '())))
               nil)
              ((defun first-of (x)
                 (car x))
               nil)

              ((defun second-of (x)
                 (car (cdr x)))
               nil)

              ((dethm first-of-pair (a b)
                      (equal (first-of (pair a b))
                             a))
               nil
               ((1 1) (pair a b))
               ((1) (first-of (cons a (cons b '()))))
               )))

(jbob.prove (prelude)
            '(((defun pair (x y)
                 (cons x (cons y '())))
               nil)
              ((defun first-of (x)
                 (car x))
               nil)

              ((defun second-of (x)
                 (car (cdr x)))
               nil)

              ((dethm first-of-pair (a b)
                      (equal (first-of (pair a b))
                             a))
               nil
               ((1 1) (pair a b))
               ((1) (first-of (cons a (cons b '()))))
               ((1) (car/cons a (cons b '())))
               )))

(jbob.prove (prelude)
            '(((defun pair (x y)
                 (cons x (cons y '())))
               nil)
              ((defun first-of (x)
                 (car x))
               nil)

              ((defun second-of (x)
                 (car (cdr x)))
               nil)

              ((dethm first-of-pair (a b)
                      (equal (first-of (pair a b))
                             a))
               nil
               ((1 1) (pair a b))
               ((1) (first-of (cons a (cons b '()))))
               ((1) (car/cons a (cons b '())))
               (() (equal-same a))
               )))

(defun prelude+first-of-pair ()
  (J-Bob/define (prelude)
                '(((defun pair (x y)
                     (cons x (cons y '())))
                   nil)
                  ((defun first-of (x)
                     (car x))
                   nil)

                  ((defun second-of (x)
                     (car (cdr x)))
                   nil)

                  ((dethm first-of-pair (a b)
                          (equal (first-of (pair a b))
                                 a))
                   nil
                   ((1 1) (pair a b))
                   ((1) (first-of (cons a (cons b '()))))
                   ((1) (car/cons a (cons b '())))
                   (() (equal-same a))))))

(jbob.prove (prelude)
            '(((dethm first-of-pair (a b)
                      (equal (first-of (pair a b))
                             a))
               nil)))

(jbob.prove (prelude+first-of-pair)
            '(((dethm second-of-pair (a b)
                      (equal (second-of (pair a b))
                             b))
               nil)))

(jbob.prove (prelude+first-of-pair)
            '(

              ((dethm second-of-pair (a b)
                      (equal (second-of (pair a b))
                             b))
               nil)

              ((defun in-pair? (xs)
                 (if (equal (first-of xs) '?)
                     't
                     (equal (second-of xs) '?)))
               nil)

              ((dethm in-first-of-pair (b)
                      (equal (in-pair? (pair '? b))
                             't))
               nil)

              ((dethm in-second-of-pair (a)
                      (equal (in-pair? (pair a '?))
                             't))
               nil)
              ))

(jbob.prove (prelude)
            '(((defun list? (x)
                 (if (atom x)
                     (equal x '())
                     (list? (cdr x))))
               nil)))

(jbob.prove (prelude)
            '(((defun list? (x)
                 (if (atom x)
                     (equal x '())
                     (list? (cdr x))))
               (size x)
               ((Q) (natp/size x))
               (() (if-true (if (atom x)
                                't
                                (< (size (cdr x)) (size x)))
                            'nil))
               ((E) (size/cdr x))
               (() (if-same (atom x) 't)))))

(defun defun.remb ()
  (J-Bob/define (defun.memb?)
                '()))

(jbob.prove (prelude)
            '(
              ((defun memb? (xs)
                 (if (atom xs)
                     'nil
                     (if (equal (car xs) '?)
                         't
                         (memb? (cdr xs)))))
               (size xs))
              ((defun remb (xs)
                 (if (atom xs)
                     '()
                     (if (equal (car xs) '?)
                         (remb (cdr xs))
                         (cons (car xs)
                               (remb (cdr xs))))))
               (size xs))))

(jbob.prove (prelude)
            '(
              ((defun memb? (xs)
                 (if (atom xs)
                     'nil
                     (if (equal (car xs) '?)
                         't
                         (memb? (cdr xs)))))
               (size xs)
               ((A E E) (size/cdr xs))
               ((A E) (if-same (equal (car xs) '?) 't))
               ((Q) (natp/size xs))
               ((A) (if-same (atom xs) 't))
               (() (if-true 't 'nil)))
              ((defun remb (xs)
                 (if (atom xs)
                     '()
                     (if (equal (car xs) '?)
                         (remb (cdr xs))
                         (cons (car xs)
                               (remb (cdr xs))))))
               (size xs)
               ((A E) (size/cdr xs))
               ((A) (if-same (atom xs) 't))
               ((Q) (natp/size xs))
               (() (if-true 't 'nil)))))


