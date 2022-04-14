(defpackage styles
  (:documentation "CSS for project")
  (:use :cl :lass))

(in-package :styles)

(defun style1 ()
  "Lesson 1 CSS"
  (lass:compile-and-write)
  '(body
    :margin 0
    :padding 0
    :border 0))
