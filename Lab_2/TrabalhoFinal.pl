% Declara��o do predicado din�mico
:- dynamic quinta/3.
:- dynamic sensor/3.
:- dynamic produtor/3.
:- dynamic distribuidor/3.
:- dynamic transportadora/5.
:- dynamic ligacao/3.

:- dynamic leitura/4.
:- dynamic consumo/3.

:- dynamic caminho/5.


%																				CRUD_QUINTA	-	RF 1

adicionar_quinta(Id, Nome, Local) :-
    \+ quinta(Id, _, _),
    assertz(quinta(Id, Nome, Local)).

remover_quinta(Id) :-
    retractall(quinta(Id, _, _)).

alterar_quinta(Id, NovoNome, NovoLocal) :-
    retractall(quinta(Id, _, _)),
    assertz(quinta(Id, NovoNome, NovoLocal)).


%																				CRUD_SENSOR	-	RF 2

adicionar_sensor(IdSensor, Tipo, IdQuinta) :-
    \+ sensor(IdSensor, _, _),
    assertz(sensor(IdSensor, Tipo, IdQuinta)).

remover_sensor(IdSensor) :-
    retractall(sensor(IdSensor, _, _)).

alterar_sensor(IdSensor, NovoTipo, NovaQuinta) :-
    retractall(sensor(IdSensor, _, _)),
    assertz(sensor(IdSensor, NovoTipo, NovaQuinta)).


%													CRUD_PRODUTOR/DISTIBUIDORES/TRANSPORTADORAS	-	RF 3

adicionar_produtor(Id, Nome, Zona) :-
    \+ produtor(Id, _, _),
    assertz(produtor(Id, Nome, Zona)).

remover_produtor(Id) :-
    retractall(produtor(Id, _, _)).

alterar_produtor(Id, NovoNome, NovaZona) :-
    retractall(produtor(Id, _, _)),
    assertz(produtor(Id, NovoNome, NovaZona)).


adicionar_distribuidor(Id, Nome, Zona) :-
    \+ distribuidor(Id, _, _),
    assertz(distribuidor(Id, Nome, Zona)).

remover_distribuidor(Id) :-
    retractall(distribuidor(Id, _, _)).

alterar_distribuidor(Id, NovoNome, NovaZona) :-
    retractall(distribuidor(Id, _, _)),
    assertz(distribuidor(Id, NovoNome, NovaZona)).


adicionar_transportadora(Id, Nome, Capacidade, Combustivel, Area) :-
\+ transportadora(Id, _, _, _, _),
    assertz(transportadora(Id, Nome, Capacidade, Combustivel, Area)).

remover_transportadora(Id) :-
    retractall(transportadora(Id, _, _, _, _)).

alterar_transportadora(Id, NovoNome, NovaCap, NovoComb, NovaArea) :-
    retractall(transportadora(Id, _, _, _, _)),
    assertz(transportadora(Id, NovoNome, NovaCap, NovoComb, NovaArea)).


%																			CRUD_LIGACOES	-	RF 4

adicionar_ligacao(No1, No2, Distancia, Tempo, TipoVia, Custo) :-
    \+ ligacao(No1, No2, _),
    assertz(ligacao(No1, No2, dados(Distancia, Tempo, TipoVia, Custo))).

remover_ligacao(No1, No2) :-
    retractall(ligacao(No1, No2, _)).

alterar_ligacao(No1, No2, NovaDist, NovoTempo, NovoTipo, NovoCusto) :-
    retractall(ligacao(No1, No2, _)),
    assertz(ligacao(No1, No2, dados(NovaDist, NovoTempo, NovoTipo, NovoCusto))).


%									Registar/atualizar leituras e consumos por quinta/cultura	- RF 5

adicionar_leitura(IdSensor, Timestamp, Tipo, Valor) :-
    assertz(leitura(IdSensor, Timestamp, Tipo, Valor)).

