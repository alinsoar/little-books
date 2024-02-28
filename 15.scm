;;; -*- buffer-read-only:t -*-

(load "14.scm")

(define x
  (cons
   'chicago
   (cons
    'pizza
    '())))

;;; (set! x 'gone)

;;; (set! x 'skins)

(define gourmet
  (lambda (food)
    (cons food
	  (cons x '()))))

;;; (set! x 'rings)

(define gourmand
  (lambda (food)
    (set! x food)
    (cons food
	  (cons x '()))))

;;; (gourmand 'potato)

(define dinner
  (lambda (food)
    (cons 'milkshake
	  (cons 'food '()))))

(define dinnerR
  (lambda (food)
    (set! x food)
    (cons 'milkshake
	  (cons food '()))))

;;; (dinnerR 'pecanpie)

;;; (gourmand 'onion)

;;; x

(define omnivore
  (let ((x 'minestrone))
    (lambda (food)
      (set! x food)
      (cons food
	    (cons x '())))))

(define x 'minestrone)

(define omnivore
  (lambda (food)
    (set! x food)
    (cons food
	  (cons x
		'()))))

;;; (omnivore 'bouillabaisse)

;;; x

(define gobbler
  (let ((x 'minestrone))
    (lambda (food)
      (set! x food)
      (cons food
	    (cons x '())))))

(define x2 'minestrone)

(define gobbler
  (lambda (food)
    (set! x2 food)
    (cons food
	  (cons x2
		'()))))

;;; (gobbler 'gumbo)

;;; x2

(define nibbler
  (lambda (food)
    (let ((x 'donut))
      (set! x food)
      (cons food
	    (cons x
		  '())))))

;;; (nibbler 'cheerio)

(define food 'none)

(define glutton
  (lambda (x)
    (set! food x)
    (cons 'mode
	  (cons x
		(cons 'more
		      (cons x
			    '()))))))

;;; (glutton 'garlic)

(define chez-nous
  (lambda ()
    (set! food x)
    (set! x food)))

(define chez-nous
  (lambda ()
    (let ((a food))
      (set! food x)
      (set! x a))))


