;; shows smooth recusrion
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))


;; This is supposed to be non-recursive
(define (factorial-itr n)
  (fact-itr 1 1 n))

;; WAT! this is recursion again!
;; No, just because the procedure is calling
;; itself doesn't mean the process recursive.
(define (fact-itr product counter max-count)
  (if (> counter max-count)
      product
      (fact-itr (* counter product)
                (+ counter 1)
                max-count)))
