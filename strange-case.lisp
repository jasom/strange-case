;;;; strange-case.lisp

(in-package #:strange-case)


;;; "strange-case" goes here. Hacks and glory await!
(defun slurp-stream (stream)
  (apply #'concatenate 'string
         (loop for s = (make-array 1024 :initial-element nil)
               for i = (read-sequence s stream)
               while (> i 0)
               collect (delete nil s))))

(defparameter strange-case-user:*onstartup* (lambda ()))
(defparameter strange-case-user:*env* nil)

(defun main ()
  (setq strange-case-user:*env* (read *standard-input*))
  (emb:register-emb "stdin" (slurp-stream *standard-input*))
  (funcall strange-case-user:*onstartup*))

(defun configure (outfile)
  (load "config.lisp")
  #+sbcl(sb-ext:save-lisp-and-die outfile :executable t :toplevel #'main)
  #+clozure(ccl:save-application
             outfile :toplevel-function #'main
             :prepend-kernel t)
  )
