def_sistema
	:-	new_relation(is_a, transitive, all, nil),
		new_relation(is_in, transitive, inclusion([localizacao]), nil),
		def_estufa, def_sensor, def_actuator, def_fruta, def_encomenda.

delete_sistema
	:-	delete_relation(is_a),
		delete_relation(is_in),
		delete_frame(estufa),
		delete_frame(sensor),
		delete_frame(actuator),
		delete_frame(fruta),
		delete_frame(encomenda).




def_estufa
	:-	new_frame(estufa),

		new_slot(estufa, cultivos),
		new_slot(estufa, localizacao),
		new_slot(estufa, nome),
		new_slot(estufa, count, 0),
		new_slot(estufa, clima),

		new_demon(estufa, clima, humidaded, if_read, after, alter_value),

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
		create_sensor(N, soil, 15, 30, 70, 85),
		create_sensor(N, co2, 10, 40, 60, 90),
		create_actuactor(N, rega, soil),
		create_actuactor(N, ventilador, co2),
		create_actuactor(N, nebulizador, soil),


		print_green('Nova estufa: ', Nome).


humidaded(F, S, _, T)
	:-	get_value(soil, status, T).


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
