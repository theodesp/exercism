(define-module (anagram)
  #:export (anagrams-for))


(define (remove-invalid word anagrams)
  (let ((not-same (filter
                         (lambda (x) (not (string-ci=? x word))) anagrams)))
    (filter
     (lambda (x)
       (or (= (string-length x) (string-length word)))) not-same)))

(define (contains-word ch word)
  (list? (member (char-downcase ch) (string->list (string-downcase word)))))

(define (anagrams-for-helper initial word anagrams)
  (cond ((null? anagrams) anagrams)
        ((= (string-length word) 0) (cons (car anagrams) (anagrams-for-helper initial initial (cdr anagrams))))
        ((contains-word (string-ref word 0) (car anagrams)) (anagrams-for-helper initial (substring word 1) anagrams))
        (else (anagrams-for-helper initial initial (cdr anagrams)))))

(define (anagrams-for word anagrams)
  (let ((whats-left (remove-invalid word anagrams)))
    (anagrams-for-helper word word whats-left)))
