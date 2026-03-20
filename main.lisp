(uiop:define-package :kvs/main
    (:use :cl)
  (:export :main))

(in-package :kvs/main)

(defclass value ()
  ())

(defgeneric to-string (v))

(defclass value-string (value)
  ((v
    :type string
    :initarg :v
    :accessor v)))

(defclass value-integer (value)
  ((v
    :type integer
    :initarg :v
    :accessor v)))

(defclass value-float (value)
  ((v
    :type float
    :initarg :v
    :accessor v)))

(defclass value-symbol (value)
  ((v
    :type symbol
    :initarg :v
    :accessor v)))

(defclass value-vector (value)
  ((v
    :type (vector value)
    :initarg :v
    :accessor v)))

(defmethod to-string ((str value-string))
  (format nil "~s" (v str)))

(defmethod to-string ((int value-integer))
  (format nil "~d" (v int)))

(defmethod to-string ((float value-float))
  (format nil "~F" (v float)))

(defmethod to-string ((sym value-symbol))
  (format nil "~A" (v sym)))

(defmethod to-string ((vec value-vector))
  (let ((string-list
          (loop for item across (v vec)
                collect (to-string item))))
    (format nil "[~{~A~^, ~}]" string-list)))

(defclass key ()
  ((inner
    :type string
    :initarg :inner
    :accessor inner)))

(defclass record ()
  ((k
    :type k
    :initarg :k
    :accessor k)
   (v
    :type value
    :initarg :v
    :accessor v)))

(defclass database ()
  ((inner
    :type (vector value)
    :initarg :inner
    :accessor inner
    :initform (make-array 0
                          :fill-pointer 0
                          :element-type 'value
                          :adjustable t))))

(defun main ()
  "Entry point for the kvs application"

  (progn
    (defvar *db* (make-instance 'database))

    (defvar *new-v* (make-instance 'value-vector
                                   :v (make-array 5
                                                  :fill-pointer 5
                                                  :element-type 'value
                                                  :adjustable t
                                                  :initial-element (make-instance 'value-integer :v 8))))

    (vector-push-extend *new-v* (inner *db*))
    (vector-push-extend *new-v* (inner *db*))
    (vector-push-extend *new-v* (inner *db*))
    (vector-push-extend *new-v* (inner *db*))
    (vector-push-extend *new-v* (inner *db*))

    (map 'vector
         (lambda (item)
           (format t "~s~%" (to-string item)))
         (inner *db*))

    (uiop:quit 0))
  )
