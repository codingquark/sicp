(use test)

(define (reverse items)
  (define (inner items acc)
    (if (null? items)
        acc
        (inner (cdr items) (cons (car items) acc))))
  (inner items '()))

(define (deep-reverse items)
  (define (inner items acc)
    (cond ((null? items) acc)
          ((pair? (car items)) (inner (cdr items)
                                      (cons (deep-reverse (car items)) acc)))
          (else (inner (cdr items)
                       (cons (car items) acc)))))
  (inner items '()))

;; Tests
(define x (list (list 1 2) (list 3 4)))
(test '() (reverse '()))
(test (list (list 3 4) (list 1 2)) (reverse x))
(test (list (list 4 3) (list 2 1)) (deep-reverse x))
(define x (list (list 1 2) 3))
(test (list 3 (list 2 1)) (deep-reverse x))
(define x (list 1 (list 2 (list 3))))
(test (list 3 (list 2 (list 1))) (deep-reverse x)) ;; this fails!
