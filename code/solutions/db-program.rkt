#lang reader "db-reader.rkt"

SHOW-DB
PUT "coke" 2.50
PUT "water" 1.00
x <- GET "water"
PRINT x
SHOW-DB
y <- GET "coke"
PRINT "Summe"
PRINT (+ x y)
