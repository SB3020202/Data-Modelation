test21 :- delete_kb,			%		fruta com estufa inexistente
	criar_fruta(fruta_teste, "fruta teste", "20-05-20", "03-03-03", "05-05-05", 14.5, 3, estufa_teste).


test_2_2 :- delete_kb,			%		cria e remove fruta
	criar_estufa(estufa_teste, 'Estufa teste', 'FCT', 1, 2, 3, 4),
	mostrar_estufa(estufa_teste),
	criar_fruta(fruta_teste, "fruta teste", "20-05-20", "03-03-03", "05-05-05", 14.5, 3, estufa_teste),
	mostrar_fruta(fruta_teste),
	mostrar_estufa(estufa_teste).
	%get_values(estufa_teste, frutasCulitvadas, ListaFrutas), format('Lista de frutas: ~w', ListaFrutas).
	%add_value(estufa_teste, ListaFrutas, fruta_teste).




	%apagar_estufa(fruta_teste),
	%\+ frame_exists(fruta_teste).


test23 :- delete_kb,			%		cria e remove fruta
	frame_exists(fruta).

