#lang htdp/bsl
(require 2htdp/image)

;; DATA DEFINITIONS
;;structure for an applicant
;;an applicant is a structure that has
;;a name is a string that represents the applicants name
;;a position is a string that represents a position of the applicant in the firm
;;a status is a string that represents a application status of a given applicant
(define-struct applicant (name position status))

;;Function 1

;;SAMPLE VALUES AND EXPRESSIONS
(define applicant-1 (make-applicant "Tijiana" "Developer" "interviewed"))
(define applicant-2 (make-applicant "Jazmin" "HR" "received"))
(define applicant-3 (make-applicant "Oliwia" "CEO" "contacted"))
(define applicant-4 (make-applicant "Skye" "Developer" "under review"))

;;Expressions
;;the way you extract the components is (structurename-fieldname of-what?)
(define upgrade-1 (make-applicant (applicant-name applicant-1) (applicant-position applicant-1) "hired"))
(define upgrade-2 (make-applicant (applicant-name applicant-2) (applicant-position applicant-2) "under review"))
(define upgrade-3 (make-applicant (applicant-name applicant-3) (applicant-position applicant-3) "interview"))
(define upgrade-4 (make-applicant (applicant-name applicant-4) (applicant-position applicant-4) "contacted"))

;;struct -> struct
;;purpose: upgrade the application status
(define (upgrade-status a-applicant)
  (cond [(equal? (applicant-status a-applicant) "received") (make-applicant (applicant-name a-applicant) (applicant-position a-applicant) "under review")]
        [(equal? (applicant-status a-applicant) "under review") (make-applicant (applicant-name a-applicant) (applicant-position a-applicant) "contacted")]
        [(equal? (applicant-status a-applicant) "contacted") (make-applicant (applicant-name a-applicant) (applicant-position a-applicant) "interview")]
        [(equal? (applicant-status a-applicant) "interviewed") (make-applicant (applicant-name a-applicant) (applicant-position a-applicant) "hired")]
        [(equal? (applicant-status a-applicant) "hired") (error "The applicant is already hired.")]
        [else (error "There is an error in the application.")]))

;;Test
(check-expect (upgrade-status applicant-1) upgrade-1)
(check-expect (upgrade-status applicant-2) upgrade-2)
(check-expect (upgrade-status applicant-3) upgrade-3)
(check-expect (upgrade-status applicant-4) upgrade-4)

;;Test On Other Values
(check-expect (upgrade-status (make-applicant "Allyson" "Student" "received")) (make-applicant "Allyson" "Student" "under review"))

;;Function 2

;;Sample values and expressions
(define applicant-5 (make-applicant "Tijiana" "Developer" "interviewed"))
(define applicant-6 (make-applicant "Jazmin" "HR" "received"))
(define applicant-7 (make-applicant "Oliwia" "CEO" "contacted"))
(define applicant-8 (make-applicant "Skye" "Developer" "under review"))

;;Expressions
(define reject-1 (make-applicant (applicant-name applicant-1) (applicant-position applicant-1) "rejected"))
(define reject-2 (make-applicant (applicant-name applicant-2) (applicant-position applicant-2) "rejected"))
(define reject-3 (make-applicant (applicant-name applicant-3) (applicant-position applicant-3) "rejected"))
(define reject-4 (make-applicant (applicant-name applicant-4) (applicant-position applicant-4) "rejected"))

;;struct ->reject
;;purpose: Reject the application
(define (reject a-applicant)
                (make-applicant (applicant-name a-applicant) (applicant-position a-applicant) "rejected"))

;;test with Sample expressions
(check-expect (reject applicant-5) reject-1)
(check-expect (reject applicant-6) reject-2)
(check-expect (reject applicant-7) reject-3)
(check-expect (reject applicant-8) reject-4)


;;test with random applicants
(check-expect (reject (make-applicant "Abby" "HR" "hired")) (make-applicant "Abby" "HR" "rejected"))
(check-expect (reject (make-applicant "Tijiana" "HR" "under review")) (make-applicant "Tijiana" "HR" "rejected"))
(check-expect (reject (make-applicant "Andres" "developer" "hired")) (make-applicant "Andres" "developer" "rejected"))

                