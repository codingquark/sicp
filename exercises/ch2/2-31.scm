(use test)

(define (square x)
  (* x x))

(define (tree-map proc tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

;; Tests
(define tree (list 1 (list 2 (list 3 4) (list 6 7))))
(test (list 1 (list 4 (list 9 16) (list 36 49))) (tree-map square tree))
