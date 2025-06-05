:- dynamic criar_estufa/8.
:- dynamic criar_fruta/7.
:- dynamic frame_exists/1.

estufa_inexistente
	:- delete_kb,
		criar_fruta(fruta, 'fruta teste', '20-05-20', '03-03-03', '05-05-05', 14.5, 3).

crud_estufa
	:- delete_kb,			%		cria e remove fruta
		criar_estufa(estufa, 'Estufa teste', 'FCT', 1, 2, 3, 4),
		criar_fruta(fruta, 'fruta teste', '20-05-20', '03-03-03', '05-05-05', 14.5, 3),
		frame_exists(fruta),

		apagar_estufa(fruta),	
		\+ frame_exists(fruta).


%test_2_3 :- delete_kb,			%		cria e remove fruta
	%frame_exists(fruta).

