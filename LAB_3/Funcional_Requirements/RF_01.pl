%	Class name:		Estufa

%	-	Id					atom
%	-	Local				string
%	-	Cultivos			list
%	-	Li					number
%	-	Ls					number
%	-	Lai					number
%	-	Las					number

%	+	criar_estufa()		void
%	+	mostrar_estufa()		void
%	+	alterar_estufa()		void
%	+	apagar_estufa()		void

:- dynamic new_value/2.
:- dynamic delete_values/3.


%		Cria uma estufa ao criar uma nova frame no sistema com os atributos recebidos no input.

criar_estufa(EstufaId, Local, Li, Ls, Lai, Las) 
	:-	new_frame(EstufaId),

		new_slot(EstufaId, cultivos),
		new_slot(EstufaId, localizacao, Local),
		new_slot(EstufaId, limInferior, Li),
		new_slot(EstufaId, limSuperior, Ls),
		new_slot(EstufaId, limAbsolutoInferior, Lai),
		new_slot(EstufaId, limAbsolutoSuperior, Las),


		print_green('Estufa criada sem cultivos: '), print_green(EstufaId).	%frame_local_slots(EstufaId, EstufaSlots)




criar_estufa(EstufaId, Local, Cultivos, Li, Ls, Lai, Las) 
	:-	new_frame(EstufaId),

		new_slot(EstufaId, cultivos, Cultivos),
		new_slot(EstufaId, localizacao, Local),
		new_slot(EstufaId, limInferior, Li),
		new_slot(EstufaId, limSuperior, Ls),
		new_slot(EstufaId, limAbsolutoInferior, Lai),
		new_slot(EstufaId, limAbsolutoSuperior, Las),

		print_green('Estufa criada: '), print_green(EstufaId), writeln(''),
		print_green('Com os cultivos: '), print_green(Cultivos).




%		Apresenta os atributos do frame com o id da estuda no input.

mostrar_estufa(Id)
	:-	(frame_exists(Id) -> show_frame(Id) ; print_red('Estufa inexistente.'), fail).




%		Substitui os valores de todos os slots de uma estufa.

alterar_estufa(EstufaId, Local, Li, Ls, Lai, Las)
	:- frame_exists(EstufaId),

		new_value(EstufaId, localizacao, Local),
		new_value(EstufaId, cultivos),
		new_value(EstufaId, limInferior, Li),
		new_value(EstufaId, limSuperior, Ls),
		new_value(EstufaId, limAbsolutoInferior, Lai),
		new_value(EstufaId, limAbsolutoSuperior, Las).

alterar_estufa(EstufaId, Local, Cultivos, Li, Ls, Lai, Las)
	:- frame_exists(EstufaId),

		new_value(EstufaId, localizacao, Local),
		%podiamos verificar para so adicionar as frames caso ja existem, mas se da para criar sem que existam, entao n vale a pena.
		new_value(EstufaId, cultivos, Cultivos),
		new_value(EstufaId, limInferior, Li),
		new_value(EstufaId, limSuperior, Ls),
		new_value(EstufaId, limAbsolutoInferior, Lai),
		new_value(EstufaId, limAbsolutoSuperior, Las).




%   	Elimina uma estufa existente do sistema, e todos os seus atributos.

apagar_estufa(Id)
	:-	(frame_exists(Id) -> delete_frame(Id) ; print_red('Estufa inexistente.'), fail).




%		Adiciona um ou mais cultivos a uma estufa

adicionar_cultivo_estufa(EstufaId, Cultivo)
	:- (frame_exists(EstufaId) -> add_value(EstufaId, cultivos, Cultivo) ; print_red('Houve um problema a adicionar o cultivo.'), fail).

adicionar_cultivos_estufa(EstufaId, Cultivos)
	:- (frame_exists(EstufaId) -> add_values(EstufaId, cultivos, Cultivos) ; print_red('Houve um problema a adicionar os cultivos.'), fail).

%		Remove um cultivo de uma estufa

remover_cultivo_estufa(EstufaId, Cultivo)
	:- (frame_exists(EstufaId) -> delete_value(EstufaId, cultivos, Cultivo) ; print_red('Estufa inexistente.'), fail).

remover_cultivos_estufa(EstufaId, Cultivos)
	:- (frame_exists(EstufaId) -> delete_values(EstufaId, cultivos, Cultivos) ; print_red('Estufa inexistente.'), fail).