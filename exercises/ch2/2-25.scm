(use test)

(define temp (list 1 3 (list 5 7) 9))
(test 7 (car (cdr (car (cdr (cdr temp))))))


(define temp (list (list 7)))
(test 7 (car (car temp)))


(define temp (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(test 7 (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr temp)))))))))))))
