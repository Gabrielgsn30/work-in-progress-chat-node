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

[silde3](https://docs.google.com/presentation/d/1gDbvFr3d_7xmKSn9Vz6Jk4COM68NX7FWHvctzi9II1I/edit?usp=sharing)

Para dar build do dockerfile e gerar a imagem do projeto

```python
docker build -t nascimentogabriel/chatnode:v1 .
```

Para executar um container com a imagem gerada pelo build

```python
docker run -d --name chatnode -p 3000:3000 nascimentogabriel/chatnode:v1
```

Demonstrado como é o funcionamento do Docker desde da fase do dockerfile até a construção da imagem e a execução do container.


## Capitulo 4

Demonstrando o ambiente AWS

O que é o ECR(repositorio de imagens docker para AWS)

O que é o ECS e como utiliza-lo
Serviços do ECS(task-definition,services)

Criando um usuário, uma ECS, subindo a imagem para ECR e executando essa imagem na ECS:

-Para criar um usuário na AWS deve-se entrar no serviços IAM(onde faz o cadastro de usuarios e defini-se o que cada um pode acessar)

Clicar em adicionar usuarios
Incluir um nome para o usuario e definir se o usuario terá acesso programático ou acesso ao console AWS.
Isso define se o acesso será apenas pelo console ou se terá acesso na AWS pelo CLI,API ou outras ferramentas.
Após isso deve-se incluir políticas de acesso, quais sao os acessos que esse usuario terá dentro da AWS.

Após isso iremos subir a imagem gerada no docker localmente para o repositorio ECR(repositorio de imagens na AWS parecido com o Docker Hub)

Para isso devemos entrar no serviço ECR;
Após isso clicar em Create repository.
Deve-se selecionar se ele é um repositorio privado ou publico e definir um nome para o repositorio.
Após criar o repositorio a própria AWS da os comando aos quais deve-se conseguir executar para subir a imagem para o ECR
Lembrando que deve-se instalar o AWS cli para conseguir rodar esses comandos pelo prompt de comando.

Apos executar os comandos sua imagem vai estar no repositorio da AWS, apos isso iremos criar um ECS(ecs é um serviço da AWS onde podemos criar uma ou mais maquinas dentro de um cluster que está rodando docker e podemos subir os containeres através das task definitions e services)


Para criar um cluster ECS deverá entrar em ECS e ir na opção criar cluster

-para criar uma instancia na opção free tier deverá ser informado a opção EC2 linux  Networking
-Definir um nome para o cluster
-O tipo deve ser o t2.micro
-Numero de instancias 1
-volume 30gb
-key par pode ser criada uma para ser atribuida a instancia caso precise conectar na mesma
-VPC pode criar uma ou deixar a padrao.

Após isso pode dar um create


Agora iremos criar uma task definition e um service

para criar a task definition dentro do service do EECS ao lado esquerdo temos a opção task definition devemos clicar em -Create a new task definition
-Informar o nome da task
-Campo task role pode deixar em branco
-network mode deixar default
-na parte do container deve-se informar a porta 3000 e a container port 3000
-no campo imagens deve-se infromar a URI da imagem cadastrada na ECR
-apos isso salvar a task definition

Com a task definiton criada devemos criar um service para rodar essa task definiton

Ir na aba services e clicar na opçao crate:

-launch type EC2
-selecionar a task que foi criada
-a revisao tamvem
-definir um nome do serviço
-numero de task definir 1
minimum 0
maximum 100
apos isso pode deixar as opções selecionadas mesmo de dando next.

Após isso seu serviço estará funcionando e runing


Deverá entao entrar no serviço EC2 e alterar o grupo de seguranca da sua instancia

Neste caso deverá entrar em EC2, selecionar sua instancia e:

Após isso ir na aba Segurança
alterar a regra de segurança permitindo a porta TCP 3000 para os IPs 0.0.00.0/0
 Após isso ao acessar o ip da sua instancia no Broswer e a porta sua aplicação irá abrir.












## Capitulo 5
