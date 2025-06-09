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


create_sensor(EstufaId, SensorId, Li, Ls, Lai, Las)
	:-	new_frame(SensorId),

		new_slot(SensorId, is_a, sensor),
		new_slot(SensorId, is_in, EstufaId),
		new_value(SensorId, li, Li),
		new_value(SensorId, ls, Ls),
		new_value(SensorId, lai, Lai),
		new_value(SensorId, las, Las),

		print_green('Novo sensor: ', SensorId).



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
		get_value(F, las, Las).%,
		/*act(T, D).

act(T, D)
	:-	call_method_0().

*/

alterar_li_sensor(Id, Li)
	:-	new_value(Id, li, Li),

		get_value(Id, li, Li),	print_green('Limite inferior alterado para ', Li).

remove_from_estufa(SensorId)
	:-	new_value(SensorId, is_in, []),	print_green('Sensor retirado da estufa: ', SensorId).

apagar_sensor(SensorId)
	:-	delete_frame(SensorId),	print_green('Sensor apagado: ', SensorId).

