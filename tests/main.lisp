(defpackage css-tut/tests/main
  (:use :cl
        :css-tut
        :rove))
(in-package :css-tut/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :css-tut)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
