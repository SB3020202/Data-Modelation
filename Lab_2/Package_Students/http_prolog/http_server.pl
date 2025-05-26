% Required libraries
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).


:- dynamic server_running/0.
% Starting our HTTP Server
start_server(Port):-
    \+ server_running,
    assert(server_running),
    http_server(http_dispatch, [port(Port)]),!;
    true.

% Hello world (Receives a name and returns a message)
% Define the handler for the endpoint
:- http_handler('/hello', say_hello, []).

say_hello(Request) :-
    member(search(Query), Request),
    memberchk(name=Name, Query),
    atom_concat("Hello: ", Name, MESSAGE),
    Response = _{ message: MESSAGE},
    reply_json(Response).


% List of numbers
% Define the handler for the endpoint
:- http_handler('/numbers', numbers_handler, []).

numbers_handler(_Request) :-
    % List of numbers
    Numbers = [1, 2, 3, 4, 5],
    % Create a dictionary with the list
    dict_create(JSON, _, [numbers-Numbers]),
    % Create JSON Object from the dictionary
    reply_json(JSON).


% List of atoms
% Define the handler for the endpoint
:- http_handler('/atoms', atoms_handler, []).

atoms_handler(_Request) :-
    % List of Atoms
    Atoms = [mde, str, si],
    % Create strings from atoms
    maplist(atom_string, Atoms, Strings),
    % Create JSON Object from the dictionary
    reply_json(json([atoms=Strings])).


% List of facts
% Define the handler for the endpoint
:- http_handler('/facts', facts_handler, []).

% Rule to create the JSON object
to_json(student(Name, Age), json([name=Name, age=Age])).

facts_handler(_Request) :-
    % List of facts
    FactList = [student(andre, 30), student(ines, 25), student(filipa, 40)],
    % Create a list of JSON objects from the list of facts
    maplist(to_json, FactList, JSONList),
    % Create JSON Object from the dictionary
    reply_json(json([students=JSONList])).

% List of lists of facts
:- http_handler('/factslist', factslist_handler, []).

% Define the handler for the endpoint
factslist_handler(_Request) :-
    % List with lists of facts
    FactLists = [[student(andre, 30), student(ines, 25)], [student(filipa, 40)]],
    % Create lists of JSON objects from the list of facts
    maplist(maplist(to_json), FactLists, JSONLists),
    % Create the JSON object
    reply_json(JSONLists).


