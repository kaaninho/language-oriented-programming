#lang racket
(require (for-syntax syntax/parse))

#|

(switch y
        [case "Holiday" -> "I am not around"]
        [case "Work"    -> "How can I help?"])

↝ [MAKROEXPANSION]

(cond
  [(eq? y "Holiday") "I am not around"]
  [(eq? y "Work") "How can I help?")]

|#

(define-syntax (switch form)
  (syntax-parse form #:datum-literals (case ->)
      [(switch thing [case a -> b] ...)
       #`(cond
           [(eq? thing a) b]
           ...)]))

(define y "Work")

(switch y
        [case "Holiday" -> "I am not around"]
        [case "Work" -> "How can I help?"])
