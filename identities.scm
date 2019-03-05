(load "lib.scm")

(identity (identity/∧ x) (= (∧ 1 x) x))
(identity (identity/∨ x) (= (∨ 0 x) x))

(identity (dominance/∧ x) (= (∧ 0 x) 0))
(identity (dominance/∨ x) (= (∨ 1 x) 1))

(identity (idempotent/∧ x) (= (∧ x x) x))
(identity (idempotent/∨ x) (= (∨ x x) x))

(identity (inverse/∧ x) (= (∧ x (¬ x)) 0))
(identity (inverse/∨ x) (= (∨ x (¬ x)) 1))

(identity (commutative/∧ x y) (= (∧ x y) (∧ y x)))
(identity (commutative/∨ x y) (= (∨ x y) (∨ y x)))

(identity (associative/∧ x y z) 
	(=
		(∧ (∧ x y) z)
		(∧ x (∧ y z))))
(identity (associative/∨ x y z)
	(= 
		(∨ (∨ x y) z)
		(∨ x (∨ y z))))

(identity (distributive/∧ x y z) 
	(= 
		(∨ x (∧ y z))
		(∧ (∨ x y) (∨ x z))))
(identity (distributive/∨ x y z) 
	(= 
		(∧ x (∨ y z))
		(∨ (∧ x y) (∧ x z))))

(identity (absorption/∧ x y) (= (∧ x (∨ x y)) x))
(identity (absorption/∨ x y) (= (∨ x (∧ x y)) x))

(identity (demorgans/∧ x y) (= (¬ (∧ x y)) (∨ (¬ x) (¬ y))))
(identity (demorgans/∨ x y) (= (¬ (∨ x y)) (∧ (¬ x) (¬ y))))
