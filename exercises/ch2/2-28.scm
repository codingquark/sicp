(use test)

(define (fringe items)
  (cond ((null? items) '())
        ((pair? items) (append (fringe (car items))
                               (fringe (cdr items))))
        (else (list items))))

;; Tests
(define x (list (list 1 2) (list 3 4)))
(test (list 1 2 3 4) (fringe x))
(test (list 1 2 3 4 1 2 3 4) (fringe (list x x)))
