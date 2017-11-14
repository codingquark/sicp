(use test)

(define (reverse items)
  (define (inner items acc)
    (if (null? items)
        acc
        (inner (cdr items) (cons (car items) acc))))
  (inner items '()))

;; Tests
(test '() (reverse '()))
(test (list 4 3 2 1) (reverse (list 1 2 3 4)))
