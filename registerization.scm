
;; Registerizing and Trampolining Scheme Procedures
;; Adam C. Foltzer

(define (__d . args)
  "generic display"
  (define (iter a co)
    (if (null? a)
        (co (lambda () (newline)))
        (iter (cdr a)
              (lambda (x)
                (co (lambda ()
                      (display " ")
                      (display (car a))
                      (x)))))))
  (iter args (lambda (x) (x))))

(define record1
  (lambda (exp return)
    (return (car exp))))

(define record2
  (lambda (exp return)
    (return (car exp) (cadr exp))))

(define record3
  (lambda (exp return)
    (return (car exp) (cadr exp) (caddr exp))))

(define fib
  (lambda (n k)
    (cond
     ((zero? n) (k 0))
     ((= n 1) (k 1))
     (else (fib (- n 1)
                (lambda (1-ago)
                  (fib (- n 2)
                       (lambda (2-ago)
                         (k (+ 1-ago 2-ago))))))))))

(__d (fib 10 (lambda (x) x)))
;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define apply-k
  (lambda (k v)
    (case (car k)
      ((empty-k) v)
      ((big-k)
       (record3 k (lambda (_ n k)
                    (fib (- n 2)
                         (little-k v k)))))
      ((little-k)
       (record3 k (lambda (_ w k)
                    (apply-k k (+ w v))))))))
(define empty-k
  (lambda ()
    '(empty-k)))
(define big-k
  (lambda (n k)
    `(big-k ,n ,k)))
(define little-k
  (lambda (w k)
    `(little-k ,w ,k)))
(define fib
  (lambda (n k)
    (cond
     ((zero? n) (apply-k k 0))
     ((= n 1) (apply-k k 1))
     (else (fib (- n 1) (big-k n k))))))

(__d (fib 10 (empty-k)))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  REGISTERIZED

(define n*)
(define k*)
(define v*)

(define apply-k
  (lambda ()
    (case (car k*)
      ((empty-k) v*)
      ((big-k)
       (record3 k* (lambda (_ n k)
                     (set! k* (little-k v* k))
                     (set! n* (- n 2))
                     (fib))))
      ((little-k)
       (record3 k* (lambda (_ w k)
                     (set! k* k)
                     (set! v* (+ w v*))
                     (apply-k)))))))
(define fib
  (lambda ()
    (cond
     ((zero? n*)
      (set! v* 0)
      (apply-k))
     ((= n* 1)
      (set! v* 1)
      (apply-k))
     (else
      (set! k* (big-k n* k*))
      (set! n* (- n* 1))
      (fib)))))
(define fib-driver
  (lambda (n)
    (begin
      (set! n* n)
      (set! k* (empty-k))
      (fib))))

(__d (fib-driver 10))
;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TRAMPOLINED

(define pc*)
(define done*)

(define apply-k
  (lambda ()
    (case (car k*)
      ((empty-k) (set! done* true))
      ((big-k)
       (record3 k* (lambda (_ n k)
                     (set! k* (little-k v* k))
                     (set! n* (- n 2))
                     (set! pc* fib))))
      ((little-k)
       (record3 k* (lambda (_ w k)
                     (set! k* k)
                     (set! v* (+ w v*))
                     (set! pc* apply-k)))))))
(define fib
  (lambda ()
    (cond
     ((zero? n*)
      (set! v* 0)
      (set! pc* apply-k))
     ((= n* 1)
      (set! v* 1)
      (set! pc* apply-k))
     (else
      (set! k* (big-k n* k*))
      (set! n* (- n* 1))
      (set! pc* fib)))))
(define trampoline
  (lambda ()
    (if done*
        v*
        (begin (pc*)
               (trampoline)))))
(define fib-driver
  (lambda (n)
    (begin
      (set! n* n)
      (set! k* (empty-k))
      (set! done* false)
      (set! pc* fib)
      (trampoline))))

(__d (fib-driver 10))


;; Our program is now structured such that they can be adapted to
;; ParentheC/PC , and then finally to C

