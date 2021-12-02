;;; ex 1.1
10                                  ; 10
(+ 5 3 4)                           ; 12
(- 9 1)                             ; 8
(/ 6 2)                             ; 3
(+ (* 2 4) (- 4 6))                 ; 6
(define a 3)                        ; XXX a=3
(define b (+ a 1))                  ; XXX b=4
(+ a b (* a b))                     ; 19
(- a b)                             ; -1
(if (and (> b a) (< b (* a b)))
    b
    a)                              ; 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))                    ; 16 
(+ 2 (if (> b a) b a))              ; 6
(* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1))                         ; 16

;;; ex 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;;; ex 1.3
;; Summe der Quadrate der 3 größten Zahlen von drei
;; (sumquad natural natural natural -> real)
(define (sumquad a b c)
  (cond ((and (< a b) (< a c)) (+ (* b b) (* c c)))
	((and (< b a) (< b c)) (+ (* a a) (* c c)))
	(else (+ (* a a) (* b b)))))

;;; ex 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;; ist b positiv wird a und b addiert
;; ist b negativ oder 0 wird das Vorzeichen von b negiert (also positiv .. und a und b werden addiert

;;; ex 1.5
;; welches Verhalten zeigen Interpreter, die
;; - in der applikativen Reihenfolge auswerten?
;; - in der normalen Reihenfolge auswerten?
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p))
;; Ich vermute, daß ein Interpreter, der in der applikativen Reihenfolge auswertet .. sich aufhängt, da die Funktion sich endlos weiter aufruft.
;; Ein Interpreter, der in der normalen Reihenfolge auswertet, wird nach der Feststellung, daß x=0 ist, die Funktion "erfolgreich" mit 0 verlassen

;;; ex 
