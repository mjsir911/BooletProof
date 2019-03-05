(load "lib")
(load "identities")

(define expr '
	(∨ (∨ (∨ (∨ (∨ (∨ (∨
	(∧ (∧ (∧ (¬ w) (¬ x)) (¬ y)) (¬ z)) 
	(∧ (∧ (∧ (¬ w) (¬ x))    y)     z ))
	(∧ (∧ (∧ (¬ w) (¬ x))    y)  (¬ z))) ; group 3
	(∧ (∧ (∧ (¬ w)    x)  (¬ y))    z )) ; already proved
	(∧ (∧ (∧ (¬ w)    x)     y)  (¬ z))) ; group 5
	(∧ (∧ (∧    w     x)     y)  (¬ z)))
	(∧ (∧ (∧    w  (¬ x)) (¬ y)) (¬ z)))
	(∧ (∧ (∧    w  (¬ x))    y)     z )))


(lemma (lemma/1 x y)
	(= (∨ (∧ x y) (∧ x (¬ y))) x)
	(lambda expr 
		(identity/∧ 'x
			(commutative/∧ 'x 1
				(inverse/∨ 'y
					(distributive/∨ 'x 'y '(¬ y) expr #t))))))

(step (commutative/∨
	'(∨ (∨ (∨ (∧ (∧ (∧ (¬ w) (¬ x)) (¬ y)) (¬ z)) (∧ (∧ (∧ (¬ w) (¬ x)) y) z )) (∧ (∧ (∧ (¬ w) (¬ x)) y) (¬ z))) (∧ (∧ (∧ (¬ w) x) (¬ y)) z ))
	'(∧ (∧ (∧ (¬ w) x) y) (¬ z))))

(step (commutative/∨ 
	'(∨ (∧ (∧ (∧ (¬ w) (¬ x)) (¬ y)) (¬ z)) (∧ (∧ (∧ (¬ w) (¬ x)) y) z))
	'(∧ (∧ (∧ (¬ w) (¬ x)) y) (¬ z))))

(step (associative/∨ 
	'(∧ (∧ (∧ (¬ w) (¬ x)) y) (¬ z))
	'(∨ (∧ (∧ (∧ (¬ w) (¬ x)) (¬ y)) (¬ z)) (∧ (∧ (∧ (¬ w) (¬ x)) y) z))
	'(∧ (∧ (∧ (¬ w) x) (¬ y)) z)))

(step reversed (associative/∨
	'(∧ (∧ (∧ (¬ w) x) y) (¬ z))
	'(∧ (∧ (∧ (¬ w) (¬ x)) y) (¬ z))
	'(∨ (∨ (∧ (∧ (∧ (¬ w) (¬ x)) (¬ y)) (¬ z)) (∧ (∧ (∧ (¬ w) (¬ x)) y) z)) (∧ (∧ (∧ (¬ w) x) (¬ y)) z))))

(step (associative/∧
	'(¬ w)
	'x
	'y))

(step (associative/∧
	'(¬ w)
	'(∧ x y)
	'(¬ z)))

(step (associative/∧
	'(¬ w)
	'(¬ x)
	'y))

(step (associative/∧
	'(¬ w)
	'(∧ (¬ x) y)
	'(¬ z)))


(step reversed (distributive/∨
	'(¬ w)
	'(∧ (∧ x y) (¬ z))
	'(∧ (∧ (¬ x) y) (¬ z))))

(step (commutative/∧
	'(∧ x y)
	'(¬ z)))

(step (commutative/∧
	'(∧ (¬ x) y)
	'(¬ z)))

(step reversed (distributive/∨
	'(¬ z)
	'(∧ x y)
	'(∧ (¬ x) y)))

(step (commutative/∧
	'(¬ x)
	'y))

(step (commutative/∧
	'x
	'y))

(step (lemma/1
	'y
	'x))

;; wish list:
; (step (associative/∨
; 	'(∧ (¬ w) (∧ (¬ z) y))
; 	'_
; 	'_


(pretty-print expr)
