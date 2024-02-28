
(define __d
  (lambda a
    ((lambda (s) (s s a))
     (lambda (s l)
       (if (null? l)
           (newline)
           (begin
             (display (car l))
             (display " ")
             (s s (cdr l))))))))

(define test
  (lambda test/result
    (display "----\n")
    ((lambda (s) (s s test/result))
     (lambda (s l)
       (if (null? l)
           (newline)
           (begin
             (display "~~> ")
             (display (car l))
             (newline)
             (s s (cdr l))))))))
