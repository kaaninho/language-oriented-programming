#lang racket
(require (for-syntax syntax/parse))

#|

(switch y
        [case "Holiday" -> "I am not around"]
        [case "Work"    -> "How can I help?"])

↝ [MAKROEXPANSION]

(cond
  [(eq? y "Holiday") "I am not around"]
  [(eq? y "Work") "How can I help?")])

|#



(define y "Holiday")

(switch y
        ["Holiday" "I am not around"]
        ["Work"    "How can I help?"])































#;(define-syntax (switch form)
    (syntax-parse form
      [(switch thing [a b] [c d])
       #`(cond
           [(eq? thing a) b]
           [(eq? thing c) d])]))


#;(define-syntax (switch2 form)
    (syntax-parse form
      [(switch2 thing [a b] ...)
       #`(cond
           [(eq? thing a) b]
           ...)]))



#;(define-syntax (switch3 form)
    (syntax-parse form #:datum-literals (case ->)
                  [(switch3 thing [case a -> b] ...)
                   #`(cond
                       [(eq? thing a) b]
                       ...)]))
