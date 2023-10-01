#lang htdp/bsl

;data defintions
;structure for an athlete
;an athlete is a structure that has
;a name is a string that represents the athletes name
;a time is a positive number that represents the athletes time
(define-struct athlete (name time))


;;Function 1

;;Sample values and expressions

;;values
(define athlete-1 (make-athlete "John" "slow"))
(define athlete-2 (make-athlete "Samantha" "fast"))
 

;;expressions
(define competition-1 (make-athlete (athlete-name athlete-1) (athlete-time athlete-1) "fast"))
(define competition-2 (make-athlete (athlete-name athlete-2) (athlete-time athlete-2) "slow"))

;;struct -> struct
;;purpose: show who has the faster time
(define (competition-time a-athlete)
  (cond [(equal? (competition-time a-athlete) "fast" (make-athlete (athlete-name a-athlete) (athlete-time a-athlete) "slow"))]
        [(equal? (competition-time a-athlete) "slow" (make-athlete (athlete-name a-athlete) (athlete-time a-athlete) "fast"))]
        [(equal? (competition-time a-athlete) "not at competition") (error "The athlete wasnt in the competition.")]
        [else (error "There is an error in the competition times.")]))

;;test
(check-expect (competition-time athlete-1) competition-1)
(check-expect (competition-time athlete-2) competition-2)
