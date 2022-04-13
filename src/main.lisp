(defpackage css-tut
  (:use :cl :net.aserve)
  (:export #:start
	   #:stop))

(in-package :css-tut)

(let ((webserver nil))
  (defun start (&key (port 80))
    "Starts Portable AllegroServe on PORT"
    (setf webserver (net.aserve:start :port port))
    (format t "~&(Portable) AServe started on :~A~%" port)
    #+unix
    (format t "With PID: ~A~%" (net.aserve::getpid))
    webserver)

  (defun stop (&key (server webserver))
    "Stops the current Portable AllegroServer."
    (net.aserve:shutdown :server server)
    (print "(Portable) Aserve was shutdown.")
    server))

