# BooletProof Assistant
=======================
A boolean algebra proof assistant


This library will allow one to run pre-defined identities on an s-expression,
allowing for zero-mistake proofs.

## How to use

Translate an expression with supplied identity

```scheme
(commutative/∧ 'x 'y '(∧ x y)) ; -> (∧ y x)
```

Define a base identity (all boolean algebra identites are already defined)

```scheme
(identity (my-custom-identity 'x 'y 'z
	(= (∨ 'x (∨ 'y 'z)) (∨ 'z (∨ 'y 'x)))))
```

Define a lemma based off of existing identities

```
(lemma (lemma/1 x y)
	(= (∨ (∧ x y) (∧ x (¬ y))) x)
	(lambda expr
		(identity/∧ 'x
			(commutative/∧ 'x 1
				(inverse/∨ 'y
					(distributive/∨ 'x 'y '(¬ y) expr #t))))))
```
