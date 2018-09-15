(define-module (raindrops)
  #:export (convert))
(use-modules (srfi srfi-64))

(define (factors-of num curr)
  (cond ((= num 1) '(1))
        ((= curr num) (list num))
        ((= (remainder num curr) 0) (cons curr (factors-of num (+ curr 1))))
        (else (factors-of num (+ curr 1)))))

(define (list-contains? lst x)
  (list? (member x lst)))

(define (convert n)
  (convert-factor-three n (factors-of n 1) ""))

(define (convert-factor-three n factors curr)
  (if (list-contains? factors 3)
      (convert-factor-five n factors "Pling")
      (convert-factor-five n factors "")))

(define (convert-factor-five n factors curr)
  (if (list-contains? factors 5)
      (convert-factor-seven n factors (string-append curr "Plang"))
      (convert-factor-seven n factors curr)))

(define (convert-factor-seven n factors curr)
  (if (list-contains? factors 7)
      (string-append curr "Plong")
      (if (= (string-length curr) 0)
          (number->string n)
          curr)))
  