
(load "reasoned-mk.scm")

(define bit-xoro
  (lambda (x y r)
    (conde ((== 0 x) (== 0 y) (== 0 r))
           ((== 1 x) (== 0 y) (== 1 r))
           ((== 0 x) (== 1 y) (== 1 r))
           ((== 1 x) (== 1 y) (== 0 r)))))

(D
 (run* (s)
       (fresh (x y)
              (bit-xoro x y 0)
              (== s (cons x y)))))

(D
 (run* (s)
       (fresh (x y)
              (bit-xoro x y 1)
              (== s (cons x y)))))

(D
 (run* (s)
       (fresh (x y r)
              (bit-xoro x y r)
              (== (list x y r) s))))

(define bit-nando
  (lambda (x y r)
    (conde ((== 0 x) (== 0 y) (== 1 r))
           ((== 1 x) (== 0 y) (== 1 r))
           ((== 0 x) (== 1 y) (== 1 r))
           ((== 1 x) (== 1 y) (== 0 r)))))

(define bit-xoro
  (lambda (x y r)
    (fresh (s t u)
           (bit-nando x y s)
           (bit-nando x s t)
           (bit-nando s y u)
           (bit-nando t u r))))

(D
 (run* (s)
       (fresh (x y)
              (bit-xoro x y 0)
              (== s (cons x y)))))

(D
 (run* (s)
       (fresh (x y)
              (bit-xoro x y 1)
              (== s (cons x y)))))

(D
 (run* (s)
       (fresh (x y r)
              (bit-xoro x y r)
              (== (list x y r) s))))

(define bit-ando
  (lambda (x y r)
    (conde ((== 0 x) (== 0 y) (== 0 r))
           ((== 1 x) (== 0 y) (== 0 r))
           ((== 0 x) (== 1 y) (== 0 r))
           ((== 1 x) (== 1 y) (== 1 r)))))

(D
 (run* (q)
       (fresh (x y u)
              (bit-ando x y u)
              (== q (list x y u)))))

(run* (q)
      (fresh (x y)
             (bit-ando x y 1)
             (== q (list x y))))

(define bit-noto
  (lambda (x r)
    (bit-nando x x r)))

(define bit-ando
  (lambda (x y r)
    (fresh (u)
           (bit-nando x y u)
           (bit-noto u r))))

(run* (q)
      (fresh (x y)
             (bit-ando x y 1)
             (== q (list x y))))

(define half-addero
  (lambda (x y r c)
    (conde ((== 0 x) (== 0 y) (== 0 r) (== 0 c))
           ((== 1 x) (== 0 y) (== 1 r) (== 0 c))
           ((== 0 x) (== 1 y) (== 1 r) (== 0 c))
           ((== 1 x) (== 1 y) (== 0 r) (== 1 c)))))

(D
 (run* (q)
       (fresh (x y r c)
              (half-addero x y r c)
              (== q (list x y r c)))))

(define half-addero
  (lambda (x y r c)
    (all (bit-xoro x y r)
         (bit-ando x y c))))

(D
 (run* (q)
       (fresh (x y r c)
              (half-addero x y r c)
              (== q (list x y r c)))))

(define full-addero
  (lambda (b x y r c)
    (fresh (w xy wz)
           (half-addero x y w xy)
           (half-addero w b r wz)
           (bit-xoro xy wz c))))

(run* (s)
      (fresh (r c)
             (full-addero 0 1 1 r c)
             (== (list r c) s)))

(D
 (run* (s)
       (fresh (b x y r c)
              (full-addero b x y r c)
              (== (list b x y r c) s))))

(define full-addero
  (lambda (b x y r c)
    (conde ((== 0 b) (== 0 x) (== 0 y) (== 0 r) (== 0 c))
           ((== 1 b) (== 0 x) (== 0 y) (== 1 r) (== 0 c))
           ((== 0 b) (== 1 x) (== 0 y) (== 1 r) (== 0 c))
           ((== 1 b) (== 1 x) (== 0 y) (== 0 r) (== 1 c))
           ((== 0 b) (== 0 x) (== 1 y) (== 1 r) (== 0 c))
           ((== 1 b) (== 0 x) (== 1 y) (== 0 r) (== 1 c))
           ((== 0 b) (== 1 x) (== 1 y) (== 0 r) (== 1 c))
           ((== 1 b) (== 1 x) (== 1 y) (== 1 r) (== 1 c)))))

