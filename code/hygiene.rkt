#lang racket
(require (for-syntax syntax/parse))
(provide unless)
(define-syntax (unless form)
  (syntax-parse form
    [(unless test consequent)
     #`(if (not test)
           consequent
           #f)]))

(let [[not "komischer wert"]]
  (unless (< 3 1)
    (print "Hallo")))

(define-syntax (do-smth form)
  (syntax-parse form
    [(do-smth expr pos non-pos)
     #`(let [[result expr]]
         (cond
           [(positive? result) pos]
           [else non-pos]))]))

(let [[result "Es ist positiv"]]
  (do-smth (+ 3 2) result "nicht positiv"))
