(use test)

(define (square x)
  (* x x))

;; Like Ex 2-21
(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))
;; Tests
(test (list 1 (list 4 (list 9 16) (list 36 49))) (square-tree (list 1 (list 2 (list 3 4) (list 6 7)))))

;; With map, recursion FTW
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))

;; Tests
(test (list 1 (list 4 (list 9 16) (list 36 49))) (square-tree (list 1 (list 2 (list 3 4) (list 6 7)))))
