
# Chown

<p align="center">
  <a href="https://www.ruby-lang.org/en/">
    <img src="https://img.shields.io/badge/Ruby-v3.0.0-green.svg" alt="ruby version">
  </a>
  <a href="http://rubyonrails.org/">
    <img src="https://img.shields.io/badge/Rails-v6.1.3.2-brightgreen.svg" alt="rails version">
  </a>
</p>

*Chown* é uma plataforma de transferência de titularidade de veículos.

## Experimente a aplicação

#### Fluxo da aplicação
 Acesse o [Chown](https://chown.herokuapp.com/)

1. Faça o login com uma das seguintes contas:
  1. email: user@example.com password: 1q2w3e4r 
  2. email: admin@example.com password: 1q2w3e4r
2. Adicione um Novo proprietário.
3. Adicione um veículo à esse proprietário. 
4. Vá na aba `Transferências` e click em `Nova Transferência`:
  1. Seleciona o veículo pela sua `placa`.
  2. Adicione a imagem do documento.
  3. Adicione os dados do comprador.
  4. Click em Transferir.

## Começando

### Codebase

*Chown* é construido em Ruby on Rails, Bulma e Stimulus.

### Pré-requisitos

- [Git](https://git-scm.com)
- [Docker](http://docker.com/): no mac, nós recomendamos utilizar o [Docker for Mac](https://docs.docker.com/docker-for-mac/)
- [docker-compose](https://docs.docker.com/compose/install/)

### Instalação

1. Tenha certeza de ter todos os pré-requisitos instalados.
1. Clone o repositório `git clone git@github.com:brunotoral/chown.git`
1. Construa o container de desenvolvimento `docker-compose build`. isso irá criar uma imagem
docker nomeada de `chown-dev`com todas as ferramentas requeridas.
1. Instale as dependência node com `docker-compose run runner yarn install`
1. Faça o setup do projeto com `docker-compose run runner bin/setup`
1. Inicie o servidor de desenvolvimento `docker-compose run rails`

Tudo pronto! Bom desenvolvimento! :tada:

### Rodando o APP

Você por rodar o servidor Rails usando o comando a seguir:

```sh
$ docker-compose up rails
```

Isso deixará a aplicação disponível em `localhost:3000`.

No caso de precisar rodar o servidor Webpack Dev, use o comando a seguir:

```sh
$ docker-compose up rails webpacker
```

### Rodando Rake Tasks

Você pode rodar qualquer Rake tasks, como `db:migrate`, usando o comando a seguir:

```sh
$ docker-compose run runner be rails <rake-task>
```
