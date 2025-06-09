def_actuator
	:-	new_frame(actuator),

		new_slot(actuator, status, 'Inactive'),
		new_slot(actuator, stop, stopf),
		new_slot(actuator, reduce, reducef),
		new_slot(actuator, increase, increasef),
		new_slot(actuator, sensor),

		new_demon(soil, status, statd, if_read, before, alter_value),

		print_green('Classe Atuador criada').


create_actuactor(EstufaId, Nome, SensorId)
	:-	new_frame(Nome),

		new_slot(Nome, is_a, actuator),
		new_slot(Nome, is_in, EstufaId),
		new_value(Nome, sensor, SensorId),

		print_green('Novo atuador: ', Nome).


stopf(F) 
	:-	new_value(F, status, 'Inactive'), print_green('Sprinkler stopped').

reducef(F)
	:-	new_value(F, status, 'Reducing'), print_green('Reducing workload').

increasef(F)
	:-	new_value(F, status, 'Increasing'), print_green('Increasing workload').

statd(F, _S, _, T)
	:-	get_value(F, sensor, Sensor),
		get_value(Sensor, status, T).