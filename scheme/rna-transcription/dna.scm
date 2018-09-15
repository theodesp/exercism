(define-module (dna)
  #:export (to-rna))

(define (to-rna dna)
  (string-map dna->rna dna))

(define (dna->rna strand)
  (case strand
    [(#\G) #\C]
    [(#\C) #\G]
    [(#\T) #\A]
    [(#\A) #\U]))
