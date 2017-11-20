#!/usr/bin/sbcl --script

(defvar N)  ;user input for a number
(setf N 0)
(write-line "Enter a number: ")
(setf N (read))
(format t "~D ~%" N)

(loop 
    (if (= (mod N 2) 0)
        (progn
        ;(format t "~D is even." N)
        (setf N (/ N 2))
        (format t "~D~%" N))
    )

    (if (= N 1)
        (return N)
    )
    
    (if (= (mod N 2) 1)
        (progn
        ;(format t "~D is odd." N)
        (setf N (+ (* N 3) 1))
        (format t "~D~%" N))
    )
    
    (when (= N 1) (return N))
)
