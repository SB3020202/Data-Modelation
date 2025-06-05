print_green(String)
	:- write('\e[32m'), write(String), write('\e[0m').

print_red(String)
	:- write('\e[31m'), write(String), write('\e[0m').