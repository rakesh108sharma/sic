#lang scheme
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

;;; eigen quadrat Funktion
; (quadrat (real -> real))
(define (quadrat x)
  (* x x))

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
;(test 0 (p))
;; Ich vermute, daß ein Interpreter, der in der applikativen Reihenfolge auswertet .. sich aufhängt, da die Funktion sich endlos weiter aufruft.
;; Ein Interpreter, der in der normalen Reihenfolge auswertet, wird nach der Feststellung, daß x=0 ist, die Funktion "erfolgreich" mit 0 verlassen



;;; Quadratwurzeln berechnen
; testen ob der schaetzwert gut genug ist oder verbessert werden muß
; (wurzel-iter (real real -> real))
(define (wurzel-iter schaetzwert x)
  (if (gut-genug? schaetzwert x)
      schaetzwert
      (wurzel-iter (verbessern schaetzwert x)
                   x)))

; schaetzwert wird verbessert indem man den Mittelwert aus x + x/schaetzwert ermittelt
; (verbessern (real real -> real))
(define (verbessern schaetzwert x)
  (mittelwert schaetzwert (/ x schaetzwert)))
; wobei
(define (mittelwert x y)
  (/ (+ x y) 2))

; der schaetzwert ist gut genug, wenn der schaetzwert weniger als 0.001 von x abweicht
; (gut-genug? (real real -> boolean))
(define (gut-genug? schaetzwert x)
  (< (abs (- (quadrat schaetzwert) x)) 0.001))

; nun folgt unsere wurzel Funktion
; (wurzel (real -> real))
(define (wurzel x)
  (wurzel-iter 1.0 x))