(define-module (list-ops)
  #:export (my-length
            my-reverse
            my-map
            my-filter
            my-fold
            my-append
            my-concatenate
            ))

(import (rnrs (6)))
(use-modules ((rnrs) :version (6)))
(use-modules (srfi srfi-64))
(use-modules (srfi srfi-1))

(define (my-length list)
  (if (null? list) 0
      (+ (my-length (cdr list)) 1)))

(define (my-append a b) 
   (if (null? a) 
       b
       (cons (car a)
             (my-append (cdr a) b))))

(define (my-reverse lst)
  (define (my-reverse-it l acc)
      (if (null? l)
          acc
          (my-reverse-it (cdr l) (cons (car l) acc)))
      )
  (my-reverse-it lst '()))

(define (my-map f list)
  (if (null? list)
      '()
      (cons (f (car list)) (my-map f (cdr list)))))

(define (my-fold f base lst)
  (if (null? lst)
      base
      (f (car lst)
         (my-fold f base (cdr lst)))))

(define (my-filter f list)
  (if (null? list)
      '()
      (if (not (f (car list)))
          (my-filter f (cdr list))
          (cons (car list) (my-filter f (cdr list))))))

(define (my-concatenate lst) 
   (if (null? lst) 
       lst
       (my-append (car lst)
             (my-concatenate (cdr lst)))))



        