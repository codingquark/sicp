(define (for-each proc items)
  (cond ((null? items) #t)
        (else (proc (car list))
              (for-each proc (cdr items)))))
