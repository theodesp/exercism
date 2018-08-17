(define-module (squares)
  #:export (sum-of-squares
            square-of-sums
            difference)
  #:autoload (srfi srfi-1) (reduce iota))

(define (square n)
  (* n n)
  )

(define (sum n)
  (if (<= n 1)
      n
      (+ n (sum (- n 1)))
      )
  )

(define (sum-of-squares n)
  (cond ((= n 0) 1)
        ((= n 1) n)
        ((> n 1) (+ (square n) (sum-of-squares (- n 1))))
        )
  )

(define (square-of-sums n)
  (square (sum n))
  )

(define (difference n)
  (- (square-of-sums n) (sum-of-squares n))
  )