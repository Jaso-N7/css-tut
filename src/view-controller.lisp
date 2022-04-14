(in-package :net.html.generator)

;; html 5

(def-std-html :section		t nil)
(def-std-html :article		t nil)
(def-std-html :main		t nil)
(def-std-html :aside		t nil)
(def-std-html :hgroup		t nil)
(def-std-html :header		t nil)
(def-std-html :footer		t nil)
(def-std-html :nav		t nil)
(def-std-html :figure		t nil)
(def-std-html :figcaption 	t nil)

(def-std-html :video	 	t nil)
(def-std-html :audio	 	t nil)
(def-std-html :source	 	t nil)
(def-std-html :track	 	t nil)
(def-std-html :embed	 	t nil)
(def-std-html :mark	 	t nil)
(def-std-html :progress	 	t nil)
(def-std-html :meter	 	t nil)
(def-std-html :time	 	t nil)
(def-std-html :data	 	t nil)
(def-std-html :dialog	 	t nil)
(def-std-html :ruby	 	t nil)
(def-std-html :rt	 	t nil)
(def-std-html :rp	 	t nil)
(def-std-html :bdi	 	t nil)
(def-std-html :wbr		nil nil)
(def-std-html :canvas	 	t nil)
(def-std-html :menuitem	 	t nil)
(def-std-html :details	 	t nil)
(def-std-html :datalist	 	t nil)
(def-std-html :keygen	 	nil nil)
(def-std-html :output	 	t nil)

(defpackage view-controller
  (:documentation "The VC in MVC")
  (:use :cl :net.aserve
	:acl-compat.excl
   :net.html.generator)
  (:import-from :styles
		   :stylesheet))

(in-package :view-controller)

;; Landing page
(publish :path "/"
	 :content-type "text/html"
	 :function
	 #'(lambda (req ent)
	     (with-http-response (req ent)
	       (with-http-body (req ent)
		 (html
		   (:html (:head (:title "CSS3 Tutorial"))
		     (:body
		      (:h1 "CSS3 Tutorial")
		      (:p "Learning from FreeCodeCamp's YT video "
			  ((:a href "https://youtu.be/1Rs2ND1ryYc") "CSS Tutorial - Zero to Hero (Complete Course)"))
		      (:p ((:a href "/zero-to-hero") "View")
			  " the outcome of the lessons."))))))))

;; HTML file used for styling
(publish-file :path "/zero-to-hero" :file "index.html")

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
