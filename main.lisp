(uiop:define-package :kvs/main
  (:use :cl)
  (:export :main))

(in-package :kvs/main)

(defun main ()
  "Entry point for the kvs application"

  (progn
    (uiop:quit 0)))
