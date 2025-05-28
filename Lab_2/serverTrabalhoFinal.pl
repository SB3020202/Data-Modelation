:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- use_module(library(http/html_write)).
:- use_module(library(http/html_head)).
:- use_module(library(http/http_client)).

:- dynamic server_running/0.

start():-
    \+ server_running,
    assert(server_running),
    http_server(http_dispatch, [port(8000)]),!;
    true.

:- http_handler(css('style.css'),  http_reply_file('style.css', []), []).

:- http_handler(root(.), home_page, []).
:- http_handler('/quintas', list_quintas, []).
:- http_handler('/sensores', list_sensores, []).
:- http_handler('/produtores', list_produtores, []).
:- http_handler('/distribuidores', list_distribuidores, []).
:- http_handler('/transportadoras', list_transportadoras, []).
:- http_handler('/ligacoes', list_ligacoes, []).

http:location(css, root(css), []).
http:location(ico, root(ico), []).

home_page(_Request) :-
    reply_html_page(
        [ title('Prolog Lab 2')],
		 [  \html_requires(css('style.css')),
         h1('Endpoints'),
		  p('Listas.'),
          ul([
              li(a(href('/quintas'), 'Quintas')),
			  li(a(href('/sensores'), 'Sensores')),
              li(a(href('/produtores'), 'Produtores')),
			  li(a(href('/distribuidores'), 'Distribuidores')),
			  li(a(href('/transportadoras'), 'Transportadoras')),
			  li(a(href('/ligacoes'), 'Ligacoes'))
          ]),
		  p('Functional Requirements.'),
		  ul([
              li(a(href('/RF6'), 'RF6 - Sensores associados a uma quinta.'))
          ])
        ]).

list_quintas(_Request) :-
    findall(
		_{ id: Id, nome: Nome, localizacao: Local },
        quinta(Id, Nome, Local),
        Quintas
    ),
    reply_json(Quintas).


list_sensores(_Request) :-
    findall(
		_{ id: Id, tipo: Tipo, idQuinta: IdQuinta },
        sensor(Id, Tipo, IdQuinta),
        Sensores
    ),
    reply_json(Sensores).


list_produtores(_Request) :-
    findall(
		_{ id: Id, nome: Nome, zona: Zona },
        produtor(Id, Nome, Zona),
        Produtores
    ),
    reply_json(Produtores).


list_distribuidores(_Request) :-
    findall(
		_{ id: Id, nome: Nome, zona: Zona },
        distribuidor(Id, Nome, Zona),
        Distribuidores
    ),
    reply_json(Distribuidores).


list_transportadoras(_Request) :-
    findall(
		_{ id: Id, nome: Nome, capacidade: Capacidade, combustivel: Combustivel, area: Area },
    	transportadora(Id, Nome, Capacidade, Combustivel, Area),
        Transportadoras
    ),
    reply_json(Transportadoras).


list_ligacoes(_Request) :-
    findall(
		_{ no1: No1, no2: No2, dist: Distancia, tempo: Tempo, tipoVia: TipoVia, custo: Custo},
        ligacao(No1, No2, dados(Distancia, Tempo, TipoVia, Custo)),
        Ligacoes
    ),
    reply_json(Ligacoes).