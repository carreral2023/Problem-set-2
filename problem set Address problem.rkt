#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;;Data Defintions
;; an address is a structure that consists of:
;; street name is a string
;; street number is a string
;;city is a string
;;state is a string
;; zip code is also a string
(define-struct address (number name city state zip))

;;Sample values and expressions

;;values

(define address-1 (make-address "31" "South Orange Ave" "South Orange" "NJ" "07079"))
(define address-2 (make-address "32" "West Orange Ave" "West Orange" "NY" "11253"))
(define address-3 (make-address "33" "East Orange Ave" "East Orange" "IL" "58304"))
(define address-4 (make-address "34" "Irvington Ave" "Irvington" "MI" "07359"))

;;Function 1

;; expressions
(define output-1 (string-append (address-number address-1) " " (address-name address-1) ", " (address-city address-1) ", " (address-state address-1) ", " (address-zip address-1)))
(define output-2 (string-append (address-number address-2) " " (address-name address-2) ", " (address-city address-2) ", " (address-state address-2) ", " (address-zip address-2)))
(define output-3 (string-append (address-number address-3) " " (address-name address-3) ", " (address-city address-3) ", " (address-state address-3) ", " (address-zip address-3)))
(define output-4 (string-append (address-number address-4) " " (address-name address-4) ", " (address-city address-4) ", " (address-state address-4) ", " (address-zip address-4)))

;;struct -> string
;;purpose: output an address as a string
(define (string-output a-address)
  (string-append (address-number a-address) " " (address-name a-address) ", " (address-city a-address) ", " (address-state a-address) ", " (address-zip a-address)))

;;Test with sample expressions
(check-expect (string-output address-1) output-1)
(check-expect (string-output address-2) output-2)
(check-expect (string-output address-3) output-3)
(check-expect (string-output address-4) output-4)

;;test with random values
(check-expect (string-output (make-address "4" "Porodice Simonovic" "Belgrade" "Serbia" "11253")) "4 Porodice Simonovic, Belgrade, Serbia, 11253")

;;Function 2

;;sample expressions
(define maine-1 (equal? "MI" (address-state address-1)))
(define maine-2 (equal? "MI" (address-state address-2)))
(define maine-3 (equal? "MI" (address-state address-3)))
(define maine-4 (equal? "MI" (address-state address-4)))

;;struct -> boolean
;;purpose: to determine whether a state in the address is Maine (MI)
(define (is-maine? a-address)
  (equal? "MI" (address-state a-address)))

;;test with sample expressions
(check-expect (is-maine? address-1) maine-1)
(check-expect (is-maine? address-2) maine-2)
(check-expect (is-maine? address-3) maine-3)
(check-expect (is-maine? address-4) maine-4)
