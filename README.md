# Cluster Docker Swarm com Vagrant

## 📋 Sobre o projeto

Este projeto tem como objetivo automatizar a criação e a configuração de um cluster Docker Swarm local, utilizando Vagrant e VirtualBox para provisionar quatro máquinas virtuais Linux.

A infraestrutura é composta por um nó Manager, responsável pelo gerenciamento do cluster, e três nós Workers, responsáveis pela execução dos serviços e contêineres conforme a orquestração do Docker Swarm.

O projeto foi desenvolvido com foco no aprendizado de infraestrutura como código (IaC), provisionamento automatizado e orquestração de contêineres.

## 🏗️ Arquitetura

O cluster é composto por quatro máquinas virtuais:

- **master:** nó Manager do Docker Swarm.
- **node01:** nó Worker.
- **node02:** nó Worker.
- **node03:** nó Worker.

O nó Manager gerencia o estado do cluster e distribui as tarefas entre os nós disponíveis. Os Workers recebem as instruções do Swarm e executam os serviços atribuídos.

## 🛠️ Tecnologias utilizadas

- **Vagrant:** provisionamento e configuração das máquinas virtuais.
- **VirtualBox:** plataforma de virtualização.
- **Docker:** execução de contêineres.
- **Docker Swarm:** orquestração de serviços distribuídos entre os nós.
- **Linux:** sistema operacional das máquinas virtuais.
- **Git e GitHub:** versionamento e hospedagem do projeto.

## ⚙️ Funcionalidades

- Criação automatizada de quatro máquinas virtuais.
- Configuração de endereços IP fixos.
- Instalação do Docker nas máquinas virtuais.
- Inicialização do Docker Swarm no nó Manager.
- Adição dos três nós Workers ao cluster.
- Verificação do estado e da disponibilidade dos nós.

## 💻 Pré-requisitos

- VirtualBox instalado.
- Vagrant instalado.
- Git instalado.
- Recursos de hardware suficientes para executar quatro máquinas virtuais simultaneamente.
- Conexão com a internet para baixar imagens e pacotes necessários durante a configuração.

## 🚀 Como executar

Após clonar o repositório, acesse a pasta do projeto e execute os comandos abaixo.

### 1. Iniciar as máquinas virtuais

```bash
vagrant up
```

Esse comando inicia o provisionamento das máquinas definidas no arquivo `Vagrantfile`.

### 2. Acessar o nó Manager

```bash
vagrant ssh master
```

### 3. Verificar os nós do cluster

Dentro do terminal do Manager, execute:

```bash
docker node ls
```

O comando permite verificar os nós registrados no cluster, seus papéis e seus estados.

### 4. Verificar os serviços do Swarm

```bash
docker service ls
```

Esse comando lista os serviços implantados no cluster.

## 🧠 Conhecimentos aplicados

- Infraestrutura como código (IaC).
- Provisionamento automatizado com Vagrant.
- Virtualização de ambientes Linux.
- Configuração de redes e endereços IP fixos.
- Administração de nós Manager e Worker.
- Orquestração de contêineres com Docker Swarm.
- Versionamento de código com Git.

## 🎯 Objetivo de aprendizagem

Consolidar os conhecimentos de Docker Swarm e Vagrant por meio da construção de um ambiente local com múltiplos nós, reduzindo a necessidade de configurações manuais e facilitando a reprodução da infraestrutura.

## 📌 Status do projeto

Projeto de estudo e laboratório de infraestrutura, desenvolvido para fins educacionais e evolução do portfólio técnico.