atualizar_leitura(IdSensor, Timestamp, Tipo, NovoValor) :-
    retractall(leitura(IdSensor, Timestamp, Tipo, _)),
    assertz(leitura(IdSensor, Timestamp, Tipo, NovoValor)).


adicionar_consumo(IdQuinta, Cultura, Litros) :-
    assertz(consumo(IdQuinta, Cultura, Litros)).

atualizar_consumo(IdQuinta, Cultura, NovoLitros) :-
    retractall(consumo(IdQuinta, Cultura, _)),
    assertz(consumo(IdQuinta, Cultura, NovoLitros)).


%																			Lista sensores	- RF 6

listar_sensores_quinta(IdQuinta, Lista) :-
    dono(IdProdutor, IdQuinta),
    produtor(IdProdutor, NomeProdutor, _),
    findall((IdSensor, Tipo, NomeProdutor),
            sensor(IdSensor, Tipo, IdQuinta),
            Lista).
% Exemplo de saida:		Lista = [(s1, temperatura, 'Joao Silva'), (s2, humidade, 'Joao Silva')].


%																Lista transportadoras	- RF 7

listar_transportadoras_zona(Zona, Lista) :-
    findall((Id, Nome),
            (transportadora(Id, Nome, _, _, Zonas), member(Zona, Zonas)),
            Lista).


%																Consultar leituras mais recente	- RF 8

% Input:
%   IdSensor � Identificador do sensor cujas leituras queremos consultar
%
% Output:
%   Tipo                 � Tipo da leitura mais recente (ex: temperatura, humidade)
%   Valor                � Valor dessa leitura
%   TimestampMaisRecente � Momento (timestamp) da leitura mais recente
%
% Funcionamento:
%   1. Recolhe todas as leituras associadas ao sensor usando findall/3. Cada leitura tem a forma (Timestamp, Tipo, Valor).
%   2. Ordena com o sort() a lista de leituras por Timestamp em ordem crescente com sort/2. 
%		(assume-se que o formato do timestamp permite ordena��o lexicogr�fica)
%   3. Inverte a lista com reverse/2 para colocar a leitura mais recente no in�cio.
%   4. Extrai o primeiro elemento da lista invertida e unifica os seus componentes com as variaveis de saida: Timestamp, Tipo e Valor.

leitura_mais_recente(IdSensor, Tipo, Valor, TimestampMaisRecente) :-
    findall((Timestamp, Tipo, Valor),
            leitura(IdSensor, Timestamp, Tipo, Valor),
            Leituras),
    sort(Leituras, LeiturasOrdenadas),
    reverse(LeiturasOrdenadas, [(TimestampMaisRecente, Tipo, Valor)|_]).	% "|_" ignora o resto da lista


%															Consultar consumos hídricos	- RF 9

consumos_por_quinta(IdQuinta, Lista) :-
    findall((Cultura, Litros),
            consumo(IdQuinta, Cultura, Litros),
            Lista).


%															Listar sensores com limiar	- RF 10

% Limites cr�ticos por tipo de sensor
limite(temperatura, 35).
limite(humidade, 30).


% Input:
%   Nenhum. O predicado procura automaticamente em todas as leituras registadas.
%
% Output:
%   Lista � Lista de tuplos (IdSensor, Timestamp, Tipo, Valor),
%           onde cada elemento representa um sensor cuja leitura mais recente
%           ultrapassa o limite definido para o seu tipo.
%
% Funcionamento:
%   1. Recolhe todas as leituras existentes com leitura/4.
%   2. Ordena as leituras por timestamp (usando sort/2).
%   3. Inverte a lista para que a leitura mais recente venha primeiro.
%   4. Filtra a lista, verificando para cada leitura se ultrapassa o limite (definido em limite/2) de acordo com o tipo de sensor.
%   5. Apenas a leitura mais recente de cada sensor/tipo � considerada.
%   6. Devolve a lista com os sensores fora dos valores aceit�veis.

