def_actuator
	:-	new_frame(actuator),

		new_slot(actuator, status, 'Inactive'),
		new_slot(actuator, value),
		new_slot(actuator, stop, stopf),
		new_slot(actuator, increase, increasef),
		new_slot(actuator, reduce, reducef),
		new_slot(actuator, frases),
		new_slot(actuator, nome),

		print_green('Classe atuador criada').


create_actuactor(Nome)
	:-	new_frame(Nome),

		new_value(Nome, nome, Nome),
		%new_value(Nome, frases, []),

		print_green('Novo atuador: ', Nome).


stopf(F) 
	:-	new_value(F, status, 'Inactive'), print_green('AC stopped').

reducef(F)
	:-	new_value(F, status, frases), print_green('AC is ', frases).

increasef(F)
	:-	new_value(F, status, frases), print_green('AC is ', frases). %[1]

