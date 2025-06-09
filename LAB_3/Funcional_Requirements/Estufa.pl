def_sistema
	:-	new_relation(is_a, transitive, all, nil),
		new_relation(is_in, transitive, inclusion([localizacao]), nil),
		def_estufa, def_sensor, def_actuator.

delete_sistema
	:-	delete_relation(is_a),
		delete_frame(estufa),
		delete_frame(sensor),
		delete_frame(actuator).




def_estufa
	:-	new_frame(estufa),

		new_slot(estufa, cultivos),
		new_slot(estufa, localizacao),
		new_slot(estufa, nome),
		new_slot(estufa, sensor),
		new_slot(estufa, count, 0),

		print_green('Classe Estufa criada').


create_estufa(Local, Cultivos, Nome)
	:-	gen_name(estufa, N),
		new_frame(N),

		new_slot(N, is_a, estufa),
		(
			is_list(Cultivos)	-> new_values(N, cultivos, Cultivos)
								; new_value(N, cultivos, Cultivos)
		),
		new_value(N, localizacao, Local),
		new_value(N, nome, Nome),
		create_sensor_soil, create_sensor_co2,


		print_green('Nova estufa: ', Nome).



show_estufa_count
	:-	get_value(estufa, count, Count),	print_green('Numero de estufas: ', Count).



alterar_local_estufa(Id, Local)
	:-	new_value(Id, localizacao, Local),
	
		get_value(Id, localizacao, L),		print_green('Local alterado para ', L).



alterar_nome_estufa(Id, Nome)
	:-	new_value(Id, nome, Nome),
	
		get_value(Id, nome, N),				print_green('Nome alterado para ', N).



apagar_estufa(Id)
	:-	get_value(Id, nome, N),
		delete_frame(Id),
		
		print_green('Estufa apagada: ', N).



adicionar_cultivos(Id, Cultivos)
	:-	(
			is_list(Cultivos) 	-> add_values(Id, cultivos, Cultivos) 
								; add_value(Id, cultivos, Cultivos)
		),
		get_values(Id, cultivos, C),		print_green('Cultivos atualizados: ', C).


remover_cultivo(Id, Cultivo)
	:-	delete_value(Id, cultivos, Cultivo),
		get_values(Id, cultivos, C),		print_green('Cultivos atualizados: ', C).

remover_cultivos(Id)
	:-	delete_values(Id, cultivos),
		print_green('Cultivos removidos').
