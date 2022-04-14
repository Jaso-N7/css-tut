(defpackage styles
  (:documentation "CSS for project")
  (:use :cl :lass)
  (:export #:stylesheet))

(in-package :styles)

(defun stylesheet ()
  "Cascading Style Sheet"
  (lass:compile-and-write
   '(h2
     :color red)
   '(.subtitle
     :color blue)
   '("#services"
     :color green)))
