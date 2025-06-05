:- dynamic criar_estufa/7.
:- dynamic alterar_estufa/6.

test_1_1
	:- delete_kb,						%	Cria e apaga estufa
		criar_estufa(estufa_teste, 'Estufa teste', 'FCT', 1, 2, 3, 4),
		frame_exists(estufa_teste),
		mostrar_estufa(estufa_teste),

		apagar_estufa(estufa_teste),
		\+ frame_exists(estufa_teste).


test_1_2
	:- delete_kb,						%	Apaga estufa nao existente
		\+ apagar_estufa(estufa_teste).


test_1_3
	:- delete_kb,						%	Altera estufa nao existente
		\+ alterar_estufa(estufa_teste, 'Estufa teste', 'FCT', [], 1, 2, 3, 4).
		\+ alterar_estufa(estufa_teste, 'Estufa teste', 'FCT', 1, 2, 3, 4).


test_1_4
	:- delete_kb,						%	Ids nao podem ser iguais
		criar_estufa(estufa_teste, 'Estufa teste', 'FCT', 1, 2, 3, 4),
		\+ criar_estufa(estufa_teste, 'Estufa teste 2', 'FCT', 1, 2, 3, 4).

test_1_5
	:- delete_kb,
		\+ mostrar_estufa(estufa_teste).

test_1_6
	:- delete_kb,
		criar_estufa(estufa_teste, 'Estufa teste', 'FCT', 1, 2, 3, 4).
