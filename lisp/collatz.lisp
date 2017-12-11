#!/usr/bin/sbcl --script

(defvar N)  ;user input that is the highest sequence number tested
(setf N 0)
(write-line "Enter a number: ") ;prompts user
(setf N (read)) ;stores the user input in N

(defvar control)    ;variable that controls when the all of the sequence numbers have been tested
(setf control N)
(defvar num)    ;stores the step count
(defvar dupF)   ;duplicate flag
(defvar dIndex) ;duplicate index
(defvar sIndex) ;smallest index
(defvar small)  ;smallest step count in sArray
(defvar sArray)
(defvar nArray)
(defvar size 10)    ;size of sArray and nArray
(defvar temp)   ;holds a temporary number
(defvar temp2)  ;holds a temporary number
(setf sArray (make-array '(10)))    ;array that holds 10 step counts
(setf nArray (make-array '(10)))    ;array that holds 10 sequence count numbers

;fills the arrays with 0's
(dotimes (i 10)
    (setf (aref sArray i) 0)
    (setf (aref nArray i) 0)
)

;uses the control variable to stop the while loop until every sequence number starting from N is tested
(loop while (> control 1) do
    (setf N control)    ;sets N to the control (current sequence number), to make sure the current sequence number is being tested
    (setf num 0)    ;sets the step count to 0
    
    ;computes the sequence count until N = 1
    (loop while (> N 1) do
        (cond ((= (mod N 2) 0)  ;tests if N is even
        (setf N (/ N 2)))   ;sets N to N/2
        (t (setf N (+ 1 (* N 3))))) ;N is odd and N is set to 3*N+1
        (setf num (+ num 1))    ;increment step count
    )
    (setf N control)    ;resets input to be equal to the current sequence number
    (setf dupF 0)   ;sets the duplicate flag to false
    (setf dIndex 0) ;index of a number with a duplicate step count
    (setf sIndex 0) ;index with the smallest number of steps
    (setf small (aref sArray 0))    ;number with the smallest step count
    
    ;goes through the array numbers to see which element has the smallest step count and if there are duplicate sequence numbers with the same step count
    (dotimes (i 10)
        (if (< (aref sArray i) small)   ;checks to see which element has the smallest step count
            (progn
                (setf small (aref sArray i))    ;reassigns the number with the smallest number of steps
                (setf sIndex i) ;saves the index with the smallest number of steps
            )
        )
        (if (= (aref sArray i) num) ;checks to see if there is a number in the array with the same step count as the current sequence number
            (progn
                (setf dupF 1)   ;sets the duplicate flag to true
                (setf dIndex i) ;saves the index where the duplicate step count occurs
            )
        )
    )

    ;if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
    ;a duplicate replace the information at the smallest index to match the current sequence number
    (if (and (> num (aref sArray sIndex)) (= dupF 0))
        (progn
            (setf (aref sArray sIndex) num)
            (setf (aref nArray sIndex) N)
        )
    )

    ;if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
    ;at the duplicate index to the current sequence number
    (if (and (< N (aref nArray dIndex)) (= dupF 1))
            (setf (aref nArray dIndex) N)
    )           
    (setf control (- control 1))    ;decrement the sequence number
)

;Sorted by the step count
(format t "Sorted by step count size:~%")
(dotimes (i size)
    (dotimes (x (- size 1))
        (if (< (aref sArray x) (aref sArray (+ x 1)))
            (progn
                (setf temp (aref sArray x))
                (setf temp2 (aref nArray x))
                (setf (aref sArray x) (aref sArray (+ x 1)))
                (setf (aref nArray x) (aref nArray (+ x 1)))
                (setf (aref sArray (+ x 1)) temp)
                (setf (aref nArray (+ x 1)) temp2)
            )
        )
    )
)

;prints the numbers array to show the sequence number and the step count for that sequence number
(dotimes (i 10)
    (format t "~D    ~D~%" (aref nArray i) (aref sArray i))
)    

;Sorted by the sequence number
(format t "Sorted by sequence number size:~%")
(dotimes (i size)
    (dotimes (x (- size 1))
        (if (< (aref nArray x) (aref nArray (+ x 1)))
            (progn
                (setf temp (aref nArray x))
                (setf temp2 (aref sArray x))
                (setf (aref nArray x) (aref nArray (+ x 1)))
                (setf (aref sArray x) (aref sArray (+ x 1)))
                (setf (aref nArray (+ x 1)) temp)
                (setf (aref sArray (+ x 1)) temp2)
            )
        )
    )
)

;prints the numbers array to show the sequence number and the step count for that sequence number
(dotimes (i 10)
    (format t "~D    ~D~%" (aref nArray i) (aref sArray i))
)
