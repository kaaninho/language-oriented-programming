#lang racket

(define pi 3.141592)

;; READ und EVAL
;; (read-syntax "intro" (open-input-string "(+ 1 2)"))
;; #`(+ 1 2)
;; #`(+ 1 2 pi)
;; #`(+ 1 2 #,pi)
;; (eval #`(+ 1 2))
;; (list + 1 2)
;; (list 2 + 1)
;; (eval #`(2 + 1))
