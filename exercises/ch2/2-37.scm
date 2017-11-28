(use test)

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))


;; Tests
;; Blatantly copied from wasamasa
(define v (list 1 2 3))
(define w (list 4 5 6))

(define m (list (list 1 2 3)
                (list 4 5 6)
                (list 7 8 9)))
(define n (list (list 1 0 0)
                (list 0 1 0)
                (list 0 0 1)))

(test 32 (dot-product v w))
(test 32 (dot-product w v))

(test (list (+ 1 4 9) (+ 4 10 18) (+ 7 16 27))
      (matrix-*-vector m v))
(test (list (+ 4 0 0) (+ 0 5 0) (+ 0 0 6))
      (matrix-*-vector n w))

(test (list (list 1 4 7)
            (list 2 5 8)
            (list 3 6 9))
      (transpose m))
(test (list (list 1 0 0)
            (list 0 1 0)
            (list 0 0 1))
      (transpose n))

(test (list (list 1 2 3)
            (list 4 5 6)
            (list 7 8 9))
      (matrix-*-matrix m n))
(test (list (list 30 36 42)
            (list 66 81 96)
            (list 102 126 150))
(matrix-*-matrix m m))
