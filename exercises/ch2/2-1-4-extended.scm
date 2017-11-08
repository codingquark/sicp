;; Contains ex from 2.7 to 2.16
;; https://en.wikipedia.org/wiki/Interval_arithmetic

(use test)

;; bootstrapping
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

;; Ex 2.7
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

;; Tests
(test 1 (lower-bound (make-interval 1 2)))
(test 2 (upper-bound (make-interval 1 2)))

;; Ex 2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;; Tests
(test (cons -1 1) (sub-interval (make-interval 1 2) (make-interval 1 2)))

;; Ex 2.9
(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

;; Tests
(test 0.5 (width (make-interval 1 2)))

;; Ex 2.10
(define (div-interval x y)
  (let ((y-lower (lower-bound y))
        (y-upper (upper-bound y)))
    (if (>= 0 (* y-lower y-upper))
        (error "Interval spans 0")))
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

;; Tests
(test-error (div-interval (make-interval 1 1) (make-interval 1 0)))
(test (/ 0.8 0.8) (upper-bound (div-interval (make-interval 0.8 0.2) (make-interval 1.2 0.8))))

;; Ex 2.11
;; -x1 : +y1 OR -y1
;; +x1 : +y1 OR -y1
;; -x1 : +y2 OR -y2
;; +x1 : +y2 OR -y2
;; -x2 : +y1 OR -y1
;; +x2 : +y1 OR -y1
;; -x2 : +y2 OR -y2
;; +x2 : +y2 OR -y2
;;------------------
;; [- -] : [- -] [- +] [+ +]
;; [- +] : [- -] [- +] [+ +]
;; [+ +] : [- -] [- +] [+ +]
;; For each case of x, 3 cases of y are to be tested.
(define (mul-interval x y)
  (let ((x-upper (upper-bound x))
        (x-lower (lower-bound x))
        (y-upper (upper-bound y))
        (y-lower (lower-bound y)))
    (cond
     ((and (negative? x-lower) (negative? x-upper) (negative? y-lower) (negative? y-upper))
      (make-interval (* x-upper y-upper) (* x-lower y-lower)))
     ((and (negative? x-lower) (negative? x-upper) (negative? y-lower) (positive? y-upper))
      (make-interval (* x-lower y-upper) (* x-lower y-lower)))
     ((and (negative? x-lower) (negative? x-upper) (positive? y-lower) (positive? y-upper))
      (make-interval (* x-lower y-upper) (* x-upper y-lower)))
     ((and (negative? x-lower) (positive? x-upper) (negative? y-lower) (negative? y-upper))
      (make-interval (* x-upper y-lower) (* x-lower y-lower)))
     ((and (negative? x-lower) (positive? x-upper) (negative? y-lower) (positive? y-upper))
      (make-interval (min (* x-lower y-upper) (* x-upper y-lower))
                     (max (* x-lower y-lower) (* x-upper y-upper))))
     ((and (negative? x-lower) (positive? x-upper) (positive? y-lower) (positive? y-upper))
      (make-interval (* x-lower y-upper) (* x-upper y-upper)))
     ((and (positive? x-lower) (positive? x-upper) (negative? y-lower) (negative? y-upper))
      (make-interval (* x-lower y-lower) (* x-upper y-upper)))
     ((and (positive? x-lower) (positive? x-upper) (negative? y-lower) (positive? y-upper))
      (make-interval (* x-upper y-lower) (* x-lower y-upper)))
     ((and (positive? x-lower) (positive? x-upper) (positive? y-lower) (positive? y-upper))
      (make-interval (* x-lower y-lower) (* x-upper y-upper))))))

;; Tests
(test (* 0.8 1.2) (lower-bound (mul-interval (make-interval 0.8 0.2) (make-interval 1.2 0.8))))
(test (* 0.2 0.8) (upper-bound (mul-interval (make-interval 0.8 0.2) (make-interval 1.2 0.8))))

;; More bootstrapping to work with intervals like 3.5±0.15
(define (makee-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;; Ex 2.12
;; TIL, "Real engineering situations" usually involve measurements
;; with only a small uncertainity, measured as the ratio of the width
;; of the interval to the midpoint of thee interval.

(define (make-center-percent center percentage)
  (let ((percent (* (/ percentage 100) center)))
    (make-interval (- center percent)
                   (+ center percent))))

(define (percent interval)
  (* (/ (width interval) (center interval)) 100))

;; Tests
(test (cons 0.9 1.1) (make-center-percent 1 10))
(test 10.0 (percent (make-center-percent 1 10)))

;; Ex 2.14
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

;; Let's see if Lem E. Tweakit is right!
(print (par1 (make-interval 0.999 1.001) (make-interval 0.999 1.001))) ;; (0.498501998001998 . 0.501502002002002)
(print (par2 (make-interval 0.999 1.001) (make-interval 0.999 1.001))) ;; (0.4995 . 0.5005)
(print (par1 (make-interval 0.999 1.001) (make-interval 0.888 0.999))) ;; (0.443556 . 0.529941176470588)
(print (par2 (make-interval 0.999 1.001) (make-interval 0.888 0.999))) ;; (0.470117647058823 . 0.4999995)
;; Right, he is.

;; Ex 2.16 - http://wiki.drewhess.com/wiki/SICP_exercise_2.16
