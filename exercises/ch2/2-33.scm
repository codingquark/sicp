(use test)

(define nil '())

;; From examples:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(test (list 1 2 3) (map (lambda (x) (+ x 1)) (list 0 1 2)))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(test (list 1 2 3 4 5) (append (list 1 2 3) (list 4 5)))

(define (length sequence)
  (accumulate (lambda (first acc) (+ 1 acc)) 0 sequence))

(test 5 (length (list 1 2 3 4 5)))
