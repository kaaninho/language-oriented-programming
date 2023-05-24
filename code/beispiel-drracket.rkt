#lang deinprogramm/sdp/beginner


(check-expect (summe 4 5) 9)
(define summe
  (lambda (x y)
    (- x y)))

