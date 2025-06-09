print_green(String)
	:- write('\e[32m'), write(String), write('.\e[0m'), nl.

print_green(String, Arg)
	:- write('\e[32m'), write(String), write(Arg), write('.\e[0m'), nl.

print_red(String)
	:- write('\e[31m'), write(String), write('.\e[0m'), nl.

print_red(String, Arg)
	:- write('\e[31m'), write(String), write(Arg), write('.\e[0m'), nl.


gen_name(Type, N)
	:-	get_value(Type, count, A),
		A1 is A + 1,
		new_value(Type, count, A1),
		atom_concat(Type, A1, N).


getdate(D)
	:- get_time(T),
		stamp_date_time(T,D,'UTC').