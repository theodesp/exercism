(define-module (grains)
  #:export (square total))
(use-modules (srfi srfi-60))

(define (square n)
  (arithmetic-shift 1 (- n 1)))

(define (total) 18446744073709551615)

(square 1)