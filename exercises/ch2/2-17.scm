(use test)

(define (last-pair input)
  (define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
  (define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
  (list-ref input (- (length input) 1)))

;; Tests
(test 34 (last-pair (list 23 72 149 34)))
(test 39 (last-pair (list 23 72 149 34 39)))
