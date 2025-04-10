# LAB 1 MDE 2024-2025
### Não se esqueçam de fazer Update do trabalho feito antes de Uploadar a vossa parte (senão dá erro)
#### Para fazer update com o trabalho dos outros

```bash
  git pull MDE master
```

#### Para fazer upload do vosso código

```bash
  git add *
  git commit -m "descrevam +- o que fizeram"
  git push MDE master
```


### [Para o francisco] 
Clica enter 3 vezes, nas prompts deste comando abaixo
```bash
  ssh-keygen
```
Dependendo de onde esta a file (algo como "file saved in (C/...)") fazes o comando cat para fazer print do ficheiro (haverá dois com o mesmo nome escolhes o que diz .pub no fim)
```bash
  cat C-...
```
Copias essa frase toda e adicionas à tua conta github onde diz ssh keys e guardas com o nome que quiseres.

Instala o git bash (se tiveres windows) e abre o terminal dentro da pasta onde queres o projeto.
```bash
  git init
  git remote add MDE git@github.com:SB3020202/MDE_LAB1.git
  git pull MDE master
```
