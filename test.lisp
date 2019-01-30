(defun memorize (fn)
    (let ((cache (make-hash-table :test #'equal)))
        #'(lambda (&rest args)
              (multiple-value-bind (val win) (gethash args cache)
                  (if win
                      val
                      (setf (gethash args cache)
                          (apply fn args)))))))
n
(defun fib (n)
    (cond
        ((= n 0) 1)
        ((= n 1) 1)
        (t (+ (fib (- n 1))
               (fib (- n 2))))))

(defparameter memorize-fib (memorize #'fib))
