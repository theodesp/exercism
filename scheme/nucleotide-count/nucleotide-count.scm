(define-module (nucleotide-count)
  #:export (nucleotide-counts dna-count))
(use-modules (srfi srfi-1))


(define initial '((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0)))

(define (nucleotide-counts strands)
  (nucleotide-counts-helper (string->list strands) initial))
  
(define (nucleotide-counts-helper strands init)
  (if (null? strands)
      init
      (let ((entry (assoc-ref init (car strands))))
        (begin
              (set! init (alist-delete (car strands) init))
              (set! init
                    (acons (car strands) (+ entry 1) init))
              (nucleotide-counts-helper (cdr strands) init)))))
      
(define (dna-count strand strands)
  (if (not (list? (member strand '(#\A #\C #\G #\T))))
      (error "Not valid Strand")
      (assoc-ref (nucleotide-counts strands) strand)))

