(require 'dash)
(require 's)

(defun M-string? (arg)
    (-> arg stringp))

(defun M-integer? (arg)
    (-> arg integerp))

(defun M-list? (arg)
    (-> arg listp))

(defun M-symbol? (arg)
    (-> arg symbolp))

(defun M-class (arg)
    (cond
        (
            (-> arg M-string?)
            'string)
        (
            (-> arg M-integer?)
            'integer)
        (
            (-> arg M-list?)
            'list)
        (
            (-> arg M-symbol?)
            'symbol)))

(defun M-to-sym (arg)
    (cond
        (
            (eq (-> arg M-class) 'string)
            (-> arg intern))))

(defun M-to-s (arg &rest opt)
    (cond
        (
            (-> arg integerp)
            (cond
                (
                    (eq opt 'char)
                    (-> arg char-to-string))
                (
                    t
                    (->> arg (format "%d")))))))

(defun M-to-l (arg)
    (cond
        (
            (-> arg stringp)
            (--> arg (s-split "" it) (-remove-item "" it)))))

(defun M-to-i (arg)
    (cond
        (
            (-> arg stringp)
            (-> arg string-to-char))))


(provide 'Minatohasi)
