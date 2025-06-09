def_fruta
	:-	new_frame(fruta),

		new_slot(fruta, nome),
		new_slot(fruta, dataSemeio),
		new_slot(fruta, dataColheita),
		new_slot(fruta, duracaoValidade),
		new_slot(fruta, precoKg),

		print_green('Fruta criada').


criar_fruta(Nome, DataSemeio, DataColheita, DuracaoValidade, Preco, Quantidade)
	:-	gen_name(fruta, N),
		new_frame(N),
		
		new_slot(N, is_a, fruta),
		new_slot(N, is_in, estufa),
		new_value(N, nome, Nome),
		new_value(N, dataSemeio, DataSemeio),
		new_value(N, dataColheita, DataColheita),
		new_value(N, duracaoValidade, DuracaoValidade),
		new_value(N, precoKg, Preco),

		print_green('Fruta criada: ', Nome).



apagar_fruta(Id) 
	:-	get_value(Id, id_estufa, EstufaId),
		delete_slot(Id, EstufaId),
		delete_frame(Id).

