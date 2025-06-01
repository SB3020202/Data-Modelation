%	Funcionamento:
%		Cria uma frame de um lote de fruta, ligado a uma estufa.
%	Input
%		Id					atom
%		Nome				string
%		DataSemeio			string
%		DataColheita		string
%		DataValidade		string
%		Preco				number
%		Quantidade			number
%		EstufaId			atom			estufa onde foi cultivada

criar_fruta(Id, Nome, DataSemeio, DataColheita, DataValidade, Preco, Quantidade, EstufaId) :-
    new_frame(Id),
    new_slot(Id, nome, Nome),
    new_slot(Id, dataSemeio, DataSemeio),
    new_slot(Id, dataColheita, dataColheita),
    new_slot(Id, dataValidade, DataValidade),
    new_slot(Id, preco, Preco),
    new_slot(Id, quantidade, Quantidade),
    new_slot(Id, id_estufa, EstufaId).





%	Funcionamento:
%		Apresenta os atributos associados a um lote de fruta.
%	Input
%		Id		atom

mostrar_fruta(Id) :-
    show_frame(Id).





% =============================================================================
% alterar_fruta/8
% =============================================================================
% Input:
%   - Id        : identificador do lote de fruta                         (atom)
%   - Nome      : novo nome da fruta                                     (string)
%   - Ref       : nova referência/código interno                         (atom)
%   - Semeio    : nova data de semeio                                    (string)
%   - Colheita  : nova data de colheita                                  (string)
%   - Validade  : nova data de validade                                  (string)
%   - Preco     : novo preço por unidade                                 (number)
%   - EstufaId  : nova estufa associada                                  (atom)
%
% Output:
%   - Atualiza todos os atributos do lote de fruta.
%
% Funcionamento:
%   Usa `new_value/3` da engine Golog para atualizar todos os campos de
%   um lote de fruta existente no sistema, mantendo o mesmo Id.
%
% Como usar:
%   ?- alterar_fruta(fruta1, 'Morango', ref002, '2025-03-10',
%                    '2025-04-15', '2025-04-25', 1.40, estufa2).
% =============================================================================
alterar_fruta(Id, Nome, Ref, Semeio, Colheita, Validade, Preco, EstufaId) :-
    new_value(Id, nome, Nome),
    new_value(Id, referencia, Ref),
    new_value(Id, data_semeio, Semeio),
    new_value(Id, data_colheita, Colheita),
    new_value(Id, validade, Validade),
    new_value(Id, preco, Preco),
    new_value(Id, estufaId, EstufaId).



% =============================================================================
% apagar_fruta/1
% =============================================================================
% Input:
%   - Id : identificador do lote de fruta a remover                      (atom)
%
% Output:
%   - Elimina o lote de fruta e todos os seus atributos da base de conhecimento.
%
% Funcionamento:
%   Usa o predicado `delete_frame/1` da engine Golog para remover
%   completamente o registo de fruta com esse Id. Após a remoção, a fruta
%   deixa de poder ser consultada ou encomendada.
%
% Como usar:
%   ?- apagar_fruta(fruta1).
% =============================================================================
apagar_fruta(Id) :-
    delete_frame(Id).





% =============================================================================
% criar_sensor/5
% =============================================================================
% Input:
%   - Id           : identificador �nico do sensor                       (atom)
%   - Tipo         : tipo de sensor (temperatura, humidade ou co2)       (atom/string)
%   - Valor        : valor lido pelo sensor                              (number)
%   - DataLeitura  : data e hora da leitura                              (string)
%   - EstufaId     : identificador da estufa onde o sensor est�          (atom)
%
% Output:
%   - Cria uma frame representando um sensor ligado a uma estufa.
%
% Funcionamento:
%   Cria um sensor ambiental com tipo, valor, data e liga��o a uma estufa.
%   Este sensor pode depois ser consultado ou atualizado, e usado
%   para ativar atuadores ou alarmes.
%
% Como usar:
%   ?- criar_sensor(sensor1, temperatura, 22.5, '2025-05-29 16:00', estufa1).
% =============================================================================
criar_sensor(Id, Tipo, Valor, DataLeitura, EstufaId) :-
    new_frame(Id),
    new_slot(Id, tipo, Tipo),
    new_slot(Id, valor, Valor),
    new_slot(Id, data_leitura, DataLeitura),
    new_slot(Id, estufaId, EstufaId).



% =============================================================================
% alterar_sensor/5
% =============================================================================
% Input:
%   - Id           : identificador do sensor                             (atom)
%   - Tipo         : novo tipo de sensor (temperatura, humidade, co2)    (atom)
%   - Valor        : novo valor lido pelo sensor                         (number)
%   - DataLeitura  : nova data e hora da leitura                         (string)
%   - EstufaId     : novo identificador da estufa                        (atom)
%
% Output:
%   - Atualiza todos os atributos do sensor com os novos valores.
%
% Funcionamento:
%   Usa `new_value/3` da engine Golog para atualizar os campos da frame
%   associada a um sensor existente. Substitui o tipo, valor, data e estufa.
%
% Como usar:
%   ?- alterar_sensor(sensor1, temperatura, 29.8, '2025-05-30 11:45', estufa2).
% =============================================================================
alterar_sensor(Id, Tipo, Valor, DataLeitura, EstufaId) :-
    new_value(Id, tipo, Tipo),
    new_value(Id, valor, Valor),
    new_value(Id, data_leitura, DataLeitura),
    new_value(Id, estufaId, EstufaId).




% =============================================================================
% mostrar_sensor/1
% =============================================================================
% Input:
%   - Id : identificador do sensor a visualizar                          (atom)
%
% Output:
%   - Mostra no terminal todos os slots e valores associados ao sensor.
%
% Funcionamento:
%   Usa o predicado `show_frame/1` da engine Golog para apresentar os
%   atributos do sensor, incluindo tipo, valor, data da leitura e estufa associada.
%
% Como usar:
%   ?- mostrar_sensor(sensor1).
% =============================================================================
mostrar_sensor(Id) :-
    show_frame(Id).







% =============================================================================
% apagar_sensor/1
% =============================================================================
% Input:
%   - Id : identificador do sensor a remover                             (atom)
%
% Output:
%   - Elimina o sensor e todos os seus atributos da base de conhecimento.
%
% Funcionamento:
%   Usa o predicado `delete_frame/1` da engine Golog para remover
%   completamente a frame correspondente ao sensor indicado. Ap�s a remo��o,
%   os dados do sensor deixam de poder ser consultados ou atualizados.
%
% Como usar:
%   ?- apagar_sensor(sensor1).
% =============================================================================
apagar_sensor(Id) :-
    delete_frame(Id).




