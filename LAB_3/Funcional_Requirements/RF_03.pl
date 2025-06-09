%	Estrutura encomenda
%		Id				atom
%		Conteudos		list
%		Quantidades		list
%		Estado			atom

%		Cria uma frame representando uma encomenda de fruta.

criar_encomenda(EncomendaId, Conteudos, Quantidade, Estado)
	:-	new_frame(EncomendaId),

	new_slot(EncomendaId, conteudos, Conteudos),
	new_slot(EncomendaId, quantidades, Quantidade),
	new_slot(EncomendaId, estado, Estado),

	print_green('Encomenda criada: '), print_green(EncomendaId).



mostrar_encomenda(Id)
	:- 	(frame_exists(Id) -> show_frame(Id) ; print_red('Encomenda inexistente.'), fail).



%	Class name:		fruta

%	-	Nome				string
%	-	DataSemeio			string
%	-	DataColheita		string
%	-	DataValidade		string
%	-	Preco				number
%	-	Quantidade			number


def_fruta
	:-	new_frame(fruta),

		print_green('Fruta criada').

criar_fruta(Nome, DataSemeio, DataColheita, DataValidade, Preco, Quantidade)
	:-	gen_name(N),
		new_frame(N),
		
		new_slot(N, nome, Nome),
		new_slot(N, dataSemeio, DataSemeio),
		new_slot(N, dataColheita, DataColheita),
		new_slot(N, dataValidade, DataValidade),
		new_slot(N, preco, Preco),
		new_slot(N, quantidade, Quantidade),

		print_green('Fruta criada: ', N).


mostrar_fruta(Id)
	:-	(frame_exists(Id) -> show_frame(Id) ; print_red('Fruta inexistente.'), fail).
		


alterar_fruta(Id, Nome, DataSemeio, DataColheita, DataValidade, Preco, Quantidade, EstufaId)
	:-	get_value(Id, id_estufa, EstufaId),
		delete_value(Id, cultivos, id_estufa),

		new_value(Id, dataSemeio, DataSemeio),
		new_value(Id, dataColheita, DataColheita),
		new_value(Id, dataValidade, DataValidade),
		new_value(Id, preco, Preco),
		new_value(Id, quantidade, Quantidade),
		new_value(Id, id_estufa, EstufaId).

	%adicionar_fruta_estufa(EstufaId, Id).



%   	Elimina o lote de fruta e todos os seus atributos da base de conhecimento.

apagar_fruta(Id) 
	:-	get_value(Id, id_estufa, EstufaId),
		delete_slot(Id, EstufaId),
		delete_frame(Id).

