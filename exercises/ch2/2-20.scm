(use test)

(define (reverse items)
  (define (inner items acc)
    (if (null? items)
        acc
        (inner (cdr items) (cons (car items) acc))))
  (inner items '()))

(define (filter pred items)
  (define (inner items acc)
    (if (null? items)
        (reverse acc)
        (let ((item (car items)))
          (if (pred item)
              (inner (cdr items) (cons item acc))
              (inner (cdr items) acc)))))
  (inner items '()))

(define (same-parity x . items)
  (if (even? x)
      (cons x (filter even? items))
      (cons x (filter odd? items))))

;; Tests
(test (list 1 3 5 7) (same-parity 1 2 3 4 5 6 7))
(test (list 2 4 6) (same-parity 2 3 4 5 6 7))
