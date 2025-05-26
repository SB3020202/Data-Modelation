<pre lang="bash"><code>```bash # MDE 2024-2025 # -------------------------------------------- # SIGAM OS PASSOS ABAIXO PARA USAR O GIT CORRETAMENTE # -------------------------------------------- # 1. Clonar o repositório (apenas na primeira vez) git clone https://github.com/SB3020202/Data-Modelation.git cd Data-Modelation # 2. Atualizar o projeto local antes de começar a trabalhar git checkout master git pull origin master --allow-unrelated-histories # 3. Fazer alterações no projeto normalmente (editar, criar ficheiros, etc.) # 4. Enviar (fazer push) das alterações para o GitHub git add . git commit -m "Mensagem com o que foi feito" git push origin master # 5. Se der erro ao fazer push (por exemplo: 'rejected') git pull origin master --allow-unrelated-histories # → Resolver conflitos que aparecem nos ficheiros (remover <<<<<, =======, >>>>>) # → Depois de resolver os conflitos: git add . git commit -m "Resolução de conflitos" git push origin master # Notas finais: # - Trabalhar SEMPRE na branch chamada 'master' # - Confirmar a branch atual com: git branch # - NÃO usar a branch 'main' # - O push deve ir SEMPRE para origin master ```</code></pre>

#### Authors

- Guilherme Silva → [@guicdas](https://www.github.com/guicdas)
- Sidi Brahim → [@SB3020202](https://github.com/SB3020202)
- Francisco Malho → [@](https://github.com/)
