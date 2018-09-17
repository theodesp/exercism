(define-module (phone-number)
  #:export (numbers area-code pprint)
  #:autoload (ice-9 format) (format))

(define invalidNum "0000000000")

(define (numbers phone)
  (let* ((nosymbols (string-delete char-set:punctuation phone))
        (cleaned (string-delete char-set:whitespace nosymbols)))
    (case (string-length cleaned)
      [(9) invalidNum]
      [(11) (if (eq? (string-ref cleaned 0) #\1) (substring cleaned 1 11) invalidNum)]
      [else cleaned])))

(define (area-code number-string)
  (case (string-length number-string)
    [(11) (if (eq? (string-ref number-string 0) #\1)
              (substring number-string 1 4)
              invalidNum)]
    [else (substring number-string 0 3)]))

(define (pprint number-string)
   (case (string-length number-string)
    [(11) (if (eq? (string-ref number-string 0) #\1)
              (string-append "(" (area-code number-string) ")" " " (substring number-string 4 7) "-" (substring number-string 7 11))
              invalidNum)]
    [else (string-append "(" (area-code number-string) ")" " " (substring number-string 3 6) "-" (substring number-string 6 10))]))
    
