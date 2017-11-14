;; "map" is provided by Scheme.
;; This is book's implementation.
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map (proc (cdr items))))))
