#lang racket

(define pi 3.141592)

;; READ und EVAL
#;(read-syntax "basic" (open-input-string "(+ 1 2)"))
#;#`(+ 1 2)
#;(eval #`(+ 1 2))
