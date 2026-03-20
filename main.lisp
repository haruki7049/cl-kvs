(uiop:define-package :kvs/main
  (:use :cl
        :arrow-macros)
  (:export :main))

(in-package :kvs/main)

(defun main ()
  "Entry point for the kvs application"

  (progn
    (let ((v (-> 1 (+ 2 3))))
      (format t "~d~%" v)
      )
    (uiop:quit 0)))
