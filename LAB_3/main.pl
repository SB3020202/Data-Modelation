

% =============================================================================
% criar_estufa/9
% =============================================================================
% Input:
%   - Id: identificador único da estufa (atom)
%   - Nome: nome da estufa (string)
%   - Local: localização geográfica da estufa (string)
%   - Frutas: lista de frutas cultivadas (list of atoms)
%   - Li: limite inferior de conforto térmico (number)
%   - Ls: limite superior de conforto térmico (number)
%   - Lai: limite absoluto inferior (abaixo do qual é "freezing") (number)
%   - Las: limite absoluto superior (acima do qual é "burning") (number)
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
%   - Mostra no terminal todos os slots e valores associados à estufa indicada.
%
% Funcionamento:
%   Este predicado usa o predicado Golog `show_frame/1` para apresentar
%   o conteúdo da frame da estufa, incluindo os seus atributos e valores
%   (nome, localização, tipos de fruta, parâmetros ambientais, etc.).
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
%   - Id: identificador da estufa             (atom)
%   - Nome: novo nome da estufa               (string)
%   - Local: nova localização                 (string)
%   - Frutas: nova lista de frutas cultivadas (list)
%   - Li: novo limite inferior                (number)
%   - Ls: novo limite superior                (number)
%   - Lai: novo limite absoluto inferior      (number)
%   - Las: novo limite absoluto superior      (number)
%
% Output:
%   - Atualiza todos os slots da estufa com os novos valores fornecidos.
%
% Funcionamento:
%   Substitui os valores
%   de todos os slots principais de uma estufa. Os slots têm de existir.
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
%   `delete_frame/1` da biblioteca GOLOG. Após a execução, a estufa deixa de existir
%   e não pode mais ser consultada com `show_frame/1` ou `get_value/3`.
%
% Como usar:
%   ?- apagar_estufa(estufa1).
% =============================================================================
apagar_estufa(Id) :-
    delete_frame(Id).







% -----------------------------------RF2 ---------------------------------------------------------







