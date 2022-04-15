(define (rle s)
  (define (helper s prev cnt )
    (if (null? s) (cons-stream (list prev cnt) nil)
      (if (= (car s) prev) (helper (cdr-stream s) (car s) (+ cnt 1) ) 
        (cons-stream (list prev cnt) (helper (cdr-stream s) (car s) 1 ))
      )
    )
  )
  (if (null? s) (list )
    (helper s (car s) 0)
  )
)



(define (group-by-nondecreasing s)
  (define (helper s prev bracket)
    (if (null? s) (cons-stream bracket nil)
      (if (>= (car s) prev) (helper (cdr-stream s) (car s) (append bracket (list (car s))))
        (cons-stream bracket (helper (cdr-stream s) (car s) (list (car s))))
      )
    )
  )
  (helper s (car s) (list ))
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

