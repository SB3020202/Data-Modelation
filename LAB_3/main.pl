
% -----------------------------------RF1 ---------------------------------------------------------

% =============================================================================
% criar_estufa/9
% =============================================================================
% Input:
%   - Id : identificador unico da estufa (atom) - Nome : nome da estufa
%   (string) - Local : localização geográfica da estufa (string) -
%   Frutas : lista de frutas cultivadas (list of atoms) - Li : limite
%   inferior de conforto térmico (number) - Ls : limite superior de
%   conforto térmico (number) - Lai : limite absoluto inferior (abaixo
%   do qual é "freezing") (number) - Las : limite absoluto superior
%   (acima do qual é "burning") (number) - Id : identificador Ãºnico
%   da estufa (atom) - Nome : nome da estufa (string) - Local :
%   localizaÃ§Ã£o geogrÃ¡fica da estufa (string) - Frutas : lista
%   de frutas cultivadas (list of atoms) - Li : limite inferior de
%   conforto tÃ©rmico (number) - Ls : limite superior de conforto
%   tÃ©rmico (number) - Lai : limite absoluto inferior (abaixo do qual
%   Ã© "freezing") (number) - Las : limite absoluto superior (acima do
%   qual Ã© "burning") (number)
%
% Output:
%   - Cria uma frame no sistema com os atributos fornecidos.
%
% Funcionamento:
%   Este predicado cria uma nova estufa no sistema Golog.
%   A estufa é representada por uma frame com os seguintes atributos:
%   - nome, localizacao, tipos_fruta
%   - parâmetros térmicos: li, ls, lai, las
%   Usa os predicados `new_frame/1` e `new_slot/3` da engine Golog.
%   Cria uma nova estufa no sistema Golog.
%   A estufa Ã© representada por uma frame com os seguintes atributos:
%   - nome, localizacao, tipos_fruta
%   - parÃ¢metros tÃ©rmicos: li, ls, lai, las
%
%
% Como usar:
%   ?- criar_estufa(estufa1, 'Estufa Norte', 'Lisboa', [morango, tomate], 15, 30, 10, 40).
% =============================================================================
criar_estufa(Id, Nome, Local, Frutas, Li, Ls, Lai, Las) :-
    new_frame(Id),
    new_slot(Id, nome, Nome),
    new_slot(Id, localizacao, Local),
    new_slot(Id, tipos_fruta, Frutas),
    new_slot(Id, li, Li),
    new_slot(Id, ls, Ls),
    new_slot(Id, lai, Lai),
    new_slot(Id, las, Las).





% =============================================================================
% mostrar_estufa/1
% =============================================================================
% Input:
%   - Id: identificador da estufa (atom)
%
% Output:
%   - Mostra no terminal todos os slots e valores associados Ã  estufa indicada.
%
% Funcionamento:
%   Este predicado usa o predicado Golog `show_frame/1` para apresentar
%   o conteÃºdo da frame da estufa, incluindo os seus atributos e valores
%   (nome, localizaÃ§Ã£o, tipos de fruta, parÃ¢metros ambientais, etc.).
%
% Como usar:
%   ?- mostrar_estufa(estufa1).
% =============================================================================
mostrar_estufa(Id) :-
    show_frame(Id).




% =============================================================================
% alterar_estufa/8
% =============================================================================
% Input:
%   - Id: identificador da estufa                 (atom)
%   - Nome: novo nome da estufa                   (string)
%   - Local: nova localizacao                     (string)
%   - Frutas: nova lista de frutas cultivadas     (list)
%   - Li: novo limite inferior                    (number)
%   - Ls: novo limite superior                    (number)
%   - Lai: novo limite absoluto inferior          (number)
%   - Las: novo limite absoluto superior          (number)
%
% Output:
%   - Atualiza todos os slots da estufa com os novos valores fornecidos.
%
% Funcionamento:
%   Substitui os valores
%   de todos os slots principais de uma estufa. Os slots deixam de
%   existir.
%
% Como usar:
%   ?- alterar_estufa(estufa1, 'Estufa Sul', 'Faro', [banana, manga], 17, 28, 12, 38).
% =============================================================================
alterar_estufa(Id, Nome, Local, Frutas, Li, Ls, Lai, Las) :-
    new_value(Id, nome, Nome),
    new_value(Id, localizacao, Local),
    new_value(Id, tipos_fruta, Frutas),
    new_value(Id, li, Li),
    new_value(Id, ls, Ls),
    new_value(Id, lai, Lai),
    new_value(Id, las, Las).



