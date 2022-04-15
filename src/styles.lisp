(defpackage styles
  (:documentation "CSS for project")
  (:use :cl :lass)
  (:export #:stylesheet
	   #:homestyle))

(in-package :styles)

(defun stylesheet ()
  "Cascading Style Sheet"
  (lass:compile-and-write
   '((:and h2 :hover)
     :color red)
   '(.subtitle
     :color blue)
   '("#services"
     :color green)))

(defun homestyle ()
  "CSS for introduction page. Using Tron: Legacy pallete from
https://www.colourlovers.com/palette/1406402/Tron_Legacy_2"
  (lass:compile-and-write
   '(body
     :background-color "#0C141F"
     :color "#E6FFFF"
     :font-family "Helvetica, Arial, sans-serif")
   '((:and "#yt-link" :link)
     :color "#DF740C")
   '((:and "#yt-link" :visited)
     :color "#FFE64D")
   '((:and "#tut-link" :link)
     :color "#6FC3DF")
   '((:and "#tut-link" :visited)
     :color "#E6FFFF")))
