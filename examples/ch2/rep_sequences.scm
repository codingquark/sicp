(cons 1
      (cons 2
            (cons 3
                  (cons 4 '()))))

(define one-through-four (list 1 2 3 4))
(define squares (list 1 4 9 16 25))
(define odds (list 1 3 5 7))

;; cdring down the lists
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(list-ref one-through-four 2) ;; 3

;; Recursive - I LIEK DIS
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

;; Such a convoluted iterative version.
(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(append squares odds) ;; (1 4 9 16 25 1 3 5 7)
