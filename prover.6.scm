
(load "prover-load-j-bob.scm")


(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               ((A 1 1) (remb xs))
               ((A 1 1)
                (if-nest-A (atom xs)
                           '()
                           (if (equal (car xs) '?) (remb (cdr xs)) (cons (car xs) (remb (cdr xs))))))
               ((A 1) (memb? '()))
               ((A 1 Q) (atom '()))
               ((A 1) (if-true 'nil (if (equal (car '()) '?) 't  (memb? (cdr '())))))
               ((A) (equal-same 'nil))
               ((E A 1 1) (remb xs))
               ((E A 1 1)
                (if-nest-E (atom xs)
                           '()
                           (if (equal (car xs) '?) (remb (cdr xs)) (cons (car xs) (remb (cdr xs))))))
               ((E A 1)
                (if-same (equal (car xs) '?)
                         (memb?
                          (if (equal (car xs) '?) (remb (cdr xs)) (cons (car xs) (remb (cdr xs)))))))
               ((E A 1 A 1)
                (if-nest-A (equal (car xs) '?) (remb (cdr xs)) (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1)
                (if-nest-E (equal (car xs) '?) (remb (cdr xs)) (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))
               ((E A 1 E) (memb? (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E Q) (atom/cons (car xs) (remb (cdr xs))))
               ((E A 1 E)
                (if-false 'nil
                          (if (equal (car (cons (car xs) (remb (cdr xs)))) '?)
                              't
                              (memb? (cdr (cons (car xs) (remb (cdr xs))))))))
               ((E A 1 E Q 1) (car/cons (car xs) (remb (cdr xs))))
               ((E A 1 E E 1) (cdr/cons (car xs) (remb (cdr xs))))
               ((E A 1 E) (if-nest-E (equal (car xs) '?) 't (memb? (remb (cdr xs)))))
               ((E A 1 E) (equal-if (memb? (remb (cdr xs))) 'nil))
               ((E A 1) (if-same (equal (car xs) '?) 'nil))
               ((E A) (equal-same 'nil))
               ((E) (if-same (equal (memb? (remb (cdr xs))) 'nil) 't))
               (() (if-same (atom xs) 't))
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs))))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs)))))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))))))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))
               
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E) (memb?
                           (cons
                            (car xs)
                            (if (atom (cdr xs))
                                '()
                                (if (equal (car (cdr xs)) '?)
                                    (remb (cdr (cdr xs)))
                                    (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))
               
                              
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))
               
                              
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))
               
                              
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))
                              
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
               
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
               
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))
               
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1 A) (remb (cdr (cdr xs))))

               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))
               

               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ;;
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                                                      (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))


               ))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ;;
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))


               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ((E Q 1 A) (if-true 'nil
                                   (if (equal (car '()) '?)
                                       't
                                       (memb? (cdr '())))))

               ((E Q 1 E) (if-same (equal (car (cdr xs)) '?)
                                   (memb?
                                    (if (equal (car (cdr xs)) '?)
                                        (remb (cdr (cdr xs)))
                                        (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ;; 
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))


               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ((E Q 1 A) (if-true 'nil
                                   (if (equal (car '()) '?)
                                       't
                                       (memb? (cdr '())))))

               ((E Q 1 E) (if-same (equal (car (cdr xs)) '?)
                                   (memb?
                                    (if (equal (car (cdr xs)) '?)
                                        (remb (cdr (cdr xs)))
                                        (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E Q 1 E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ;;
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))


               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ((E Q 1 A) (if-true 'nil
                                   (if (equal (car '()) '?)
                                       't
                                       (memb? (cdr '())))))

               ((E Q 1 E) (if-same (equal (car (cdr xs)) '?)
                                   (memb?
                                    (if (equal (car (cdr xs)) '?)
                                        (remb (cdr (cdr xs)))
                                        (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E Q 1 E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E Q 1 E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               

               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ((E Q 1 A) (if-true 'nil
                                   (if (equal (car '()) '?)
                                       't
                                       (memb? (cdr '())))))

               ((E Q 1 E) (if-same (equal (car (cdr xs)) '?)
                                   (memb?
                                    (if (equal (car (cdr xs)) '?)
                                        (remb (cdr (cdr xs)))
                                        (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E Q 1 E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E Q 1 E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E) (equal-if (if (atom (cdr xs))
                                        'nil
                                        (if (equal (car (cdr xs)) '?)
                                            (memb? (remb (cdr (cdr xs))))
                                            (memb? (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                    'nil))
               

               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ((E Q 1 A) (if-true 'nil
                                   (if (equal (car '()) '?)
                                       't
                                       (memb? (cdr '())))))

               ((E Q 1 E) (if-same (equal (car (cdr xs)) '?)
                                   (memb?
                                    (if (equal (car (cdr xs)) '?)
                                        (remb (cdr (cdr xs)))
                                        (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E Q 1 E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E Q 1 E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E) (equal-if (if (atom (cdr xs))
                                        'nil
                                        (if (equal (car (cdr xs)) '?)
                                            (memb? (remb (cdr (cdr xs))))
                                            (memb? (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                    'nil))

               ((E A 1) (if-same (equal (car xs) '?) 'nil))

               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ((E Q 1 A) (if-true 'nil
                                   (if (equal (car '()) '?)
                                       't
                                       (memb? (cdr '())))))

               ((E Q 1 E) (if-same (equal (car (cdr xs)) '?)
                                   (memb?
                                    (if (equal (car (cdr xs)) '?)
                                        (remb (cdr (cdr xs)))
                                        (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E Q 1 E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E Q 1 E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E) (equal-if (if (atom (cdr xs))
                                        'nil
                                        (if (equal (car (cdr xs)) '?)
                                            (memb? (remb (cdr (cdr xs))))
                                            (memb? (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                    'nil))

               ((E A 1) (if-same (equal (car xs) '?) 'nil))

               ((E A) (equal 'nil 'nil))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ((E Q 1 A) (if-true 'nil
                                   (if (equal (car '()) '?)
                                       't
                                       (memb? (cdr '())))))

               ((E Q 1 E) (if-same (equal (car (cdr xs)) '?)
                                   (memb?
                                    (if (equal (car (cdr xs)) '?)
                                        (remb (cdr (cdr xs)))
                                        (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E Q 1 E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E Q 1 E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E) (equal-if (if (atom (cdr xs))
                                        'nil
                                        (if (equal (car (cdr xs)) '?)
                                            (memb? (remb (cdr (cdr xs))))
                                            (memb? (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                    'nil))

               ((E A 1) (if-same (equal (car xs) '?) 'nil))

               ((E A) (equal 'nil 'nil))

               ((E) (if-same (equal
                              (if (atom (cdr xs))
                                  'nil
                                  (if (equal (car (cdr xs)) '?)
                                      (memb? (remb (cdr (cdr xs))))
                                      (memb? (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                              'nil)
                             't))
               
               )))

(jbob.prove (dethm.memb?/remb2)
            '(((dethm memb?/remb (xs)
                      (equal (memb? (remb xs)) 'nil))
               (list-induction xs)
               
               ((A 1 1) (remb xs))

               ((A 1 1) (if-nest-A (atom xs)
                                   '()
                                   (if (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs))))))

               ((E A 1 1) (remb xs))

               ((E A 1 1) (if-nest-E (atom xs)
                                     '()
                                     (if (equal (car xs) '?)
                                         (remb (cdr xs))
                                         (cons (car xs) (remb (cdr xs))))))

               ((E A 1) (if-same (equal (car xs) '?)
                                 (memb?
                                  (if (equal (car xs) '?)
                                      (remb (cdr xs))
                                      (cons (car xs) (remb (cdr xs)))))))

               ((E A 1 A 1) (if-nest-A (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 E 1) (if-nest-E (equal (car xs) '?)
                                       (remb (cdr xs))
                                       (cons (car xs) (remb (cdr xs)))))
               ((E A 1 A) (equal-if (memb? (remb (cdr xs))) 'nil))

               ((E A 1 E 1 2) (remb (cdr xs)))

               ((E Q 1 1) (remb (cdr xs)))

               ((E Q 1) (if-same (atom (cdr xs))
                                 (memb?
                                  (if (atom (cdr xs))
                                      '()
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))))

               ((E Q 1 A 1) (if-nest-A (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 E 1) (if-nest-E (atom (cdr xs))
                                       '()
                                       (if (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E Q 1 A ) (memb? '()))

               ((E Q 1 A Q) (atom '()))

               ((E Q 1 A) (if-true 'nil
                                   (if (equal (car '()) '?)
                                       't
                                       (memb? (cdr '())))))

               ((E Q 1 E) (if-same (equal (car (cdr xs)) '?)
                                   (memb?
                                    (if (equal (car (cdr xs)) '?)
                                        (remb (cdr (cdr xs)))
                                        (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E Q 1 E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E Q 1 E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                         (remb (cdr (cdr xs)))
                                         (cons (car (cdr xs)) (remb (cdr (cdr xs))))))
               
               ((A 1) (memb? '()))

               ((A 1 Q) (atom '()))

               ((A 1) (if-true 'nil
                               (if (equal (car '()) '?)
                                   't
                                   (memb? (cdr '())))))

               ((A) (equal-same 'nil))

               ((E A 1 E) (if-same (atom (cdr xs))
                                   (memb?
                                    (cons
                                     (car xs)
                                     (if (atom (cdr xs))
                                         '()
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E A 1 2) (if-nest-A (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E 1 2) (if-nest-E (atom (cdr xs))
                                           '()
                                           (if (equal (car (cdr xs)) '?)
                                               (remb (cdr (cdr xs)))
                                               (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E A) (memb? (cons (car xs) '())))

               ((E A 1 E A Q) (atom/cons (car xs) '()))

               ((E A 1 E A) (if-false 'nil
                                      (if (equal (car (cons (car xs) '())) '?)
                                          't
                                          (memb? (cdr (cons (car xs) '()))))))

               ((E A 1 E A Q 1) (car/cons (car xs) '()))
               ((E A 1 E A E 1) (cdr/cons (car xs) '()))

               ((E A 1 E A) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb? '())))

               ((E A 1 E A) (memb? '()))

               ((E A 1 E A Q) (atom '()))

               ((E A 1 E A) (if-true 'nil
                                     (if (equal (car '()) '?)
                                         't
                                         (memb? (cdr '())))))

               ((E A 1 E E) (memb?
                             (cons
                              (car xs)
                              (if (equal (car (cdr xs)) '?)
                                  (remb (cdr (cdr xs)))
                                  (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E Q) (atom/cons (car xs)
                                         (if (equal (car (cdr xs)) '?)
                                             (remb (cdr (cdr xs)))
                                             (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-false 'nil
                                      (if (equal
                                           (car
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                           '?)
                                          't
                                          (memb?
                                           (cdr
                                            (cons
                                             (car xs)
                                             (if (equal (car (cdr xs)) '?)
                                                 (remb (cdr (cdr xs)))
                                                 (cons (car (cdr xs))
                                                       (remb (cdr (cdr xs)))))))))))

               ((E A 1 E E Q 1) (car/cons (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-nest-E (equal (car xs) '?)
                                       't
                                       (memb?
                                        (cdr
                                         (cons
                                          (car xs)
                                          (if (equal (car (cdr xs)) '?)
                                              (remb (cdr (cdr xs)))
                                              (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))))

               ((E A 1 E E 1) (cdr/cons (car xs)
                                        (if (equal (car (cdr xs)) '?)
                                            (remb (cdr (cdr xs)))
                                            (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))

               ((E A 1 E E) (if-same (equal (car (cdr xs)) '?)
                                     (memb?
                                      (if (equal (car (cdr xs)) '?)
                                          (remb (cdr (cdr xs)))
                                          (cons (car (cdr xs)) (remb (cdr (cdr xs))))))))

               ((E A 1 E E A 1) (if-nest-A (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E E E 1) (if-nest-E (equal (car (cdr xs)) '?)
                                           (remb (cdr (cdr xs)))
                                           (cons (car (cdr xs)) (remb (cdr (cdr xs))))))

               ((E A 1 E) (equal-if (if (atom (cdr xs))
                                        'nil
                                        (if (equal (car (cdr xs)) '?)
                                            (memb? (remb (cdr (cdr xs))))
                                            (memb? (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                                    'nil))

               ((E A 1) (if-same (equal (car xs) '?) 'nil))

               ((E A) (equal 'nil 'nil))

               ((E) (if-same (equal
                              (if (atom (cdr xs))
                                  'nil
                                  (if (equal (car (cdr xs)) '?)
                                      (memb? (remb (cdr (cdr xs))))
                                      (memb? (cons (car (cdr xs)) (remb (cdr (cdr xs)))))))
                              'nil)
                             't))

               (() (if-same (atom xs) 't))
               
               )))



