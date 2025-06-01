%	Funcionamento:
%		Cria uma estufa ao criar uma nova frame no sistema com os atributos recebidos no input.
%   	Usa os predicados `new_frame/1` e `new_slot/3`.
%	Input
%		Id					atom
%		Nome				string
%		Local				string
%		FrutasCulitvadas	atom list
%		Li					number
%		Ls					number
%		Lai					number
%		Las					number

criar_estufa(Id, Nome, Local, FrutasCulitvadas, Li, Ls, Lai, Las) :-
	new_frame(Id),
	new_slot(Id, nome, Nome),
	new_slot(Id, localizacao, Local),
	new_slot(Id, frutasCultivadas, FrutasCulitvadas),
	new_slot(Id, limInferior, Li),
	new_slot(Id, limSuperior, Ls),
	new_slot(Id, limAbsolutoInferior, Lai),
	new_slot(Id, limAbsolutoSuperior, Las).





%	Funcionamento:
%		Apresenta os atributos do frame com o id da estuda no input.
%	Input
%		Id				atom

mostrar_estufa(Id) :-
	show_frame(Id).





%	Funcionamento:
%		Substitui os valores de todos os slots de uma estufa.
%	Input:
%		Id					atom
%		Nome				string
%		Local				string
%		FrutasCulitvadas	list
%		Li					number
%		Ls					number
%		Lai					number
%		Las					number

alterar_estufa(Id, Nome, Local, FrutasCulitvadas, Li, Ls, Lai, Las) :-
	new_value(Id, nome, Nome),
	new_value(Id, localizacao, Local),
	new_value(Id, frutasCultivadas, FrutasCulitvadas),
	new_value(Id, limInferior, Li),
	new_value(Id, limSuperior, Ls),
	new_value(Id, limAbsolutoInferior, Lai),
	new_value(Id, limAbsolutoSuperior, Las).





%	Funcionamento:
%   	Elimina uma estufa existente do sistema, e todos os seus atributos.
%	Input
%		Id		atom

apagar_estufa(Id) :-
	delete_frame(Id).
