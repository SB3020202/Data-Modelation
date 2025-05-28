
### Como usar o Git passo a passo
MDE 2024-2025


###Lab 1: usa SQL, Python, Java, CSS, HTML

###Lab 2: usa Prolog, Python, Java, CSS, HTML

###Lab 3: usa GOLOG, Python, Java, CSS, HTML

####1. Clonar o repositório (apenas na primeira vez)

```bash
git clone https://github.com/SB3020202/Data-Modelation.git
cd Data-Modelation
```

#### 2. Atualizar o prjeto local antes de começar a trabalhar

```bash
git checkout master
git pull origin master --allow-unrelated-histories
```

#### 3. Fazer alterações no projeto normalmente (editar, criar ficheiros, etc.)

#### 4. Enviar (fazer push) das alterações para o GitHub

```bash
git add .
git commit -m "Mensagem com o que foi feito"
git push origin master
```

#### Se der erro é porque não fizeram pull primeiro

```bash
git pull origin master
```

#### Notas finais:

#### - Trabalhar SEMPRE na branch chamada 'master'

#### - Confirmar a branch atual com: git branch

#### - O push deve ir SEMPRE para origin master

### Authors

- Guilherme Silva → [@guicdas](https://www.github.com/guicdas)
- Sidi Brahim → [@SB3020202](https://github.com/SB3020202)
- Francisco Malho → [@](https://github.com/)
