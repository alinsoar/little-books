#lang racket

(define (d . args)
  (define (iter a co)
    (if (null? a)
        (co (lambda () (newline)))
        (iter (cdr a)
              (lambda (x)
                (co (lambda ()
                      (display (car a))
                      (or (null? (cdr a))
                          (display " "))
                      (x)))))))
  (void (iter args (lambda (x) (x)))))

(define flatten
  (lambda (l) 
    
    (define unit
      (lambda (x)
        (lambda (accum)
          (if (null? x)
              accum
              (cons x accum)))))

    (define >>=
      (lambda (ma sequel)
        (lambda (accum)
          ((sequel '...)
           (ma accum)))))
    
    (define iter
      (lambda (l)
        (cond ((null? l)
               (unit '()))
              ((pair? (car l))
               (>>= (iter (car l))
                    (lambda _
                      (>>= (iter (cdr l))
                           (lambda _
                             (unit '()))))))
              (else
               (>>= (iter (cdr l))
                    (lambda _
                      (unit (car l))))))))
    ((iter l) '())))

(flatten '(1 2 (3 4)))
(define flatten/max/idx
  (lambda (l)

    (define unit
      (lambda (x)
        ;; (d 'UNIT x)
        (lambda (s)
          (define new
            (if (null? x)
                (cons '__ s)
                (let ((M (max x (car s)))
                      (1+ (+ 1 (cadr s))))
                 (cons '__
                       (cons M
                             (cons 1+
                                   (append (cddr s) (list x
                                                          M
                                                          1+))))))))
          ;; (d new)
          new)))

    (define >>=
      (lambda (ma next)
        (lambda (s0)
          (define P (ma s0))
          (define VAL (car P))
          (define STA (cdr P))
          (define mb (next VAL))
          (mb STA))))

    (define iter
      (lambda (l)
        (cond ((null? l)
               (unit '()))
              ((pair? (car l))
               (>>= (iter (car l))
                    (lambda _
                      (>>= (iter (cdr l))
                           (lambda _
                             (unit '()))))))
              (else
               (>>= (unit (car l))
                    (lambda _
                      (iter (cdr l))))))))

    (d "--")
    (cddr
     ((iter l) (cons (- (expt 100000 100000))
                     (cons 0
                           '()))))))

(flatten/max/idx '(1 2 3 (4 5 6) ((((7) 8) 9) 0) 1 ))




