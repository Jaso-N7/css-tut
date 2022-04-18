(defpackage styles
  (:documentation "CSS for project")
  (:use :cl :lass)
  (:export #:stylesheet
	   #:homestyle))

(in-package :styles)

(defun stylesheet ()
  "Cascading Style Sheet."
  (let ((orange "rgb(223,116,12)")
	(sweet-yellow "rgb(255,230,77)")
	(pane "rgb(230,255,255)")
	(cyan "rgb(111,195,223)")
	(basestar "rgb(12,20,31)"))
     
    (lass:compile-and-write
     '(html :font-size 100%)		; 16px?
     `(body
       :color ,cyan
       :text-align justify
       :font-size 1.15e m
       :font-weight 300
       :font-family "Quicksand" sans-serif
       :background-color ,basestar
       :linear-gradient "to bottom" ,basestar 0% (rgba 12 20 31 0.4) 100%)
     '((:or "#title" .subtitle)
       :font-family "Work Sans" sans-serif
       ;; :text-transform uppercase
       :text-align center)
     `("#title"
       :color ,orange
       :font-weight 600
       :font-size 3.052rem
       :text-transform uppercase)
     `(.subtitle
       :color ,sweet-yellow
       :font-weight 400
       :font-size 2.441rem
       :text-decoration underline)
     `("#service-image"
       :height 400px
       :width 70vw
       :border 4px dashed ,pane
       ;; :linear-gradient "to bottom right" (rgb 94 255 126) 0% (rgba 94 255 126 0) 100%
       :radial-gradient circle farthest-side center red 20% blue 40% green 60%)
     `(.link
       :color ,pane
       :text-decoration none)
     '(.italics
       :font-style oblique)
     ;; Content size are affected by height and width
     `("#about-us-image"
       :height 300px
       :width 60%
       :border 6px solid ,pane
       :margin 10px 50px
       :float left)
     '(.site-table
       :display inline-block)
     '(.container
       :background-color (rgb 250 250 250)
       :margin 10px
       :display flex
       ;; default: row. Other options are column, column-reverse, row-reverse
       :flex-direction row-reverse
       ;; options include wrap, nowrap, wrap-reverse
       :flex-wrap wrap-reverse)
     '(.container-item
       :background (rgb 36 130 39)
       :font-size 25px
       :text-align center
       :width 70px
       :line-height 50px
       :margin 10px))))

(defun homestyle ()
  "CSS for introduction page. Using Tron: Legacy pallete from
https://www.colourlovers.com/palette/1406402/Tron_Legacy_2"
  (lass:compile-and-write
   '(body
     :background-color "#0C141F"
     :color "#E6FFFF"
     :font-family "Helvetica, Arial, sans-serif")
   '(h1
     :color "#FFE64D"
     :text-transform uppercase)
   '((:or "#yt-link" "#tut-link")
     :text-decoration none)
   '((:and "#yt-link" :link)
     :color "#DF740C")
   '((:and "#yt-link" :visited)
     :color "#FFE64D")
   '((:and "#tut-link" :link)
     :color "#6FC3DF")
   '((:and "#tut-link" :visited)
     :color "#E6FFFF")))
