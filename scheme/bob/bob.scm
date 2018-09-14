(define-module (bob)
  #:export (response-for))
(use-modules (srfi srfi-13))

;; Bob is a lackadaisical teenager. In conversation, his responses are very limited.
;;
;; Bob answers 'Sure.' if you ask him a question.
;;
;; He answers 'Whoa, chill out!' if you yell at him.
;;
;; He says 'Fine. Be that way!' if you address him without actually saying anything.
;;
;; He answers 'Whatever.' to anything else.

(define (response-for str)
  (cond ((empty? str) "Fine. Be that way!")
        ((shout? str) "Whoa, chill out!")
        ((question? str) "Sure.")
        (else "Whatever.")))

(define (question? str)
  (eq? (string-ref str (- (string-length str) 1)) #\?))

(define (shout? str)
  (let* ((nopunc (string-delete char-set:punctuation str))
         (clean (string-delete char-set:digit nopunc)))
        (cond ((empty? clean) #f)
              ((all-uppercase? (string-delete char-set:punctuation str)) #t)
              (else #f))))
                               
(define (empty? str)
  (string-null? (string-trim str)))

(define (all-uppercase? str)
  (equal? (map string-upcase (string-tokenize str)) (string-tokenize str)))