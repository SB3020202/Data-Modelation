%		Cria uma frame de um lote de fruta, ligado a uma estufa.

%		Id					atom
%		Nome				string
%		DataSemeio			string
%		DataColheita		string
%		DataValidade		string
%		Preco				number
%		Quantidade			number
%		EstufaId			atom			estufa onde foi cultivada

criar_fruta(Id, Nome, DataSemeio, DataColheita, DataValidade, Preco, Quantidade, EstufaId) :-
	frame_exists(EstufaId),
	\+ frame_exists(Id),

    new_frame(Id),
    new_slot(Id, nome, Nome),
    new_slot(Id, dataSemeio, DataSemeio),
    new_slot(Id, dataColheita, DataColheita),
    new_slot(Id, dataValidade, DataValidade),
    new_slot(Id, preco, Preco),
    new_slot(Id, quantidade, Quantidade),
    new_slot(Id, id_estufa, EstufaId),

	adicionar_fruta_estufa(EstufaId, Id),
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
	delete_value(Id, FrutasCulitvadas, id_estufa),

    new_value(Id, nome, Nome),
    new_value(Id, dataSemeio, DataSemeio),
    new_value(Id, dataColheita, DataColheita),
    new_value(Id, dataValidade, DataValidade),
    new_value(Id, preco, Preco),
    new_value(Id, quantidade, Quantidade),
    new_value(Id, id_estufa, EstufaId),

	adicionar_fruta_estufa(EstufaId, Id).



%   	Elimina o lote de fruta e todos os seus atributos da base de conhecimento.

apagar_fruta(Id) :-
	frame_exists(Id),
	get_value(Id, id_estufa, EstufaId),
	delete_slot(Id, EstufaId),
    delete_frame(Id),

	delete_relation(on-top-of).



%		Adiciona um fruta a um estufa

adicionar_fruta_estufa(EstufaId, FrutaId) :-
	frame_exists(EstufaId),
	frame_exists(FrutaId),
	
	new_slot(EstufaId, id_fruta, FrutaId).
/*



%		Cria uma frame representando um sensor ligado a uma estufa.

%		Id         		atom
%		Tipo       		atom
%		Valor      		number
%		DataLeitura		string
%		EstufaId   		atom

criar_sensor(Id, Tipo, Valor, DataLeitura, EstufaId) :-
	frame_exists(EstadoId),
	\+ frame_exists(Id),

    new_frame(Id),
    new_slot(Id, tipo, Tipo),
    new_slot(Id, valor, Valor),
    new_slot(Id, dataLeitura, DataLeitura),
    new_slot(Id, id_estufa, EstufaId).



%		Atualizar os campos da frame associada a um sensor existente

alterar_sensor(Id, Tipo, Valor, DataLeitura, EstufaId) :-
	frame_exists(EstadoId),
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
*/