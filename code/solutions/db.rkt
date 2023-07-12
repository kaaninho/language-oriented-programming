#lang racket
(provide db SHOW-DB PRINT PUT GET)
(require (for-syntax syntax/parse))

#|
SHOW-DB
PUT "milk" 1.50
PUT "water" 1.00
x = GET "water"
PRINT x
SHOW-DB
y = GET "milk"
PRINT "Summe"
|#


;; Definitionen und Hilfsfunktionen
(define the-db (make-hash))

(define (get-it name)
  (hash-ref the-db name))

(define (put-it name val)
  (hash-set! the-db name val))

(define (print-it x)
  (display (format "~v" x))
  (newline))

;; Befehle: SHOW-DB, PRINT x, PUT name val, GET name
(define SHOW-DB #f)
(define PRINT #f)
(define GET #f)
(define PUT #f)
(define = #f)

(define-syntax (db1 form)
  (syntax-parse form #:datum-literals (SHOW-DB GET PUT PRINT =)
    [(db1 (SHOW-DB))
     #`(print-it the-db)]
    [(db1 (PRINT x))
     #`(print-it x)]
    [(db1 (PUT name val))
     #`(put-it name val)]
    [(db1 (var = GET name))
     #`(define var (get name))]))


(define-syntax (db form)
  (syntax-parse form
    [(db statement ...)
     #`(begin
         #,@(map (lambda (statement)
                   (syntax-parse (datum->syntax #`db statement) #:datum-literals (PRINT SHOW-DB GET PUT =)
                                 [(SHOW-DB)
                                  #`(begin
                                      (display "THE DB: ")
                                      (print-it the-db))]
                                 [(PRINT x)
                                  #`(print-it x)]
                                 [(PUT name val)
                                  #`(put-it name val)]
                                 [(var = GET name)
                                  #`(define var (get-it name))]))
                 (syntax->list #'(statement ...))))]))
     
#;
(db (SHOW-DB)
    (PUT "milk" 1.50)
    (PUT "water" 1.00)
    (x = GET "water")
    (PRINT x)
    (SHOW-DB)
    (y = GET "milk")
    (PRINT "Summe"))
