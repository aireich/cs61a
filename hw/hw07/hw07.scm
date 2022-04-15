(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (sign num) 
 (if (< num 0)
     -1
     (if (= num 0)
       0
       1
     )
 )
)

(define (square x) (* x x))

(define (pow x y) 
  (define (even-power x y result)
      (if (= y 0)
        result
        (if (even? y)
          (* result (square (even-power x (/ y 2) result)))
          ( * result (* x (square (even-power x ( / (- y 1) 2) result))))
      )
    ) 
  )
  (even-power x y 1)
    
)

(define (unique s)
   (if (null? s) nil
     (cons (car s) (unique (filter (lambda (x) (not (eq? x (car s)))) (cdr s))))
   )
)

(define (replicate x n) 
  (define (replicate-helper x n p)
    (if (= n 0)
      p
      (replicate-helper x (- n 1) (append p (list x)))
    )
  )
  (replicate-helper x n (list))
)

(define (accumulate combiner start n term)
  (define (accumulate-helper combiner start n term prev current)
    (if (= current n)
      prev
      (accumulate-helper combiner start n term (combiner prev (term (+ current 1))) (+ current 1))
    )
  )
  (accumulate-helper combiner start n term start 0)
)

(define (accumulate-tail combiner start n term)
  (define (accumulate-helper combiner start n term prev current)
    (if (= current n)
      prev
      (accumulate-helper combiner start n term (combiner prev (term (+ current 1))) (+ current 1))
    )
  )
  (accumulate-helper combiner start n term start 0)
)

(define-macro
 (list-of map-expr for var in lst if filter-expr)
 `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)
