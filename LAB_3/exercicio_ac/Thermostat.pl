def_thermo
	:-	new_frame(thermostat),

		new_slot(thermostat, li, 14),
		new_slot(thermostat, ls, 25),
		new_slot(thermostat, lai, 0),
		new_slot(thermostat, las, 35),
		new_slot(thermostat, temp, 0),
		new_slot(thermostat, clima),

		new_demon(thermostat, temp, controld, if_write, before, side_effect),
		new_demon(thermostat, clima, climad, if_read, after, alter_value),

		print_green('Thermostat created').


climad(F, S, _, C)
	:-	get_value(F, temp, T),
		get_value(F, li, Li),
		get_value(F, lai, Lai),
		get_value(F, ls, Ls),
		get_value(F, las, Las),
		classify(T, Lai, Li, Ls, Las, C).


classify(T, _, Li, Ls, _,	'comfort')	:- T >= Li, T =< Ls.
classify(T, Lai, _, _, _,	'freezing')	:- T < Lai.
classify(T, _, _, _, Las,	'burning')	:- T > Las.
classify(T, Lai, Li, _, _,	'cold')		:- T >= Lai, T < Li.
classify(T, _, _, Ls, Las,	'hot')		:- T >= Ls, T =< Las.



controld(F, S, _, T)
	:-	get_value(F, temp, Ta),
		get_value(F, li, Li),
		get_value(F, lai, Lai),
		get_value(F, ls, Ls),
		get_value(F, las, Las),
		act(T, Ta, Li, Lai, Ls, Las).
 
act(T, Ta, Li, Lai, Ls, Las)			:- T>Ls, 
		call_method_0(ac, cool),
		malarm(T, Ta, Li, Lai, Ls, Las).

act(T, Ta, Li, Lai, Ls, Las)			:-	T<Li,
		call_method_0(ac,warm),
		malarm(T, Ta, Li, Lai, Ls, Las).

act(_,_,_,_,_,_)
	:- call_method_0(ac,stop).

malarm(T,Ta,_,_,_,Las)					:- T>Las, Ta<Las, 
		getdate(D), 
		genmsg(T, burning,D).

malarm(T,Ta,_,Lai,_,_)					:-	T<Lai, Ta>Lai, 
		getdate(D), 
		genmsg(T,freezing,D).
	
malarm(_,_,_,_,_,_).

