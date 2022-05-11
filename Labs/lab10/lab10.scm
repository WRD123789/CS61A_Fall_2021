(define (over-or-under num1 num2) 'YOUR-CODE-HERE)

(define (make-adder num) 'YOUR-CODE-HERE)

(define (composed f g) 'YOUR-CODE-HERE)

(define lst 'YOUR-CODE-HERE)

(define (remove item lst) 'YOUR-CODE-HERE)

; Q2: Over or Under
;   Using if
(define (over-or-under num1 num2)
    (if (< num1 num2)
        -1
        (if (= num1 num2)
            0
            1)))

;   Using cond
(define (over-or-under num1 num2)
    (cond 
          ((< num1 num2) -1)
          ((= num1 num2) 0)
          ((> num1 num2) 1)))


; Q3: Make Adder
(define (make-adder num)
    (lambda (inc) (+ num inc)))


; Q4: Compose
(define (composed f g)
    (lambda (x) (f (g x))))


; Q5: Make a List
; /1
(define lst
    (list (list 1) 2 (list 3 4) 5))

; /2
(define lst
    '((1) 2 (3 4) 5))

; /3
(define lst
    (cons '(1)
          (cons 2
                (cons '(3 4) '(5)))))


; Q6: Remove
; Not use of filter
(define (remove item lst)
    (cond 
          ((null? lst) nil)
          ((= (car lst) item) (remove item (cdr lst)))
          (#t (cons (car lst) 
                    (remove item (cdr lst))))))

; Using filter
(define (remove item lst)
    (filter (lambda (x) (not (= x item))) lst))