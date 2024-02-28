
(define unit
  (lambda (code)
    (lambda (ctx)
      (cons code ctx))))

(define >>=
  (lambda (ma sequel)
    (lambda (ctx)
      (let ((p (ma ctx)))
        (let ((code (car p))
              (new/ctx (cdr p)))
          ((sequel code)
           new/ctx))))))

(define context-search
  (lambda (code)
    (display "\n::")
    (display code)
    (newline)
    (cond ((symbol? code)
           (>>= (lambda (ctx)
                  (display "!!!!\n")
                  (display ctx)
                  (newline)
                  (cons
                   (if (assoc code ctx)
                       (cdr (assoc code ctx))
                       code)
                   ctx))
                (lambda (code)
                  (unit code))))
          ((not (pair? code))
           (unit code))
          ((eq? (car code) 'typedef)
           (>>= (lambda (ctx)
                  (let ((ty (cadr code))
                        (alias (caddr code)))
                    (cons 'define-new-type-alias
                          (cons (cons ty alias) ctx))))
                (lambda (code)
                  (unit code))))
          (else
           (>>= (context-search (car code))
                (lambda (a)
                  (>>= (context-search (cdr code))
                       (lambda (d)
                         (unit (cons a d))))))))))


((context-search
  '((typedef int integer)
    (defun main (int argc, char** argv)
      (int (aaa (+ 10 20))
           (bbb ())))))
 '())

