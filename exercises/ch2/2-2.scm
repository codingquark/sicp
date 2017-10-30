(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (make-point x-coordinate y-coordinate)
  (cons x-coordinate y-coordinate))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (average x y)
  (/ (+ x y) 2))


(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment (make-segment (make-point 2 2) (make-point 4 4))))
