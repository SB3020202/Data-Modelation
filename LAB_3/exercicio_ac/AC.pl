def_ac
	:-	new_frame(ac),

		new_slot(ac, status, 'Inactive'),
		new_slot(ac, temp),
		new_slot(ac, stop, stopf),
		new_slot(ac, warm, warmf),
		new_slot(ac, cool, coolf),

		new_demon(ac, temp, readtd, if_read, after, alter_value),

		print_green('AC created').

stopf(F) 
	:-	new_value(F, status, 'Inactive'), print_green('AC stopped').

coolf(F)
	:-	new_value(F, status, 'cooling'), print_green('AC is heating').

warmf(F)
	:-	new_value(F, status, 'warming'), print_green('AC is cooling').


readtd(F, S, _, T)
	:-	get_value(thermostat, temp, T).
