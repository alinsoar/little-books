#lang racket



(define remove
  (lambda (l what ret)
    (lambda (count)
      (if (null? l)
          (ret 0)))))



((remove '(1 2 8 3 4 (5 7 9 0 (8) 8) 8 8) 8)
 8)