% =============================================================================
% apagar_estufa/1
% =============================================================================
% Input:
%   - Id: identificador da estufa a apagar (atom)
%
% Output:
%   - Remove a frame da estufa e todos os seus atributos da base de conhecimento.
%
% Funcionamento:
%   Este predicado elimina uma estufa existente do sistema, usando o predicado
%   `delete_frame/1` da biblioteca GOLOG. ApÃ³s a execuÃ§Ã£o, a estufa deixa de existir
%   e nÃ£o pode mais ser consultada com `show_frame/1` ou `get_value/3`.
%
% Como usar:
%   ?- apagar_estufa(estufa1).
% =============================================================================
apagar_estufa(Id) :-
    delete_frame(Id).













% -----------------------------------RF2 ---------------------------------------------------------

% =============================================================================
% criar_fruta/8
% =============================================================================
% Input:
%   - Id         : identificador unico do lote de fruta                  (atom)
%   - Nome       : nome da fruta (ex: 'Morango')                         (string)
%   - Semeio     : data em que foi semeada                               (string)
%   - Colheita   : data da colheita do lote                              (string)
%   - Validade   : data limite para consumo                              (string)
%   - Preco      : preco por unidade                                     (number)
%   - Quantidade : unidades produzidas no lote                           (number)
%   - EstufaId : estufa onde a fruta foi cultivada           (atom)
%
% Output:
%   - Cria uma frame que representa um lote de fruta com stock inicial.
%
% Funcionamento:
%   Cria um registo de um lote de fruta, ligando-o a uma estufa,
%   e inicializando os seus atributos. O stock inicial e definido
%   no campo 'quantidade'.
%
% Como usar:
%   ?- criar_fruta(fruta1, 'Morango', '2025-03-01', '2025-04-10','2025-04-20', 1.20, 300, estufa1).
% =============================================================================
criar_fruta(Id, Nome, Semeio, Colheita, Validade, Preco, Quantidade, EstufaId) :-
    new_frame(Id),
    new_slot(Id, nome, Nome),
    new_slot(Id, data_semeio, Semeio),
    new_slot(Id, data_colheita, Colheita),
    new_slot(Id, validade, Validade),
    new_slot(Id, preco, Preco),
    new_slot(Id, quantidade, Quantidade),
    new_slot(Id, estufaId, EstufaId).





% =============================================================================
% mostrar_fruta/1
% =============================================================================
% Input:
%   - Id : identificador do lote de fruta a visualizar                    (atom)
%
% Output:
%   - Mostra no terminal todos os slots e valores do lote de fruta.
%
% Funcionamento:
%   Usa o predicado `show_frame/1` da engine Golog para apresentar
%   todos os atributos associados a esse lote de fruta, incluindo:
%   nome, referência, datas, preço, quantidade e estufa associada.
%
% Como usar:
%   ?- mostrar_fruta(fruta1).
% =============================================================================
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






% --------------------------------------------- RF3 ----------------


% =============================================================================
% criar_encomenda/4
% =============================================================================
% Input:
%   - Id         : identificador �nico da encomenda                       (atom)
%   - FrutaId    : identificador do lote de fruta associado               (atom)
%   - Quantidade : quantidade de fruta encomendada                        (number)
%   - Estado     : estado atual da encomenda                              (atom)
%                 ('em prepara��o', 'em entrega', 'entregue')
%
% Output:
%   - Cria uma frame representando uma encomenda de fruta.
%
% Funcionamento:
%   Regista uma nova encomenda associada a um lote de fruta espec�fico,
%   com quantidade definida e estado de progresso. A liga��o entre a encomenda
%   e o lote � feita atrav�s do campo `frutaId`.
%
% Como usar:
%   ?- criar_encomenda(encomenda1, fruta1, 100, 'em preparacao').
% =============================================================================
criar_encomenda(Id, FrutaId, Quantidade, Estado) :-
    new_frame(Id),
    new_slot(Id, frutaId, FrutaId),
    new_slot(Id, quantidade, Quantidade),
    new_slot(Id, estado, Estado).








