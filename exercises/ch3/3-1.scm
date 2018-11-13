(define (make-accumulator initial-value)
  (lambda (num)
    (begin (set! initial-value (+ initial-value num))
           initial-value)))
