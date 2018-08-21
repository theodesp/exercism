(define-module (scrabble-score)
  #:export (score))
(use-modules (srfi srfi-1))

(define (score sent)
  (fold + 0
          (map
           (lambda (ch)
             (case (char-upcase ch)
               [(#\A #\E #\I #\O #\U #\L #\N #\R #\S #\T ) 1]
               [(#\D #\G ) 2]
               [(#\B #\C #\M #\P) 3]
               [(#\F #\H #\V #\W #\Y) 4]
               [(#\K) 5]
               [(#\J #\X) 8]
               [(#\Q #\Z) 10]
               (else 0))) (string->list sent)))
  )


  