recolha_sensores_fora_do_limite(Lista) :-
    findall((IdSensor, Timestamp, Tipo, Valor),
            leitura(IdSensor, Timestamp, Tipo, Valor),
            TodasLeituras),
    sort(TodasLeituras, LeiturasOrdenadas),
    reverse(LeiturasOrdenadas, RecentesPrimeiro),
    %lista de leituras a processar, Acumulador (onde vou guardando os validos), Resultado final da filtragem
    filtrar_leituras_criticas(RecentesPrimeiro, [], Lista).


% Input:
%   Leituras � Lista de tuplos (IdSensor, Timestamp, Tipo, Valor),
%              j� ordenada por timestamp (mais recente primeiro).
%   Acc      � Acumulador interno que come�a como lista vazia ([]).
%
% Output:
%   Resultado � Lista final com sensores cuja leitura mais recente
%               ultrapassa o limite definido em limite/2.
%
% Funcionamento:
%   1. Percorre a lista de leituras.
%   2. Para cada leitura:
%      - Verifica se ultrapassa o limite (com valor_fora_do_limite/3).
%      - Garante que esse sensor/tipo ainda n�o foi adicionado.
%   3. Se estiver fora do limite e ainda n�o foi adicionado, guarda.
%   4. No final, devolve todas as leituras cr�ticas (sem duplicados).

% caso base = lista vazia
filtrar_leituras_criticas([], Acc, Acc).

% else if (leitura fora do limite/nao adicionada) -> adiciona ao Acumulador
filtrar_leituras_criticas([(Id, Timestamp, Tipo, Value)|Resto], Acc, Resultado) :-
    limite(Tipo, Limite),
    valor_fora_do_limite(Tipo, Value, Limite),
    \+ member((Id, _, Tipo, _), Acc),    % para evitar duplicados
    filtrar_leituras_criticas(Resto, [(Id, Timestamp, Tipo, Value)|Acc], Resultado).

% else if (leitura nao esta fora do limite/j� foi adicionada) -> ignora e 
filtrar_leituras_criticas([_|Resto], Acc, Resultado) :-
    filtrar_leituras_criticas(Resto, Acc, Resultado).


%											Rota mais curta quinta - distribuidor	- RF 10

% Input:
%   Inicio         � Identificador do n� de origem (ex: q1)
%   Destino        � Identificador do n� de destino (ex: d1)
%
% Output:
%   Caminho        � Lista de n�s percorridos do in�cio at� ao destino
%   DistanciaTotal � Soma total das dist�ncias (em km) entre os n�s do caminho
%
% Funcionamento:
%   1. Percorre o grafo (ligacao/3) para encontrar todos os caminhos poss�veis.
%   2. Usa busca em profundidade com acumula��o da dist�ncia total.
%   3. Devolve o caminho com menor dist�ncia (menor custo acumulado em 'dados').
%
% Extra:
%   setof(Elemento, Condicao, ListaOrdenada)
%      recolhe todos valores de Elemento para qnd Condicao � True
%      devolve lista ordenada sem duplicados

rota_mais_curta_quinta_distri(Inicio, Destino, Caminho, DistanciaTotal) :-
    setof((Distancia, CaminhoValido),
          caminho(Inicio, Destino, [Inicio], CaminhoValido, Distancia),
          [(DistanciaTotal, Caminho)|_]).

% Caso: ja estamos no destino
caminho(Destino, Destino, Visitados, Caminho, 0) :-
    reverse(Visitados, Caminho).

% Passo recursivo: continuar a explorar o grafo
caminho(Atual, Destino, Visitados, Caminho, DistTotal) :-
    ligacao(Atual, Proximo, dados(Dist, _, _, _)),
    \+ member(Proximo, Visitados),
    caminho(Proximo, Destino, [Proximo|Visitados], Caminho, DistAcumulada),
    DistTotal is Dist + DistAcumulada.

