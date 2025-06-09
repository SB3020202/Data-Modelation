def_encomenda
	:-	new_frame(encomenda),

		new_slot(encomenda, conteudos),
		new_slot(encomenda, quantidades),
		new_slot(encomenda, destino),
		new_slot(encomenda, estado, 'em preparacao'),

		print_green('Classe Encomenda criada').

create_encomenda(Conteudos, Quantidade)
	:-	gen_name(encomenda, N),
		new_frame(N),

		new_slot(N, is_a, encomenda),
		new_value(N, conteudos, Conteudos),
		new_value(N, quantidades, Quantidade),

		print_green('Nova Encomenda: ', N).



enviar_encomenda(Id, Destino)
	:-	new_value(Id, estado, 'em entrega'),
		new_value(Id, destino, Destino),
		
		print_green('Encomenda enviada para ', Destino).


finalizar_encomenda(Id, Destino)
	:-	new_value(Id, estado, 'entregue'),
		
		print_green('Encomenda entregue').



