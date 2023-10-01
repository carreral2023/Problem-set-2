#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;Data definitions
;a Quantity is a Non-negative Integer representing the quantity of an item
;a price tag consists of:
;a Name is a string representing the full name of the product
;a price is a Positive Number representing the price in dollars
;a SKU is a string representing the SKU number of an item
(define-struct item (name price SKU))
(define-struct inventory (name price quantity SKU))

;function 1

;;Sample value and expressions

;values
(define inventory-1 (make-inventory "Shirt" "15" "40" "SH15GH"))
(define inventory-2 (make-inventory "Shorts" "20" "45" "BT16YU"))
(define inventory-3 (make-inventory "Sneakers" "30" "50" "SO57YU"))
(define inventory-4 (make-inventory "Necklace" "5" "55" "AC89TG"))

;;expressions
(define output-5 15)
(define output-6 20)
(define output-7 30)
(define output-8 5)

;struct -> number
;purpose: output an item price and quantity and get total investment
(define (total-investment i-inventory)
  (* (inventory-price i-inventory) (inventory-quantity i-inventory)))
  

;;test
(check-expect (total-investment inventory-1) "15")
(check-expect (total-investment inventory-2) "20")
(check-expect (total-investment inventory-3) "30")
(check-expect (total-investment inventory-4) "5")
  
;function 2

;;Sample value and expressions

;values
(define item-1 (make-item "Shirt" "15" "SH15GH"))
(define item-2 (make-item "Shorts" "20" "BT16YU"))
(define item-3 (make-item "Sneakers" "30" "SO57YU"))
(define item-4 (make-item "Necklace" "5" "AC89TG"))

;;expressions
(define output-1 (string-append (item-name item-1) " " (item-price item-1) ", " (item-SKU item-1)))
(define output-2 (string-append (item-name item-2) " " (item-price item-2) ", " (item-SKU item-2)))
(define output-3 (string-append (item-name item-3) " " (item-price item-3) ", " (item-SKU item-3)))
(define output-4 (string-append (item-name item-4) " " (item-price item-4) ", " (item-SKU item-4)))

;struct -> string
;;purpose: output an item as a string
(define (string-output i-item)
  (string-append (item-name i-item) " " (item-price i-item) ", " (item-SKU i-item)))

;;test with sample expressions
(check-expect (string-output item-1) output-1)
(check-expect (string-output item-2) output-2)
(check-expect (string-output item-3) output-3)
(check-expect (string-output item-4) output-4)





