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


