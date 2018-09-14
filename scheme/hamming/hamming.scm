(define-module (hamming)
  #:export (hamming-distance))
(use-modules (srfi srfi-1))

(define (hamming-distance a b)
   (if (not (equal? (string-length a) (string-length b)))
        (error "Strings must be the same length")
        (apply + (difference a b))))
         
(define (difference a b)
  (map (lambda (a b) (if (char=? a b) 0 1)) (string->list a) (string->list b)))
