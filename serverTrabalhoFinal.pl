:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- dynamic server_running/0.

start_server(Port):-
    \+ server_running,
    assert(server_running),
    http_server(http_dispatch, [port(Port)]),!;
    true.

:- http_handler('/quintas', list_quintas, []).

list_quintas(_Request) :-
    findall(
		_{ id: Id, nome: Nome, localizacao: Local },
        quinta(Id, Nome, Local),
        Quintas
    ),
    reply_json(Quintas).

	atoms_handler(_Request) :-
    % List of Atoms
    Atoms = [mde, str, si],
    % Create strings from atoms
    maplist(atom_string, Atoms, Strings),
    % Create JSON Object from the dictionary
    reply_json(json([atoms=Strings])).
