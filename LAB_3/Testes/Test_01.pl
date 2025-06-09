test_1_1
	:- sistema_estufa,
		create_estufa('Algarve', [pera, melancia], 'Quinta do Gui'),
		show_frame(estufa1).
