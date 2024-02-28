;;; -*- buffer-read-only:t -*-

;; (load "19.scm")

;;; HELPERS
(define (m MSG expr)
  (define DEBUG 0)
  (or (zero? DEBUG)
      (begin (display " ")
             (display "**") (display MSG) (display "**")
             (display "[") (display expr) (display "]")
             (display ";"))))
(define (add1 x)
  (+ x 1))
(define (sub1 x)
  (- x 1))
(define (times x y)
  (* x y))
(define (atom? x)
  (and
   (not (pair? x))
   (not (null? x))))

;;; EVALUATOR
(define lookup
  (lambda (table name)
    (table name)))

(define extend
  (lambda (name1 value table)
    (lambda (name2)
      (cond ((eq? name1 name2) value)
            (else (table name2))))))

(define define?
  (lambda (e)
    (cond ((atom? e) false)
          ((atom? (car e)) (eq? (car e) 'define))
          (else false))))

(define *define
  (lambda (e)
    (newline)
    (begin
      (display "DEFINE")
      (display "...")
      (display (name-of e))
      (display "...")
      (display (right-side-of e)))
    (newline)
    (set! global-table
          (extend (name-of e)
                  (box (the-meaning (right-side-of e)))
                  global-table))))

(define box
  (lambda (it)
    (lambda (sel)
      (sel it (lambda (new)
                (set! it new))))))

(define setbox
  (lambda (box new)
    (box (lambda (it set)
           (set new)))))

(define unbox
  (lambda (box)
    (box (lambda (it set) it))))

(define the-meaning
  (lambda (e)
    (m "THE-MEANING" e)
    (meaning e lookup-in-global-table)))

(define lookup-in-global-table
  (lambda (name)
    (lookup global-table name)))

(define meaning
  (lambda (e table)
    (m "MEANING" e)
    ((expression-to-action e)
     e table)))

(define *quote
  (lambda (e table)
    (m "QUOTE" e)
    (text-of e)))

(define *identifier
  (lambda (e table)
    (unbox (lookup table e))))

(define *set
  (lambda (e table)
    (setbox (lookup table (name-of e))
            (meaning (right-of e) table))))

(define *lambda
  (lambda (e table)
    (lambda (args)
      (beglis (body-of e)
              (multi-extend (formals-of e)
                            (box-all args)
                            table)))))

(define beglis
  (lambda (es table)
    (cond ((null? (cdr es)) (meaning (car es) table))
          (else ((lambda (val) (beglis (cdr es) table))
                 (meaning (car es) table))))))

(define box-all
  (lambda (vals)
    (cond ((null? vals) '())
          (else (cons (box (car vals))
                      (box-all (cdr vals)))))))

(define multi-extend
  (lambda (names values table)
    (cond ((null? names) table)
          (else (extend (car names) (car values)
                        (multi-extend (cdr names) (cdr values)
                                      table))))))

(define *application
  (lambda (e table)
    (m "APPLICATION" e)
    ((meaning (function-of e) table)
     (evlist (arguments-of e) table))))

(define evlist
  (lambda (args table)
    (cond ((null? args) '())
          (else ((lambda (val) (cons val
                                     (evlist (cdr args) table)))
                 (meaning (car args) table))))))

(define :car
  (lambda (args-in-a-list)
    (car (car args-in-a-list))))

(define primitive1
  (lambda (p)
    (lambda (args-in-a-list)
      (m "PRIMITIVE1" args-in-a-list)
      (p (car args-in-a-list)))))

(define primitive2
  (lambda (p)
    (lambda (args-in-a-list)
      (p (car args-in-a-list)
         (car (cdr args-in-a-list))))))

(define *const
  (let ((:cons (primitive2 cons))
        (:car (primitive1 car))
        (:cdr (primitive1 cdr))
        (:null? (primitive1 null?))
        (:eq? (primitive2 eq?))
        (:atom? (primitive1 atom?))
        (:number? (primitive1 number?))
        (:zero? (primitive1 zero?))
        (:add1 (primitive1 add1))
        (:sub1 (primitive1 sub1))
        (:times (primitive2 times)))
    (lambda (e table)
      (m "CONST" e)
     (cond ((number? e)      e)
           ((eq? e true)     true)
           ((eq? e false)    false)
           ((eq? e 'true)     true)
           ((eq? e 'false)    false)
           ((eq? e 'cons)    :cons)
           ((eq? e 'car)     :car)
           ((eq? e 'cdr)     :cdr)
           ((eq? e 'null?)   :null?)
           ((eq? e 'eq?)     :eq?)
           ((eq? e 'atom?)   :atom?)
           ((eq? e 'zero?)   :zero?)
           ((eq? e 'add1)    :add1)
           ((eq? e 'sub1)    :sub1)
           ((eq? e 'times)   :times)
           ((eq? e 'number?) :number?)))))

(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e)
           table)))

(define evcon
  (lambda (lines table)
    (cond ((else? (question-of (car lines)))
           (meaning (answer-of (car lines)) table))
          ((meaning (question-of (car lines)) table)
           (meaning (answer-of (car lines)) table))
          (else (evcon (cdr lines) table)))))

(define *letcc
  (lambda (e table)
    (call-with-current-continuation
     (lambda (skip)
       (beglis (ccbody-of e)
               (extend (name-of e)
                       (box (primitive1 skip))
                       table))))))

(define abort)

(define value
  (lambda (e)
    (call-with-current-continuation
     (lambda (the-end)
       (set! abort the-end)
       (newline)
       (display "COMPUTE VALUE OF ==> ")
       (display e)
       (cond ((define? e) (*define e))
             (else (the-meaning e)))))))

(define the-empty-table
  (lambda (name)
    (abort (cons 'no-answer
                 (cons name '())))))

(define global-table the-empty-table)

(define expression-to-action
  (lambda (e)
    (m "EXPRESSION->ACTION" e)
    (cond ((atom? e) (atom-to-action e))
          (else (list-to-action e)))))

(define atom-to-action
  (lambda (e)
    (m "ATOM->ACTION" e)
    (cond ((number? e) *const)
          ((eq? e true) *const)
          ((eq? e false) *const)
          ((eq? e 'true) *const)
          ((eq? e 'false) *const)
          ((eq? e 'cons) *const)
          ((eq? e 'car) *const)
          ((eq? e 'cdr) *const)
          ((eq? e 'null?) *const)
          ((eq? e 'eq?) *const)
          ((eq? e 'atom?) *const)
          ((eq? e 'zero?) *const)
          ((eq? e 'times) *const)
          ((eq? e 'add1) *const)
          ((eq? e 'sub1) *const)
          ((eq? e 'number?) *const)
          (else *identifier))))

(define list-to-action
  (lambda (e)
    (m "LIST->ACTION" e)
    (cond ((atom? (car e))
           (cond ((eq? (car e) 'quote) *quote)
                 ((eq? (car e) 'lambda) *lambda)
                 ((eq? (car e) 'letcc) *letcc)
                 ((eq? (car e) 'cond) *cond)
                 (else *application)))
          (else *application))))

(define right-side-of
  (lambda (x)
    (cond ((null? (cdr (cdr x))) 0)
          (else (car (cdr (cdr x)))))))

(define text-of
  (lambda (x)
    (car (cdr x))))

(define formals-of
  (lambda (x)
    (car (cdr x))))

(define body-of
  (lambda (x)
    (cdr (cdr x))))

(define ccbody-of
  (lambda (x)
    (cdr (cdr x))))

(define name-of
  (lambda (x)
    (car (cdr x))))

(define right-side-of
  (lambda (x)
    (cond ((null? (cdr (cdr x))) 0)
          (else (car (cdr (cdr x)))))))

(define cond-lines-of
  (lambda (x)
    (cdr x)))

(define else?
  (lambda (x)
    (cond ((atom? x) (eq? x 'else))
          (else false))))

(define question-of
  (lambda (x)
    (car x)))

(define answer-of
  (lambda (x)
    (car (cdr x))))

(define function-of
  (lambda (x)
    (m "FUNCTION OF" x)
    (car x)))

(define arguments-of
  (lambda (x)
    (m "ARGUMENTS OF" x)
    (cdr x)))

"** tests ** $~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$~$"

(value 1)
(value '(define x 11))
(value 'x)

(value '(define odd?
          (lambda (n)
            (cond ((zero? n) false)
                  (else (even? (sub1 n)))))))

(value '(define even?
          (lambda (n)
            (cond ((zero? n) true)
                  (else (odd? (sub1 n)))))))

(map value '((odd? 0) (odd? 1) (even? 0) (even? 1)))

(value '(define 0? zero?))

(map value '((zero? 20) (zero? 0) (0? 1) (0? 0)))

(value 'variable-not-found)

(value ''ok)

(value '(define 1+ (lambda (n) (add1 n))))

(value '(add1 11))

(value '(1+ 11))

(value '(define factorial
          (lambda (n)
            (cond ((zero? n) 1)
                  (else (times n (factorial (sub1 n))))))))

(value '(factorial 3))

(value '(factorial 20))

'ok


