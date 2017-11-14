(use test)

(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

;; Tests
(test (list 1 4 9 16) (square-list (list 1 2 3 4)))

(define (square-list items)
  (map (lambda (x) (* x x)) items))

;; Tests
(test (list 1 4 9 16) (square-list (list 1 2 3 4)))
