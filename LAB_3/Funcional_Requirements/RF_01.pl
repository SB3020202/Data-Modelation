%		Cria uma estufa ao criar uma nova frame no sistema com os atributos recebidos no input.
%	Input
%		Id					atom
%		Nome				string
%		Local				string
%		Li					number
%		Ls					number
%		Lai					number
%		Las					number

criar_estufa(Id, Nome, Local, Li, Ls, Lai, Las) :-
	\+ frame_exists(Id),

	new_frame(Id),
	new_slot(Id, nome, Nome),
	new_slot(Id, localizacao, Local),
	new_slot(Id, frutasCultivadas),
	new_slot(Id, limInferior, Li),
	new_slot(Id, limSuperior, Ls),
	new_slot(Id, limAbsolutoInferior, Lai),
	new_slot(Id, limAbsolutoSuperior, Las).




%		Apresenta os atributos do frame com o id da estuda no input.

mostrar_estufa(Id) :-
	frame_exists(Id),
	show_frame(Id).




%		Substitui os valores de todos os slots de uma estufa.


alterar_estufa(Id, Nome, Local, FrutasCulitvadas, Li, Ls, Lai, Las) :-
	frame_exists(Id),
	new_value(Id, nome, Nome),
	new_value(Id, localizacao, Local),
	new_value(Id, frutasCultivadas, FrutasCulitvadas),
	%se existirem ?
	new_value(Id, limInferior, Li),
	new_value(Id, limSuperior, Ls),
	new_value(Id, limAbsolutoInferior, Lai),
	new_value(Id, limAbsolutoSuperior, Las).




%   	Elimina uma estufa existente do sistema, e todos os seus atributos.

apagar_estufa(Id) :-
	frame_exists(Id),
	delete_frame(Id).
