;;;; strange-case.asd

(asdf:defsystem #:strange-case
  :serial t
  :depends-on (#:cl-emb)
  :components ((:file "package")
               (:file "strange-case")))

