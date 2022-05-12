(define (cddr s) (cdr (cdr s)))

(define (cadr s) 'YOUR-CODE-HERE)

(define (caddr s) 'YOUR-CODE-HERE)

(define (ordered? s) 'YOUR-CODE-HERE)

(define (square x) (* x x))

(define (pow base exp) 'YOUR-CODE-HERE)


;Q1: Thane of Cadr
(define (cadr s)
    (car (cdr s))
)

(define (caddr s)
    (car (cddr s))
)


;Q2: Ordered
(define (ordered? s)
    (define (helper s pre)
        (cond ((null? s) #t)
              ((> pre (car s)) #f)
              (#t (helper (cdr s) (car s)))
        )
    )
    (helper s -1e10)
)


;Q3: Pow
(define (pow base exp)
    (cond ((= exp 0) 1)
          ((= (modulo exp 2) 0) (pow (square base) (/ exp 2)))
          (#t (* (pow (square base) (quotient exp 2)) base))
    )
)
