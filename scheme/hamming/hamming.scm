(define-module (hamming)
  #:export (hamming-distance))
(use-modules (srfi srfi-1))

(define (hamming-distance a b)
  (let ([difference
         (lambda (s1 s2)
           (map
            (lambda (a b)
              (if (char=? a b) 0 1)) (string->list s1) (string->list s2)))])
     (if (not (equal? (string-length a) (string-length b)))
        (error "Strings must be the same length")
        (apply + (difference a b)))))

   