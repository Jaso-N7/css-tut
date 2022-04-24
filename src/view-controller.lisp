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
		      (:ol (:li ((:a id "tut-link" href "/zero-to-hero") "View the lessons."))
			   (:li "Section 10: " ((:a id "tut-link" href "/challenge") "Final Exam & Challenge"))))))))))

;; HTML -- Path to external HTML files
(let ((htdocs (append (pathname-directory view-controller::*current-dir*)
		      '("html"))))
  (publish-file :path "/zero-to-hero"
		:file (make-pathname :directory htdocs
				     :name "lessons"
				     :type "html"))
  (publish-file :path "/challenge"
		:file (make-pathname :directory htdocs				   
				     :name "index"
				     :type "html")))


;; CSS -- Path to stylesheets
(publish :path "/main.css" :content-type "text/css; charset=utf-8"
	 :function
	 #'(lambda (r e)
	     (with-http-response (r e :format :text)
	       (with-http-body (r e)
		 (princ (funcall #'challenge) *html-stream*)))))
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

;;; ASSETS
;; Images used in web page
(let ((assets (append (pathname-directory view-controller::*current-dir*)
		      '("img"))))
  (publish-file :path "/img-1.png"
		:file
		(make-pathname :directory assets			     
			       :name "img-1"
			       :type "png"))
  (publish-file :path "/img-2.png"
		:file
		(make-pathname :directory assets
			       :name "img-2"
			       :type "png"))
  (publish-file :path "/assets/img-1.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-1"
			       :type "jpg"))
  (publish-file :path "/assets/img-2.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-2"
			       :type "jpg"))
  (publish-file :path "/assets/img-3.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-3"
			       :type "jpg"))
  (publish-file :path "/assets/img-4.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-4"
			       :type "jpg"))
  (publish-file :path "/assets/img-5.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-5"
			       :type "jpg"))
  (publish-file :path "/assets/img-6.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-6"
			       :type "jpg"))
  (publish-file :path "/assets/img-7.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-7"
			       :type "jpg"))
  (publish-file :path "/assets/img-8.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-8"
			       :type "jpg"))
  (publish-file :path "/assets/img-9.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-9"
			       :type "jpg"))
  (publish-file :path "/assets/img-10.jpg"
		:file
		(make-pathname :directory assets
			       :name "img-10"
			       :type "jpg")))
