(define-module (word-count)
  #:export (countwords))

(define (string-empty? str)
  (= (string-length str) 0))

(define (tokenize words)
  (string-split (string-downcase words) (char-set #\, #\space #\: #\. #\& #\@ #\$ #\^ #\& #\! #\newline)))

(define (clean words)
  (filter (lambda (x)
            (not (string-empty? x)))
          (map (lambda (x) 
                 (string-trim-both x (char-set #\'))) (tokenize words))))
              
(define (word-count-helper words acc)
  (if (null? words)
      acc
      (let ((entry (assoc-ref acc (car words))))
        (if (eq? entry #f)
            (begin
              (set! acc
                    (assoc-set! acc (car words) 1))
              (word-count-helper (cdr words) acc))
            (begin
              (set! acc
                    (assoc-set! acc (car words) (+ entry 1)))
               (word-count-helper (cdr words) acc))))))

(define (countwords words)
  (word-count-helper (clean words) '()))
