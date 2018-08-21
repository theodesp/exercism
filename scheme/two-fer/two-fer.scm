(define-module (two-fer)
  #:export (two-fer))

(define* (two-fer #:optional (name ""))
  (if (string-null? name)
       "One for you, one for me."
       (string-append "One for " name ", one for me.")
       )
  )

