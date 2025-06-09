sistema_estufa
	:- def_estufa.

%	Class name:		Estufa

%	-	Local			string
%	-	Cultivos		string[]
%	-	Local			string

%		definicao da classe abstrata estufa

def_estufa
	:-	new_frame(estufa),

		new_slot(estufa, cultivos),
		new_slot(estufa, localizacao),
		new_slot(estufa, nome),
		new_slot(estufa, sensor),
		new_slot(estufa, count, 0),

		new_relation(is_a, transitive, all, nil),

		print_green('Estufa criada: '), nl.


%		definicao de um objeto estufa

create_estufa(Local, Cultivos, Nome)
	:-	gen_estufa_name(N),
		new_frame(N),

		new_slot(N, is_a, estufa),
		(is_list(Cultivos) -> new_values(N, cultivos, Cultivos) ; new_value(N, cultivos, Cultivos)),
		new_value(N, localizacao, Local),
		new_value(N, nome, Nome),

		print_green('Nova estufa: ', Nome), nl.



gen_estufa_name(N)
	:-	get_value(estufa, count, A),
		A1 is A + 1,
		new_value(estufa, count, A1),
		atom_concat(estufa, A1, N).



show_estufa_count
	:-	get_value(estufa, count, Count),	print_green('Numero de estufas: ', Count), nl.



alterar_local_estufa(Id, Local)
	:-	new_value(Id, localizacao, Local),
	
		get_value(Id, localizacao, L),		print_green('Local alterado para ', L), writeln('.').



alterar_nome_estufa(Id, Nome)
	:-	new_value(Id, nome, Nome),
	
		get_value(Id, nome, N),				print_green('Nome alterado para ', N), writeln('.').



apagar_estufa(Id)
	:-	get_value(Id, nome, N),
		delete_frame(Id),
		
		print_green('Estufa apagada: ', N), nl.



adicionar_cultivos(Id, Cultivos)
	:-	(is_list(Cultivos) -> add_values(Id, cultivos, Cultivos) ; add_value(Id, cultivos, Cultivos)),
		get_values(Id, cultivos, C),		print_green('Cultivos atualizados: ', C), nl.


remover_cultivo(Id, Cultivo)
	:-	delete_value(Id, cultivos, Cultivo),
		get_values(Id, cultivos, C),		print_green('Cultivos atualizados: ', C), nl.

remover_cultivos(Id)
	:-	delete_values(Id, cultivos),
		print_green('Cultivos removidos: ', C), nl.
