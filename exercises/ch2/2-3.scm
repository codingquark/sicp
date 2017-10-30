(use test)

;; First representation:
;; (x1,y1), (x2,y2)
(define (make-rect start-point end-point)
  (cons start-point end-point))

(define (rect-height rect)
  (- (x-point (cdr rect))
     (x-point (car rect))))

(define (rect-width rect)
  (- (y-point (cdr rect))
     (y-point (car rect))))

(define (make-point x-coordinate y-coordinate)
  (cons x-coordinate y-coordinate))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (rect-area rect)
  (* (rect-height rect)
     (rect-width rect)))
(define (rect-perimeter rect)
  (* 2 (* (rect-height rect)
          (rect-width rect))))

;; Test
(test 16 (rect-area (make-rect (make-point 0 0)
                               (make-point 4 4))))
(test 8 (rect-perimeter (make-rect (make-point 2 2)
                                    (make-point 4 4))))


;; For the second part of the exercise,
;; we can define a new representation and
;; redefine `rect-height`,`rect-widgh`.
