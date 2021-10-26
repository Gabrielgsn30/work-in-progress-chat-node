# Mini Curso de DevOps(Integração Github,Docker,AWS) work-in-progress-chat-node
Chat feito em Node js(com integração AWS usando banco de dados MongoDB)

🛠️ Ferramentas: [Nodejs](https://nodejs.org/en/download/) - [VSCODE](https://code.visualstudio.com/) - [GIT](https://git-scm.com/) - [GITHUB DESKTOP](https://desktop.github.com/) - [MongoDB](https://account.mongodb.com/account/login) - [Docker](https://docs.docker.com/get-docker/) - [CrossDomain-CORS](https://chrome.google.com/webstore/detail/cross-domain-cors/mjhpgnbimicffchbodmgfnemoghjakai?hl=pt-BR) - [AWS](https://aws.amazon.com/pt/)

Projeto já desenvolvido e pronto: [repositorio] (https://github.com/Gabrielgsn30/chat-node-docker)

Projeto em desenvolvimento: [respositorio] (https://github.com/Gabrielgsn30/work-in-progress-chat-node)

projeto utilizando como base o [site] (https://betterprogramming.pub/simple-chat-application-in-node-js-using-express-mongoose-and-socket-io-ee62d94f5804)

## Capitulo 1 DevOps

Explicando o que é DevOps

[slide1](https://docs.google.com/presentation/d/1TQ0lWC_LS-C45_yM1VevVFxpZMCrUI54HwsruHdYS5E/edit?usp=sharing)

## Capitulo 2 Proposta Projeto

Proposta do projeto e instalações necessárias

[slide2](https://docs.google.com/presentation/d/16fsnx5i7rG8i26nLHO2evghnJ-aFk9gJtogDRlT3Fds/edit?usp=sharing)

Configurando MongoDB:

Deverá entrar no link do mongodb citado em ferramentas e criar uma conta após criar a conta e selecionar o cluster free sua conta deverá estar parecido com a imagem abaixo:

![alt text](https://github.com/Gabrielgsn30/work-in-progress-chat-node/blob/main/img/painelmongodb.png)

Após isso entrar em Network Access e criar a regra:
0.0.0.0/0 dessa maneira poderá acessar seu banco de dados de qualquer lugar.


Deverá entrar também em Database Access e criar um usuario e senha.

Apos isso deverá criar uma database e em colection colocar o nome e a colection utilizada, conforme imagem abaixo.

![alt text](https://github.com/Gabrielgsn30/work-in-progress-chat-node/blob/main/img/collection.png)

Apos isso voltar para a tela principal e clicar em Connect, selecionar a opção conect your application, dessa forma será passada uma string de conexao, essa string deverá ser preenchida em seu server.js

linha 17 
```python
var dbUrl = 'mongodb+srv://gabriel:<password>@cluster0.cqidw.mongodb.net/myFirstDatabase?retryWrites=true&w=majority'
```

Executando projeto localmente:
**Para isso deve ter instalado pelo menos Nodejs em sua máquina localmente e entrado em cloud.mongodb e criado a database com a colection message e alterado a url da database para a sua em server.js*

Após fazer o download do projeto para executar o mesmo é bem simples, apenas dois passos:

```python
npm install -g nodemon
```

Após isso rodar o seguinte comando para executar o projeto:

```python
nodemon ./server.js
```

## Capitulo 3 Docker e Dockerfiles

Docker e Dockerfiles


## Capitulo 4

## Capitulo 5
