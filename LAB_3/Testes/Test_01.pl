test11 :- delete_kb,						%	Cria e apaga estufa
	criar_estufa(estufa_teste, 'Quinta teste', 'FCT', [], 1, 2, 3, 4),
	frame_exists(estufa_teste),
	mostrar_estufa(estufa_teste),

	apagar_estufa(estufa_teste),
	\+ frame_exists(estufa_teste).


test12 :- delete_kb,						%	Apaga estufa nao existente
	\+ apagar_estufa(estufa_teste),
	\+ frame_exists(estufa_teste).


test13 :- delete_kb,						%	Altera estufa nao existente
	\+ alterar_estufa(estufa_teste, 'Quinta teste', 'FCT', [], 1, 2, 3, 4),
	\+ frame_exists(estufa_teste).


test14 :- delete_kb,						%	Ids nao podem ser iguais
	criar_estufa(estufa_teste, 'Quinta teste', 'FCT', 1, 2, 3, 4),
	\+ criar_estufa(estufa_teste, 'Quinta teste 2', 'FCT', [], 1, 2, 3, 4).

test15 :- delete_kb,
	\+ mostrar_estufa(estufa_teste).

test16 :- delete_kb,
	criar_estufa(estufa_teste, 'Quinta teste', 'FCT', [], 1, 2, 3, 4),