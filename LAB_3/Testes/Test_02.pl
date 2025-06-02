test21 :- delete_kb,			%		fruta com estufa inexistente
	criar_fruta(fruta_teste, "fruta teste", "20-05-20", "03-03-03", "05-05-05", 14.5, 3, estufa_teste).


test_2_2 :- delete_kb,			%		cria e remove fruta
	criar_estufa(estufa_teste, 'Quinta teste', 'FCT', [], 1, 2, 3, 4),
	criar_fruta(fruta_teste, "fruta teste", "20-05-20", "03-03-03", "05-05-05", 14.5, 3, estufa_teste),
	frame_exists(fruta_teste),
	mostrar_estufa(fruta_teste),

	get_values(estufa_teste, FrutasCulitvadas, ListaFrutas), format('Lista de frutas: ~w', ListaFrutas),

	apagar_estufa(fruta_teste),
	\+ frame_exists(fruta_teste).


test23 :- delete_kb,			%		cria e remove fruta
	frame_exists(fruta).

