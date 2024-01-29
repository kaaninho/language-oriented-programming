#lang racket
(provide (rename-out (db-read-syntax read-syntax)))


(define (parse-line src in)
  (regexp-try-match #px"^\\s+" in)
  (if (eof-object? (peek-char in))
      eof
      (read (open-input-string
             (string-append "(" (read-line in) ")")))))


(define (parse-program src in)
  (define line (parse-line src in))
  (if (eof-object? line)
      '()
      (cons line (parse-program src in))))


(define (db-read-syntax src in)
  (datum->syntax
   #f
   `(module db racket
      (require "db.rkt")
      (db
       ,@(parse-program src in)))))
