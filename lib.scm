(define (recursive-replace from to expr)
	(if (equal? expr from)
		to
		(if (or (not (list? expr)) (null? expr))
			expr
			(cons (recursive-replace from to (car expr)) (recursive-replace from to (cdr expr))))))

; following are broken
;(define (recursive-replace-many froms tos expr)
;	(if (or (null? froms) (null? tos))
;		expr
;		(recursive-replace-many (cdr froms) (cdr tos) (recursive-replace (car froms) (car tos) expr))))

(define (recursive-replace-which froms tos expr)
	(if (or (null? froms) (null? tos))
		expr
		(if (equal? (car froms) expr)
			(car tos)
			(recursive-replace-which (cdr froms) (cdr tos) expr))))


(define (recursive-replace-many froms tos expr)
	(if (member expr froms)
		(recursive-replace-which froms tos expr)
		(if (or (null? expr) (not (list? expr)))
			expr
			(cons (recursive-replace-many froms tos (car expr)) (recursive-replace-many froms tos (cdr expr))))))


(define (identity-helper args equality expr #!optional (backwards #f))
	(pretty-print equality)
	(let* ((equality (cdr (recursive-replace-many (car args) (cadr args) equality)))
	       (args '())
	       (equality (if backwards (reverse equality) equality)))
		(recursive-replace (car equality) (cadr equality) expr)))

(define-syntax identity
	(syntax-rules ()
		((identity (signature args ...) equality)
			(define (signature args ... expr #!optional (backwards #f)) (identity-helper (list '(args ...) (list args ...)) 'equality expr backwards)))))


(define-syntax lemma
	(syntax-rules ()
		((lemma (signature args ...) equality proof)
			(begin
				(assert (equal? (car (proof (cadr 'equality))) (caddr 'equality))) ; WHY CAR?!
				(identity (signature args ...) equality)))))

(define-syntax step
	(syntax-rules (reversed)
		((step (func args ...))
		 (define expr (func args ... expr #f)))
		((step reversed (func args ...))
		 (define expr (func args ... expr #t)))))

