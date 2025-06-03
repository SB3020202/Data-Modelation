%		Cria uma frame de um lote de fruta, ligado a uma estufa.

%		FrutaId					atom
%		Nome				string
%		DataSemeio			string
%		DataColheita		string
%		DataValidade		string
%		Preco				number
%		Quantidade			number
%		EstufaId			atom

criar_fruta(FrutaId, Nome, DataSemeio, DataColheita, DataValidade, Preco, Quantidade, EstufaId) :-
	frame_exists(EstufaId),
	\+ frame_exists(FrutaId),

    new_frame(FrutaId),
    new_slot(FrutaId, nome, Nome),
    new_slot(FrutaId, dataSemeio, DataSemeio),
    new_slot(FrutaId, dataColheita, DataColheita),
    new_slot(FrutaId, dataValidade, DataValidade),
    new_slot(FrutaId, preco, Preco),
    new_slot(FrutaId, quantidade, Quantidade),
    new_slot(FrutaId, id_estufa, EstufaId),

	frame_local_slots(EstufaId, lista),
	 format('Lista de frutas: ~w', lista).
	%add_value(EstufaId, frutasCulitvadas, nome).
	%new_relation(on-top-of, transitive, all, nil).



%		Apresenta os atributos associados a um lote de fruta.

mostrar_fruta(Id) :-
	frame_exists(Id),
    show_frame(Id).



%		Atualiza todos os atributos do lote de fruta.

alterar_fruta(Id, Nome, DataSemeio, DataColheita, DataValidade, Preco, Quantidade, EstufaId) :-
	frame_exists(EstufaId),
	frame_exists(Id),

	get_value(Id, id_estufa, EstufaId),
	delete_value(Id, frutasCulitvadas, id_estufa),

    new_value(Id, nome, Nome),
    new_value(Id, dataSemeio, DataSemeio),
    new_value(Id, dataColheita, DataColheita),
    new_value(Id, dataValidade, DataValidade),
    new_value(Id, preco, Preco),
    new_value(Id, quantidade, Quantidade),
    new_value(Id, id_estufa, EstufaId).

	%adicionar_fruta_estufa(EstufaId, Id).
	%tecnicamente o valor dos slots muda portanto continuam la?



%   	Elimina o lote de fruta e todos os seus atributos da base de conhecimento.

apagar_fruta(Id) :-
	frame_exists(Id),
	get_value(Id, id_estufa, EstufaId),
	delete_slot(Id, EstufaId),
    delete_frame(Id).

	%delete_relation(on-top-of).







%		Cria uma frame representando um sensor ligado a uma estufa.

%		Id         		atom
%		Tipo       		atom
%		Valor      		number
%		DataLeitura		string
%		EstufaId   		atom

criar_sensor(Id, Tipo, Valor, DataLeitura, EstufaId) :-
	frame_exists(EstufaId),
	\+ frame_exists(Id),

    new_frame(Id),
    new_slot(Id, tipo, Tipo),
    new_slot(Id, valor, Valor),
    new_slot(Id, dataLeitura, DataLeitura),
    new_slot(Id, id_estufa, EstufaId).



%		Atualizar os campos da frame associada a um sensor existente

alterar_sensor(Id, Tipo, Valor, DataLeitura, EstufaId) :-
	frame_exists(EstufaId),
	\+ frame_exists(Id),

    new_value(Id, tipo, Tipo),
    new_value(Id, valor, Valor),
    new_value(Id, dataLeitura, DataLeitura),
    new_value(Id, estufaId, EstufaId).



%		Mostra no terminal todos os slots e valores associados ao sensor.

mostrar_sensor(Id) :-
	frame_exists(Id),
    show_frame(Id).



%	Remove a frame correspondente ao sensor indicado.

apagar_sensor(Id) :-
	frame_exists(Id),
    delete_frame(Id).
