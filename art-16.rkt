#lang racket

;;; Scheme and the Art of Programming

(define receiver1
  (let ((n 0))
    (lambda (proc)
      (set! n (+ 1 n))
      (display (~a "RECEIVER1[" proc "]" "\n"))
      (proc (list 1 n)))))
(define receiver2
  (let ((n 0))
    (lambda (proc)
      (set! n (+ 1 n))
      (display (~a "RECEIVER2[" proc "]" "\n"))
      (proc (list
             (proc (list 2 n)))))))
(define receiver3
  (let ((n 0))
    (lambda (proc)
      (set! n (+ 1 n))
      (display (~a "RECEIVER3[" proc "]" "\n"))
      (proc                             ; seacond escape
       (list (proc                      ; first escape
              (list 3 n proc)))))))
(define receiver4
  (lambda (continuation)
    (set! *escape-thunk* continuation)
    (*escape-thunk* (lambda ()
                      (display "escaper is defined")
                      (newline)))))
(define exer-receiver
  (let ((n 1))
    (lambda (proc)
      (set! n (+ n 1))
      (list (proc (list 'exer n proc))))))

(define answer-maker
  (lambda (x)
    (cons 'answer-is (writeln/return x))))
(define writeln/return
  (lambda (x)
    (display x)
    (newline)
    x))
(define call
  (lambda (receiver)
    (receiver writeln/return)))

(define result "any value")
(define resultcc "any value")
(define (test-receiver n receiver)
  (display "------------------------ TEST ")
  (display (if (> n 0) n (~a (- n) " IGNORED")))
  (display " --")
  (newline)
  (cond ((> n 0)
         (display ":call\n")    (set! result (answer-maker (call receiver)))
         (display ":call/cc\n") (set! resultcc (answer-maker (call/cc receiver)))
         (display "-- result ==> ")   (display result)   (newline)
         (display "-- resultcc ==> ") (display resultcc) (newline)
         (display ":done\n\n"))
        (else (void))))

(define (filter-uniq l)
  (define (iter l)
    (cond ((null? l) '())
          ((null? (cdr l)) l)
          ((= (car l) (cadr l))
           (iter (cdr l)))
          (else (cons (car l)
                      (iter (cdr l))))))
  (iter (sort l <)))

(define *escape-thunk* "any continuation")
(define escaper
  (lambda (proc)
    (lambda (x)
      (*escape-thunk* (lambda () (proc x))))))

(define product+
  (lambda (n nums)
    (let ((receiver (lambda (exit-on-zero)
                      (letrec ((product (lambda (nums)
                                          (cond ((null? nums) 1)
                                                ((zero? (car nums)) (exit-on-zero 0))
                                                (else (* (car nums)
                                                         (product (cdr nums))))))))
                        (+ n (product nums))))))
      (call/cc receiver))))

(module+ test
  (define (d . a)
    (void (map (lambda (x)
                 (display (~a "* ==> " x "\n")))
               a)))

  (test-receiver -1 receiver1)
  (test-receiver -1 receiver1)
  (test-receiver -2 receiver2)
  (test-receiver -2 receiver2)
  (test-receiver -3 receiver3)
  (test-receiver -3 receiver3)
  #'(begin
      (display "&&& CALL\n")
      (d result
         ((third (second result))
          (list 1000)))
      (display "&&& CALL/CC\n")
      (d resultcc)
      (d ((fourth resultcc)
          (list 1000)))                   ; will escape
      (d resultcc)                       ; resultcc changed
      )
  (test-receiver -5 exer-receiver)
  (test-receiver -5 exer-receiver)
  #'(begin
      (display "&&& CALL\n")
      (d result
         ((third (second result))
          (list 1000)))
      (display "&&& CALL/CC\n")
      (d resultcc)
      (d ((fourth resultcc)
          (list 1000)))                   ; will escape
      (d resultcc))

  #'(begin
      "A"
      (let ((r (lambda (continuation)
                 (continuation 6))))
        (* (+ (call/cc r) 3) 8))
      (* 9 8)

      "B"
      (let ((r (lambda (continuation)
                 (+ 1000 (continuation 6)))))
        (* (+ (call/cc r) 3) 8))

      "C"
      (let ((r (lambda (continuation)
                 (+ 1000 6))))
        (* (+ (call/cc r) 3) 8))
      (* 1009 8)

      "D"
      (let ((r (lambda (continuation)
                 (if (zero? (random 2))
                     (+ 1000 6)
                     (continuation 6)))))
        (filter-uniq
         (map (lambda (_) (* (+ (call/cc r) 3) 8))
              (range 100))))

      "E"
      (let ((r (lambda (continuation)
                 (if (zero? (random 2))
                     (+ 1000 6)
                     (continuation 6)))))
        (filter-uniq
         (map (lambda (_) (+ (* (call/cc r) 3 8)
                             (* (call/cc r) 3 8)))
              (range 100))))

      "F"
      (let ((r (lambda (continuation)
                 (continuation
                  (if (zero? (continuation (random 2)))
                      (+ 1000 6)
                      6)))))
        (filter-uniq
         (map (lambda (_) (+ (* (call/cc r) 3 8)
                             (* (call/cc r) 3 8)))
              (range 100))))

      "-- DEEP --"
      (define deep "any continuation")
      (define map-sub1
        (lambda (ls)
          (display (~a "==>" ls "\n"))
          (if (null? ls)
              (call/cc (lambda (k)
                         (set! deep k)
                         'tail))
              (cons (- (car ls) 1)
                    (map-sub1 (cdr ls))))))

      (cons 'w (map-sub1 '()))
      (cons 'x (deep '(a b c)))
      (cons 'x (deep '()))
      (cons 'x (deep '(mmm)))
      (cons 'y (map-sub1 '(0)))
      (cons 'z (deep '(a b c)))
      (cons 't (map-sub1 '(2 1 0)))
      (cons 'u (deep '(a b c))))

  #'(begin
    ((call/cc receiver4))
    
    (+ (*escape-thunk* (lambda () (add1 61))))

    "--"
    (define k "any cont")
    (cons 'a
          (cons 'b
                (call/cc
                 (escaper
                  (lambda (proc)
                    (set! k proc)
                    (cons 'c (proc (cons 'd '()))))))))
    (k '(--))
    (k (cons "##" 'tail))

    "--"
    (cons 'a
          (cons 'b
                (call/cc
                 (escaper
                  (lambda (proc)
                    (set! k proc)
                    (cons 'c (cons 'd '())))))))

    '(k 'tail))

  #'(begin
    (define new-escaper "any continuation")
    (let ((receiver (lambda (continuation)
                      (set! new-escaper
                            (lambda (proc)
                              (lambda args
                                (continuation
                                 (lambda ()
                                   (apply proc args))))))
                      (lambda () (display "new-escaper is defined.\n")))))
      ((call/cc receiver)))
    (new-escaper new-escaper)
    (escaper escaper)

    (+ 1 (call/cc (new-escaper (lambda (proc) 1))))
    (+ 1 (call/cc (new-escaper (lambda (proc) (proc 1)))))
    "--"
    (cons 'a
          (cons 'b
                (call/cc
                 (new-escaper
                  (lambda (proc)
                    (set! k proc)
                    (cons 'c (proc (cons 'd '()))))))))
    (k '(--))
    (k (cons "##" 'tail))

    "--"
    (cons 'a
          (cons 'b
                (call/cc
                 (new-escaper
                  (lambda (proc)
                    (set! k proc)
                    (cons 'c (cons 'd '())))))))

    '(k 'tail))

  (product+ 100 '())
  (product+ 100 '(1 2 3))
  (product+ 100 '(1 2 3 0 4))
  
  'done)
