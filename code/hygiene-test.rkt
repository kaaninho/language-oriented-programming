#lang racket
(require "hygiene.rkt")

(define not "komischer Wert")

(unless (< 3 1)
  (print "Hey"))
