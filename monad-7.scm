
;;; remove odd elements and returns a list ((pos1 . even-1) (pos2 . even-2))

(define unit
  (lambda (v)
    (lambda (pos rem-odd)
      (lambda (col)
        (col pos rem-odd v)))))

(define >>=
  (lambda (ma sequel)
    (lambda (n o)
      ((ma n o)
       (lambda (n o v)
         ((sequel v)
          n o))))))

(define rem
  (lambda (l)
    (cond ((null? l)
           (unit '()))
          ((odd? (car l))
           (>>= (lambda (pos rem-odd)
                  (lambda (col)
                    (col (+ pos 1)
                         (+ rem-odd 1)
                         '_)))
                (lambda (_)
                  (>>= (rem (cdr l))
                       (lambda (d)
                         (unit d))))))
          (else
           (>>= (lambda (pos rem-odd)
                  (lambda (col)
                    (col (+ pos 1)
                         rem-odd
                         (cons pos (car l)))))
                (lambda (a)
                  (>>= (rem (cdr l))
                       (lambda (d)
                         (unit (cons a d))))))))))

(((rem '()) 0 0)
 (lambda (n m v)
   (display "\n::")
   (display (list n m v))
   (newline)))

(((rem '(1 3 5 7)) 1 0)
 (lambda (n m v)
   (display (list n m v))))

(((rem '(1 2 3 4 5 7 8 9 0)) 1 0)
 (lambda (n m v)
   (newline)
   (display (list n m v))))

