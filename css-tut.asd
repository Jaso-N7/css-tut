(defsystem "css-tut"
  :version "0.2.0"
  :author ""
  :license ""
  :depends-on ("aserve"
	       "lass"
	       "webactions")
  :components ((:module "src"
                :components
                ((:file "styles")
		 (:file "view-controller"
		  :depends-on ("styles"))
		 (:file "main"
		  :depends-on ("view-controller")))))
  :description ""
  :in-order-to ((test-op (test-op "css-tut/tests"))))

(defsystem "css-tut/tests"
  :author ""
  :license ""
  :depends-on ("css-tut"
	       "cl-quickcheck")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for css-tut"
  ;; :perform (test-op (op c) (symbol-call : :run ))
  )
