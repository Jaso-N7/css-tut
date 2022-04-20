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
       :font-size 1.15em
       :font-weight 300
       :font-family "Quicksand" sans-serif
       :linear-gradient "to bottom" ,basestar 0% (rgba 12 20 31 0.4) 100%)
     '((:or input textarea)
       :display block
       :margin 10px)
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
     ;; FLEXBOX
     '(\.container
       :background-color (rgb 250 250 250)
       :color white
       :margin 10px
       :height 300px
       :display flex
       ;; flex-direction: [ *row | column | column-reverse | row-reverse]
       :flex-direction row
       ;; flex-wrap: [ *wrap| nowrap | wrap-reverse ]
       :flex-wrap nowrap
       ;; justify-content: [ *flex-start | flex-end | center | space-between | space-around ]
       :justify-content center
       ;; align-items: [ ... | baseline | stretch ]
       :align-items center)
     '(.container-item
       :background (rgb 36 130 39)
       :font-size 25px
       :text-align center
       :width 70px
       :line-height 50px
       :margin 10px)
     ;; GRID
     `(.grid-container
       :height 500px
       :width 90vw
       :margin 10px
       :background-color ,basestar
       :display grid)
     `(.grid-item
       :color ,basestar
       :font-size 1.25em
       :width 90%
       :line-height 40px
       :margin 10px
       :text-align center)
     '(.grid-item-logo
       :background salmon
       ;; grid-area: [grid-row-start / grid-column-start / grid-row-end / grid-column-end ]
       :grid-area 1 / 1 / 1 / 1)
     '(.grid-item-header
       :background tomato
       :grid-area 1 / 2 / 1 / span 3)
     '(.grid-item-left
       :background lemonchiffon
       :grid-area 2 / 1 / span 2 / 1)
     '(.grid-item-article
       :background lime
       :grid-area 2 / 2 / span 2 / span 2)
     '(.grid-item-right
       :background cornflowerblue
       :grid-area 2 / span 1 / span 2 / 5)
     '(.grid-item-footer
       :background plum
       :grid-column 1 / span 5
       :grid-row-start 4)
     `(\.submit-button
       :margin 20px 20px
       :padding 10px 15px
       :border none
       :font-family "Work Sans" sans-serif
       :color ,basestar
       :background ,cyan
       ;; transition: [property time animation<ease | linear | ease-in-out | ...> delay]
       :transition all 400ms linear
       ;; transform: [translate(x, y) | scale(size) | rotate(angle) | skew ]
       ;; :transform translate 50px 30px
       ;; :transform scale 2.5
       ;; :transform rotate -45deg
       ;; transform: matrix(x-scale, skew-y, skew-x, y-scale, translate-x, translate-y)
       :transform matrix 1 .45 .45 1 100 50
       )
     `((:and .submit-button :hover)
       :background ,pane
       :padding 20px 30px))))

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
