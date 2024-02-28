
(load "libscm")

(define unit
  (lambda (a)
    ;; (__d ":" a)
    (lambda (k __ex__)
      (k a))))

(define bind
  (lambda (ma seq)
    (lambda (k ex)
      (ma (lambda (p)
            ((seq p) k ex))
          ex))))

(define product
  (lambda (l)
    (cond ((null? l)
           (unit 1))
          ((pair? (car l))
           (bind (product (cdr l))
                 (lambda (d)
                   ;; (__d "<:A" (car l))
                   (bind (product (car l))
                         (lambda (a)
                           ;; (__d "<:B" (car l))
                           (unit (* a d)))))))
          ((pair? l)
           (bind (lambda (k ex)
                   (if (zero? (car l))
                       (ex)
                       ((product (cdr l)) k ex)))
                 (lambda (p)
                   (__d "<:C" (car l))
                   (unit (* (car l) p))))))))

;;; (10 20 30)

(define return
  (lambda (a)
    (lambda (k)
      (k a))))

(define >>=
  (lambda (ma seq)
    (lambda (k)
      (ma (lambda (p)
            ((seq p) k))))))

(display
 ((>>= (lambda (k)
         ((>>= (lambda (k)
                 ((>>= (lambda (k)
                         ((>>= (lambda (k)
                                 ((>>= (lambda (k)
                                         ((return 1) k))
                                       (lambda (p)
                                         (return (* 6 p))))
                                  k ))
                               (lambda (p)
                                 (return (* 5 p))))
                          k ))
                       (lambda (p)
                         (return (* 4 p))))
                  k ))
               (lambda (p)
                 (return (* 3 p))))
          k ))
       (lambda (p)
         (return (* 2 p))))
  (lambda (x)
    x)))

(newline)

(define test
  (lambda (input)
    (display "test: ")
    (display input)
    (newline)
    ((product input)
     (lambda (x)
       (display "==>")
       (display x)
       (newline))
     (lambda ()
       (display "\nstop\n")))))

(test '())

(test '(10 20 30))

(test '(1 2 (3 (4 5) 6) 7))

(test '(1 2 (3 (4 0) 6) 7))

