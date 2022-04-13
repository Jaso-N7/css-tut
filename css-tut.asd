(defsystem "css-tut"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("aserve"
	       "lass"
	       "webactions")
  :components ((:module "src"
                :components
                ((:file "main"))))
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
