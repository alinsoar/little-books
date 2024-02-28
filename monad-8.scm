
(define test
  (lambda (l k)
    (if (null? l)
        (k 0 '())
        (test (cdr l)
              (lambda (n rest)
                (k (+ n 1)
                   (cons (cons n (car l)) rest)))))))

'(test '(1 2 3 4)
      (lambda (_ a)
        (display a)
        (newline)))

;; (define unit
;;   (lambda (a b)
;;     (lambda (k)
;;       (k a b))))

;; (define bind
;;   (lambda (m seq)
;;     (lambda (k)
;;       (m (lambda (a b)
;;            ((seq a) k))))))

;; (define test/c
;;   (lambda (l)
;;     (if (null? l)
;;         (unit '(0 . ()))
;;         (bind (lambda (k)
;;                 (k (lambda (a b)
;;                      (lambda ()))))
;;               ;; (test/c (cdr l))
;;               (lambda (d)
;;                 )))))

;; (test/c '(1 2 3 4)
;;         (lambda (_ a)
;;           (display a)
;;           (newline)))
;; define return

(define return
  (lambda (p)
    (lambda (k)
      (k p))))

;; (define (fact-cps/return n)
;;   (if (zero? n)
;;       (return 1)
;;       (lambda (k)
;;         ((fact-cps/return (- n 1))
;;          (lambda (v) (k (* v n)))))))

(define bind
  (lambda (m seq)
    (lambda (k)
      (m (lambda (p)
           ((seq p) k))))))

;; (define (fact-cps/bind n)
;;   (if (zero? n)
;;       (return 1 0)
;;       (bind (fact-cps/bind (- n 1))
;;             (lambda (p s)
;;               (return (* p n) (+ s n))))))
;; ((fact-cps/bind 5)
;;  (lambda (p s)
;;    (display (cons p s))
;;    (newline)))

(define product
  (lambda (l stop)
    (if (null? l)
        (return 1)
        (bind (lambda (k)
                (if (zero? (car l))
                    (stop)
                    ((product (cdr l) stop) k)))
              (lambda (p)
                (return (* p (car l))))))))



'(display
 ((product '(1 2 3 4)
           (lambda () 'zero))
  (lambda (v)
    v)))

(display
 ((product '(1 2 3 0 4)
           (lambda () 'zero))
  (lambda (v)
    v)))
