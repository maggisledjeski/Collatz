#!/usr/bin/sbcl --script

(defvar N)  ;user input for a number
(setf N 0)
(write-line "Enter a number: ")
(setf N (read))
(format t "~D ~%" N)

(if (= (mod N 2) 0)
    (progn
    (format t "~D is even.~%" N)))

(if (= (mod N 2) 1)
    (progn
    (format t "~D is odd.~%" N)))
