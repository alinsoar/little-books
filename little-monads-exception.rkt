#lang racket

;;; Make experiments using
;;; 
;;; A Schemer’s View of Monads
;;; Daniel P. Friedman  &  Adam C. Foltzer
;;; 2010, 2011

(define p
  (lambda a
    (map (lambda (x)
           (display (~a x ":")))
         a)
    (newline)))

;;; EXCEPTION MONAD

(define unit
  (lambda (a)
    (cons a '_)))

(define star
  (lambda (sequel)
    (lambda (ma)
      (if (eq? (cdr ma) '_)         ; <= This is a monad. It's a pair.
          (let* ((a (car ma)))
            (sequel a))
          (cdr ma)))))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define parse-hex
  (lambda (a* pos n)
    (if (null? a*)
        (unit n)
        ((star (lambda (a)
                 (parse-hex (cdr a*)
                            (add1 pos)
                            (+ a (* n 16)))))
         (char-hex->integer (car a*) pos)))))

(define char-hex?
  (lambda (c)
    (or (char-numeric? c)
        (char<=? #\a c #\f))))

(define char-hex->integer/safe
  (lambda (c)
    (- (char->integer c)
       (if (char-numeric? c)
           (char->integer #\0)
           (- (char->integer #\a)
              10)))))

(define char-hex->integer
  (lambda (c pos)
    (if (char-hex? c)
        (unit (char-hex->integer/safe c))
        (cons '_ (~a "At index " pos ": bad char " c ".")))))

(module+ test
  (parse-hex (string->list "ab") 0 0)
  (parse-hex (string->list "abx5") 0 0))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define-syntax def/pure/extra
  (syntax-rules ()
    ((def/pure/extra (a b) pair)
     (define-values (a b) (values (car pair) (cdr pair))))))

(define unit2
  (lambda (a)
    (lambda ()                        ; <= This is a monad-A. It's a thunk.
      (cons a '_))))

(define star2
  (lambda (sequel)
    (lambda (ma)
      (lambda ()                      ; <= This is a monad-A. It's a thunk.
        (let ((pair (ma)))
          (def/pure/extra (pure extra) pair)
          (if (eq? extra '_)
              ((sequel pure))
              extra))))))

;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(define parse-hex2
  (lambda (a* pos n)
    (if (null? a*)
        (unit2 n)
        ((star2 (lambda (a) (parse-hex2 (cdr a*)
                                   (add1 pos)
                                   (+ a (* n 16)))))
         (char-hex->integer2 (car a*) pos)))))

(define char-hex->integer2
  (lambda (c pos)
    (if (char-hex? c)
        (unit2 (char-hex->integer/safe c))
        (lambda ()
          (cons '_ (~a "At index " pos ": bad char `" c "`."))))))

((parse-hex2 (string->list "ab") 0 0))
((parse-hex2 (string->list "5") 0 0))
((parse-hex2 (string->list "abx5") 0 0))
((parse-hex2 (string->list "") 0 0))

