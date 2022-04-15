(defpackage view-controller
  (:documentation "The VC in MVC")
  (:use :cl :net.aserve
	:acl-compat.excl
   :net.html.generator)
  (:import-from :styles
		#:stylesheet
		#:homestyle))

(in-package :view-controller)

;; DATA DEFINITIONS

(defvar *current-dir* (asdf:system-relative-pathname "css-tut" "src/"))

;; Landing page
(publish :path "/"
	 :content-type "text/html"
	 :function
	 #'(lambda (req ent)
	     (with-http-response (req ent)
	       (with-http-body (req ent)
		 (html
		   (:html (:head (:title "CSS3 Tutorial")
				 ((:link rel "stylesheet"
					 type "text/css"
					 href "/home.css")))
		     (:body
		      (:h1 "CSS3 Tutorial")
		      (:p "Learning from FreeCodeCamp's YT video "
			  ((:a id "yt-link"
			       href "https://youtu.be/1Rs2ND1ryYc") "CSS Tutorial - Zero to Hero (Complete Course)"))
		      (:p ((:a id "tut-link" href "/zero-to-hero") "View")
			  " the outcome of the lessons."))))))))

;; HTML file used for styling
(publish-file :path "/zero-to-hero"
	      :file (make-pathname :directory (pathname-directory view-controller::*current-dir*)
				   :name "index"
				   :type "html"))

;; Images used in web page
(publish-file :path "/img-1.png" :file "img/img-1.png")
(publish-file :path "/img-2.png" :file "img/img-2.png")

;; Path to the CSS file
(publish :path "/style.css" :content-type "text/css; charset=utf-8"
	 :function
	 #'(lambda (r e)
	     (with-http-response (r e :format :text)
	       (with-http-body (r e)
		 (princ (funcall #'stylesheet) *html-stream*)))))

(publish :path "/home.css" :content-type "text/css; charset=utf-8"
	 :function
	 #'(lambda (r e)
	     (with-http-response (r e :format :text)
	       (with-http-body (r e)
		 (princ (funcall #'homestyle) *html-stream*)))))
