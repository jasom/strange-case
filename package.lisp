;;;; package.lisp

(defpackage #:strange-case
  (:use #:cl))

(defpackage #:strange-case-user
  (:use #:cl)
  (:export *onstartup* *env*))

