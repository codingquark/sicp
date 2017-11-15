(use test)
(define true #t)
(define false #f)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

;; A mobile will have two branches
;; Each branch has length + weight/mobile
;; We need to calculate the weight of each branch.
(define (total-weight mobile)
  (define (branch-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (balanced? mobile)
  (define (torque branch)
    (if (pair? (branch-structure branch))
        (* (branch-length branch) (total-weight (branch-structure branch)))
        (* (branch-length branch) (branch-structure branch))))
  (if (= (torque (left-branch mobile))
          (torque (right-branch mobile)))
       true
      false))

;; Test
(define x (make-mobile (make-branch 1 2) (make-branch 2 1)))
(define y (make-mobile (make-branch 1 (make-mobile (make-branch 2 2)
                                                   (make-branch 1 3)))
                       (make-branch 2 (make-mobile (make-branch 1 2)
                                                   (make-branch 3 2)))))
(test 3 (total-weight x))
(test 9 (total-weight y))
(test true (balanced? x))
(test false (balanced? y))
