#!/usr/bin/sbcl --script

(defvar N)  ;user input for a number
(setf N 0)
(write-line "Enter a number: ")
(setf N (read))
(format t "~D ~%" N)

(defvar num)
(defvar direct)
(setf direct N)
(defvar dupF)
(defvar dIndex)
(defvar sIndex)
(defvar small)
(defvar sArray)
(defvar nArray)
(setf sArray (make-array '(10)))
(setf nArray (make-array '(10)))

(dotimes (i 10)
    (setf (aref sArray i) 0)
    (setf (aref nArray i) 0)
)

(loop while (> direct 1) do
    (setf N direct)
    (setf num 0)
    (loop while (> N 1) do
        (cond ((= (mod N 2) 0)
        (setf N (/ N 2)))
        (t (setf N (+ 1 (* N 3)))))
        (setf num (+ num 1))
    )
    (setf N direct)
    (setf dupF 0)
    (setf dIndex 0)
    (setf sIndex 0)
    (setf small (aref sArray 0))
    (dotimes (i 10)
        (if (< (aref sArray i) small)
            (progn
                (setf small (aref sArray i))
                (setf sIndex i)
            )
        )
        (if (= (aref sArray i) num)
            (progn
                (setf dupF 1)
                (setf dIndex i)
            )
        )
    )
    (if (and (> num (aref sArray sIndex)) (= dupF 0))
        (progn
            (setf (aref sArray sIndex) num)
            (setf (aref nArray sIndex) N)
        )
    )
    (if (and (< N (aref nArray dIndex)) (= dupF 1))
            (setf (aref nArray dIndex) N)
    )           
    (setf direct (- direct 1))
)

(dotimes (i 10)
    (format t "~D    ~D~%" (aref nArray i) (aref sArray i))
)    

