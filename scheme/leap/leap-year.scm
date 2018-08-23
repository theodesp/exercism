(define-module (leap-year)
  #:export (leap-year?))
(use-modules (srfi srfi-64))

(define (divisible? number by)
  (= (modulo number by) 0))

(define (leap-year? year)
  (if (and (divisible? year 4) (not (divisible? year 100)))
      #t
      (if (divisible? year 400)
          #t
          #f)))