;;; -*- buffer-read-only:t -*-

(define true #t)
(define false #f)

(define (atom? x)
  (and
   (not (pair? x))
   (not (null? x))))
