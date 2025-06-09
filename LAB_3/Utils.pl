print_green(String)
	:- write('\e[32m'), write(String), write('\e[0m').

print_green(String, Arg)
	:- write('\e[32m'), write(String), write(Arg), write('\e[0m').

print_red(String)
	:- write('\e[31m'), write(String), write('\e[0m').

print_red(String, Arg)
	:- write('\e[31m'), write(String), write(Arg), write('\e[0m').


getdate(D)
	:- get_time(T),
		stamp_date_time(T,D,'UTC').