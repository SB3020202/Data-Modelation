def_sensor
	:-	new_frame(sensor),

		new_slot(sensor, li),
		new_slot(sensor, ls),
		new_slot(sensor, lai),
		new_slot(sensor, las),
		new_slot(sensor, detectedValue),
		new_slot(sensor, status),

		new_demon(soil, status, statusd, if_write, before, side_effect),
		new_demon(soil, detectedValue, detectd, if_read, after, alter_value),

		print_green('Classe Sensor criada').

create_sensor_soil(EstufaId)
	:-	new_frame(soil),

		new_slot(soil, is_a, sensor),
		new_slot(soil, is_in, EstufaId),
		new_value(soil, li, 15),
		new_value(soil, ls, 30),
		new_value(soil, lai, 70),
		new_value(soil, las, 85),

		print_green('Sensor soil criado').

create_sensor_co2(EstufaId)
	:-	new_frame(co2),

		new_slot(co2, is_a, sensor),
		new_slot(co2, is_in, EstufaId),
		new_value(co2, li, 15),
		new_value(co2, ls, 30),
		new_value(co2, lai, 70),
		new_value(co2, las, 85),

		print_green('Sensor soil criado').


create_sensor(Nome, Li, Ls, Lai, Las)
	:-	new_frame(Nome),

		new_slot(Nome, is_a, sensor),
		new_value(Nome, li, Li),
		new_value(Nome, ls, Ls),
		new_value(Nome, lai, Lai),
		new_value(Nome, las, Las),

		print_green('Novo sensor: ', Nome).



detectd(F, _S, _, C)
	:-	get_value(F, detectedValue, D),
		get_value(F, li, Li),
		get_value(F, ls, Ls),
		get_value(F, lai, Lai),
		get_value(F, las, Las),
		classify(D, Lai, Li, Ls, Las, C).


classify(D, _, Li, Ls, _,	'comfort')			:- D >= Li, D =< Ls.
classify(D, Lai, _, _, _,	'extremely dry')	:- D < Lai.
classify(D, _, _, _, Las,	'extremely humid')	:- D > Las.
classify(D, Lai, Li, _, _,	'humid')			:- D >= Lai, D < Li.
classify(D, _, _, Ls, Las,	'dry')				:- D >= Ls, D =< Las.



statusd(F, _S, _, T)
	:-	get_value(F, detectedValue, D),
		get_value(F, li, Li),
		get_value(F, ls, Ls),
		get_value(F, lai, Lai),
		get_value(F, las, Las),
		act(T, D).

act(T, D)
	:-	call_method_0().



alterar_li_sensor(Id, Li)
	:-	new_value(Id, li, Li),

		get_value(Id, li, Li),	print_green('Limite inferior alterado para ', Li).

apagar_sensor_soil_estufa
	:-	new_value(soil, is_in, []),	print_green('Sensor soil retirado da estufa').

apagar_sensor_soil
	:-	delete_frame(soil),	print_green('Sensor soil apagado').

