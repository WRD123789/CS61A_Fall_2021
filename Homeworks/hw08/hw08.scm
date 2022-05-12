(define (my-filter func lst) 'YOUR-CODE-HERE)

(define (interleave s1 s2) 'YOUR-CODE-HERE)

(define (accumulate merger start n term)
  'YOUR-CODE-HERE)

(define (no-repeats lst) 'YOUR-CODE-HERE)

; Q1: MyFilter
(define (my-filter func lst)
    (cond ((null? lst) nil)
          ((list? (car lst))
                  (cons (my-filter func (car lst)) (my-filter func (cdr lst))))
          ((func (car lst)) (cons (car lst) (my-filter func (cdr lst))))
          (#t (my-filter func (cdr lst)))
    )
)


; Q2: interleave
(define (interleave s1 s2)
    (define (helper s1 s2 step)
        (cond ((null? s1) s2)
              ((null? s2) s1)
              ((= (modulo step 2) 0)
                  (cons (car s1) (helper (cdr s1) s2 (+ step 1))))
              (#t (cons (car s2) (helper s1 (cdr s2) (+ step 1))))
        )
    )
    (helper s1 s2 0)
)


; Q3: Accumulate
(define (accumulate merger start n term)
    (cond ((= n 0) start)
          (#t (merger (term n) (accumulate merger start (- n 1) term)))
    )
)


; Q4: No Repeats
(define (no-repeats lst)
    (cond ((null? lst) nil)
          (#t (cons (car lst)
                    (no-repeats (my-filter 
                            (lambda (x) (not (= x (car lst)))) (cdr lst)))))
    )
)