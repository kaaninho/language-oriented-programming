#lang reader "db-reader.rkt"

SHOW-DB
PUT "milk" 1.50
PUT "water" 1.00
x = GET "water"
PRINT x
SHOW-DB
y = GET "milk"
PRINT "Summe"
PRINT (+ x y)
