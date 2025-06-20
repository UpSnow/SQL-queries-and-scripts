--1. Crie uma base de dados, com o nome Hotel.
CREATE DATABASE Hotel 
USE Hotel 
--2. De acordo com o modelo relacional abaixo, realize as seguintes consultas utilizando a linguagem  SQL:
--Hospedes (CPF (PK), nome, endereço, sexo, dataNascimento)
--Quartos (numero (PK), tipo, valorDiaria)
--Estadias (hospede (FK), quarto (FK), dataEntrada, dataSaida)
	--hospede referencia Hospedes
	--quarto referencia Quartos
--Servicos (codServico (PK), decsricao, preco)
--Solicitacoes (hospede (FK), servico (FK), data, hora)
	--hospede referencia Hospedes
	--servico referencia Servicos

Create table Hospedes (
cpf varchar (30) not null,
nome varchar (50) not null,
endereco varchar (60) ,
sexo char (1),
dataNascimento datetime,

Primary key (cpf),
check (sexo in ('M','F'))
)

Create table Quartos (
numero int not null,
tipo varchar (40),
valorDiaria money ,

Primary Key (numero),

check (valorDiaria > 0)
)
create table Estadias(
hospede varchar (30) not null,
quarto int not null,
dataEntrada datetime,
dataSaida datetime,

Foreign key (hospede) references Hospedes,
Foreign key (quarto) references Quartos,
check (dataSaida > dataEntrada)
)
Create table Servicos (
codServico varchar (30) not null,
descrição varchar (60),
preco money,
  
Primary Key (codServico),
check (preco > 0)
)

Create table Solicitacoes (
hospede varchar (30) not null,
servico varchar (30) not null,
data datetime,
hora datetime,


Foreign Key (hospede) references Hospedes,
Foreign Key (servico) references Servicos

)
drop table Estadia
