
;;; factorial

(define return
  (lambda (a)
    (lambda (k)
      (k a))))

(define >>=
  (lambda (ma seq)
    (lambda (k)
      (ma (lambda (p)
            ((seq p) k))))))

((>>= (lambda (k)
        ((>>= (lambda (k)
                ((>>= (lambda (k)
                        ((>>= (lambda (k)
                                ((>>= (lambda (k)
                                        ((return 1)
                                         k))
                                      (lambda (p)
                                        (return (* 6 p))))
                                 k ))
                              (lambda (p)
                                (return (* 5 p))))
                         k ))
                      (lambda (p)
                        (return (* 4 p))))
                 k ))
              (lambda (p)
                (return (* 3 p))))
         k ))
      (lambda (p)
        (return (* 2 p))))
 (lambda (x)
   (display x) ; => 720
   (newline)))



((>>= (>>= (>>= (>>= (>>= (return 1)
                          (lambda (p)
                            (return (* 6 p))))
                     (lambda (p)
                       (return (* 5 p))))
                (lambda (p)
                  (return (* 4 p))))
           (lambda (p)
             (return (* 3 p))))
      (lambda (p)
        (return (* 2 p))))
 (lambda (x)
   (display x)                         ; => 720
   (newline)))


