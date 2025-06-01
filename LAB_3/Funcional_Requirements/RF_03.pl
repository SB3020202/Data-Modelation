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








