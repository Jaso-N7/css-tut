(defpackage styles
  (:documentation "CSS for project")
  (:use :cl :lass)
  (:export #:stylesheet))

(in-package :styles)

(defun stylesheet ()
  "Cascading Style Sheet"
  (lass:compile-and-write
   '(body
     :margin 0
     :padding 0
     :border 0)))
