<<<<<<< HEAD
## MDE_LAB2

| RF  | Description                                                                                                          | Status   |
| :-- | :------------------------------------------------------------------------------------------------------------------- | :------- |
| 1   | Adicionar/alterar/remover uma quinta na rede.                                                                        | ✅       |
| 2   | Adicionar/alterar/remover sensores ambientais associados a uma quinta.                                               | ✅       |
| 3   | Adicionar/alterar/remover produtores, distribuidores ou transportadoras.                                             | ✅       |
| 4   | Adicionar/alterar/remover ligações entre nós da rede.                                                                | ✅       |
| 5   | Registar e atualizar leituras dos sensores e consumos hídricos por quinta ou cultura.                                | ✅       |
| 6   | Listar sensores associados a uma quinta específica identificando o produtor.                                         | ✅       |
| 7   | Listar transportadoras disponíveis para uma determinada zona ou região.                                              | ✅       |
| 8   | Consultar leituras mais recentes dos sensores.                                                                       | ✅       |
| 9   | Consultar os consumos hídricos por cultura ou por quinta.                                                            | ✅       |
| 10  | Listar sensores que ultrapassam limiares críticos.                                                                   | ✅       |
| 11  | Determinar a rota mais curta entre uma quinta e um distribuidor.                                                     | ✅       |
| 12  | Determinar a rota com menor impacto ambiental, tendo em conta tipo de transporte.                                    | ✅       |
| 13  | Determinar a rota com passagem por distribuidor intermédio, se for mais sustentável.                                 | ✅       |
| 14  | Listar a transportadora ideal para uma rota com base em múltiplos critérios.                                         | ⚠️ DEBUG |
| 15  | Definir e implementar uma funcionalidade adicional proposta pelos alunos.                                            | 🟥 TODO  |
| 16  | Criação do servidor em SWI-Prolog disponibilizando as funcionalidades anteriores e criação de uma aplicação em Java. | ✅ DONE  |
=======
### Como usar o Git passo a passo

```bash
# MDE 2024-2025
# --------------------------------------------
# SIGAM OS PASSOS ABAIXO PARA USAR O GIT CORRETAMENTE
# --------------------------------------------

# 1. Clonar o repositório (apenas na primeira vez)
git clone https://github.com/SB3020202/Data-Modelation.git
cd Data-Modelation

# 2. Atualizar o projeto local antes de começar a trabalhar
git checkout master
git pull origin master --allow-unrelated-histories

# 3. Fazer alterações no projeto normalmente (editar, criar ficheiros, etc.)

# 4. Enviar (fazer push) das alterações para o GitHub
git add .
git commit -m "Mensagem com o que foi feito"
git push origin master

# 5. Se der erro ao fazer push (por exemplo: 'rejected')
git pull origin master --allow-unrelated-histories

# → Resolver conflitos que aparecem nos ficheiros (remover <<<<<, =======, >>>>>)
# → Depois de resolver os conflitos:
git add .
git commit -m "Resolução de conflitos"
git push origin master

# Notas finais:
# - Trabalhar SEMPRE na branch chamada 'master'
# - Confirmar a branch atual com: git branch
# - NÃO usar a branch 'main'
# - O push deve ir SEMPRE para origin master

#### Authors

- Guilherme Silva → [@guicdas](https://www.github.com/guicdas)
- Sidi Brahim → [@SB3020202](https://github.com/SB3020202)
- Francisco Malho → [@](https://github.com/)
>>>>>>> 4103bd14924892dfebae1a1f0c0bbec314f9bdc5
