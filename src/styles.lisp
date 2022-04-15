(defpackage styles
  (:documentation "CSS for project")
  (:use :cl :lass)
  (:export #:stylesheet
	   #:homestyle))

(in-package :styles)

(defun stylesheet ()
  "Cascading Style Sheet"
  (let ((orange "rgb(223,116,12)")
	(sweet-yellow "rgb(255,230,77)")
	(pane "rgb(230,255,255)")
	(cyan "rgb(111,195,223)")
	(basestar "rgba(12,20,31, .4)"))
     
    (lass:compile-and-write
     `(body
       :background-color ,basestar
       :color ,cyan)
     `("#title"
       :color ,orange)
     `(.subtitle
       :color ,sweet-yellow)
     '("#service-image"
       :height 400px
       :width 70%
       :background-image (url "/img-2.png")
       :background-size cover
       :background-color (rgba 12 20 31 .4)))))

(defun homestyle ()
  "CSS for introduction page. Using Tron: Legacy pallete from
https://www.colourlovers.com/palette/1406402/Tron_Legacy_2"
  (lass:compile-and-write
   '(body
     :background-color "#0C141F"
     :color "#E6FFFF"
     :font-family "Helvetica, Arial, sans-serif")
   '(h1 :color "#FFE64D")
   '((:and "#yt-link" :link)
     :color "#DF740C")
   '((:and "#yt-link" :visited)
     :color "#FFE64D")
   '((:and "#tut-link" :link)
     :color "#6FC3DF")
   '((:and "#tut-link" :visited)
     :color "#E6FFFF")))
