def_alarm
	:	new_frame(alarm),

		new_slot(alarm, event),
		new_slot(alarm, temp),
		new_slot(alarm, date),
		new_slot(alarm, count, 0),

		new_relation(is_a, transitive, all, nil),

		print_green('Alarm created').


genmsg(T, E, D)
	:-	genname(N),
		new_frame(N),

		new_slot(N, is_a, alarm),
		new_value(N, event, E),
		new_value(N, temp, T),
		new_value(N, date, D).
		
		print_green('New alarm: ', N).

genname(N)
	:-	get_value(alarm,count,A),
		A1 is A + 1,
		new_value(alarm,count,A1),
		atom_concat(alarm,A1,N).