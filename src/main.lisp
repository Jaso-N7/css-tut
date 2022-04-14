(defpackage css-tut
  (:use :cl :net.aserve :view-controller) ; Do I need :net.aserve here?
  (:export #:httpd-up
	   #:httpd-down))

(in-package :css-tut)

(let ((webserver nil))
  (defun httpd-up (&key (port 80))
    "Starts Portable AllegroServe on PORT"
    (setf webserver (net.aserve:start :port port))
    (format t "~&(Portable) AServe started on :~A~%" port)
    #+unix
    (format t "With PID: ~A~%" (net.aserve::getpid))
    webserver)

  (defun httpd-down (&key (server webserver))
    "Stops the current Portable AllegroServer."
    (net.aserve:shutdown :server server)
    (print "(Portable) Aserve was shutdown.")
    server))
