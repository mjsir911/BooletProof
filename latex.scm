(define (prefix->infix expr)
	(if (not (list? expr))
		expr
		(if (= (length expr) 2)
			expr ; unary
			(list (prefix->infix (cadr expr)) (car expr) (prefix->infix (caddr expr))))))

(define (expr->latex expr)
	(if (null? expr)
		expr
		(if (not (list? expr))
			(symbol->string expr)
			(cons (expr->latex (car expr)) (expr->latex (cdr expr))))))

(define (latex-print expr funcname)
	(display "&= ")
	(display (expr->latex (prefix->infix expr)))
	(display " &\\text{")
	(display funcname)
	(display "}\\\\")
	(newline))

