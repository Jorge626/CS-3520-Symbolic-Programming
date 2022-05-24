(defun flip(n)
  (format t "Your list is: ~a" n)
  (defvar *new-list* nil)
  ; The following is my attempted code. I keep getting errors so I have commented it out
  
  ;(loop for i in n
  ;  do (
  ;       (prog (is-even (/ i 2)))
  ;       (if (= is-even 0)
  ;         (prog (x (+ i 1))
  ;           (push x *new-list*)
  ;           (push i *new-list*)
  ;           )
  ;         )
  ;       )
  ;  )
  ;(format t "Your list flipped: ~a" *new-list*)
)

(flip '(1 2 3 4))

(flip '(1 2 3 4 5))

; Function that removes the i'th element in a list
(defun remove-i (L i)
  (setf (nth (- i 1) L) NIL) ; Sets the i'th element to nil
  (remove nil L) ; Removes nil from list
  (format t "List with element ~a removed: ~a" i L) ; Prints the list
)

(remove-i '(1 2 3 4 5) 2)

(defun product-of-diff (L)
  
)