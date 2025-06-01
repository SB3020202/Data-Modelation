test_1_1 :- delete_kb,						%	Cria e apaga estufa
	criar_estufa(estufa_teste, 'Quinta teste', 'FCT', ['banana', 'kiwi'], 1, 2, 3, 4),
	frame_exists(estufa_teste),
	%get_all_slots(estufa_teste, Lista), format('~n Slots da Frame Estufa: ~w~n', [Lista]),
	mostrar_estufa(estufa_teste),

	apagar_estufa(estufa_teste),
	\+ frame_exists(estufa_teste).


test_1_2 :- delete_kb,						%	Apaga estufa nao existente
	\+ apagar_estufa(estufa_teste),
	\+ frame_exists(estufa_teste).


test_1_3 :- delete_kb,						%	Altera estufa nao existente
	\+ alterar_estufa(estufa_teste, 'Quinta teste', 'FCT', ['banana', 'kiwi'], 1, 2, 3, 4),
	\+ frame_exists(estufa_teste).	


test_1_4 :- delete_kb,						%	Ids nao podem ser iguais
	criar_estufa(estufa_teste, 'Quinta teste', 'FCT', ['banana', 'kiwi'], 1, 2, 3, 4),
	\+ criar_estufa(estufa_teste, 'Quinta teste 2', 'FCT', ['banana', 'kiwi'], 1, 2, 3, 4).