(run* (s)
      (fresh (r c)
             (full-addero 0 1 1 r c)
             (== (list r c) s)))

(D
 (run* (s)
       (fresh (b x y r c)
              (full-addero b x y r c)
              (== (list b x y r c) s))))

(D
 (run* (s)
       (fresh (r c)
              (full-addero 1 1 1 r c)
              (== (list r c) s))))

(build-num 0)

(build-num 10)

(build-num 4)

(build-num 5)

(define build-num
  (lambda (n)
    (cond ((zero? n) '())
          (else
           (let ((k (if (zero? (remainder n 2))
                        0
                        1)))
             (cons k (build-num (/ (- n k) 2))))))))

(build-num 5)

(build-num 10)

(build-num 19)

(build-num 36)

(define poso
  (lambda (n)
    (fresh (a d)
           (== (cons a d) n))))

(run* (q)
      (poso '(0 1 1))
      (== #t q))

(run* (q)
      (poso '(1))
      (== #t q))

(run* (q)
      (poso '(1 1))
      (== #t q))

(run* (q)
      (poso '())
      (== #t q))

(run* (r)
      (poso r))

(define >1o
  (lambda (n)
    (fresh (a ad dd)
           (== (cons a (cons ad dd))
               n))))

(run* (q)
      (>1o '(0 1 1))
      (== #t q))

(run* (q)
      (>1o '(0 1))
      (== #t q))

(run* (q)
      (>1o '(1))
      (== #t q))

(run* (q)
      (>1o '())
      (== #t q))

(run* (q)
      (>1o q))

(D
 (run3 (s)
       (fresh (x y r)
              (addero 0 x y r)
              (== (list x y r) s))))

(D
 (run3 (s)
       (fresh (x y r)
              (addero 0 x y r)
              (== (list x y r) s))))

(D
 (run22 (s)
        (fresh (x y r)
               (addero 0 x y r)
               (== (list x y r) s))))

(define width
  (lambda (n)
    (cond ((null? n) 0)
          ((pair? n) (+ 1 (width (cdr n))))
          (else 1))))

(define gen-addero
  (lambda (d n m r)
    (fresh (a b c e x y z)
      (== `(,a . ,x) n)
      (== `(,b . ,y) m) (poso y)
      (== `(,c . ,z) r) (poso z)
      (alli
        (full-addero d a b c e)
        (addero e x y z)))))

(define addero
  (lambda (d n m r)
    (condi
     ((== 0 d) (== '() m) (== n r))
     ((== 0 d) (== '() n) (== m r) (poso m))
     ((== 1 d) (== '() m) (addero 0 n '(1) r))
     ((== 1 d) (== '() n) (poso m) (addero 0 '(1) m r))
     ((== '(1) n) (== '(1) m) (fresh (a c)
                                     (== `(,a ,c) r)
                                     (full-addero d 1 1 a c)))
     ((== '(1) n) (gen-addero d n m r))
     ((== '(1) m) (>1o n) (>1o r) (addero d '(1) n r))
     ((>1o n) (gen-addero d n m r))
     (else fail))))

(D
 (run22 (s)
        (fresh (x y r)
               (addero 0 x y r)
               (== (list x y r) s))))

(run* (s)
      (gen-addero 1 '(0 1 1) '(1 1) s))

(D
 (run* (s)
       (fresh (x y)
              (gen-addero 0 x y '(1 0 1))
              (== s (list x y)))))

(define +o
  (lambda (n m k)
    (addero 0 n m k)))

(D
 (run* (s)
       (fresh (x y)
              (+o x y '(1 0 1))
              (== s (list x y)))))

(define -o
  (lambda (n m k)
    (addero 0 k m n)))

(D
 (run* (s)
       (-o '(0 0 0 1) '(1 0 1) s)))

(D
 (run* (s)
       (-o '(0 1 1) '(0 1 1) s)))

(D
 (run* (s)
       (-o '(0 1 1) '(0 0 0 1) s)))



'DONE


