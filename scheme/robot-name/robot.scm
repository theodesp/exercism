(define-module (robot)
  #:export (build-robot
            robot-name
            reset-name)
  #:autoload (srfi srfi-1) (iota))

(define alphabet "ABCDEFGHIJKLMNOPQRSTUVWXWZ")
(define digits "0123456789")

(define (random-string n)
  (if (= n 0)
        ""
        (string-append (string(string-ref alphabet (random 26))) (random-string (- n 1)))))

(define (random-digits n)
  (if (= n 0)
        ""
        (string-append (string(string-ref digits (random 10))) (random-digits (- n 1)))))

(define (new) (string-append (random-string 2) (random-digits 3)))

(define (build-robot)
   (let ((name (new)))
      (define (robot-factory . args)
        (case (car args)
            [("print") name]
            [("reset") (set! name (new))]
            (else error("Invalid command")))) robot-factory))

(define (robot-name robot)
  (robot "print"))

(define (reset-name robot)
  (robot "reset"))
