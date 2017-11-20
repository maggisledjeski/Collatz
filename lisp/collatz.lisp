#!/usr/bin/sbcl --script

(defvar N)  ;user input for a number
(setf N 0)
(write-line "Enter a number: ")
(setf N (read))
(format t "~D ~%" N)

(defvar num)
(setf num 0)

(loop 
    (if (= (mod N 2) 0)
        (progn
        ;(format t "~D is even." N)
        (setf N (/ N 2))
        (format t "~D~%" N)
        (setf num (+ num 1)))
    )

    (if (= N 1)
        (return N)
    )
    
    (if (= (mod N 2) 1)
        (progn
        ;(format t "~D is odd." N)
        (setf N (+ (* N 3) 1))
        (format t "~D~%" N)
        (setf num (+ num 1)))
    )
    
    (when (= N 1) (return N))
)
(format t "Count of numbers in the sequence: ~D~%" num)
