--1. Crie uma base de dados, com o nome Clinica
CREATE DATABASE Clinica
use Clinica

--2. Escreva os scripts de criação das tabelas Pacientes, Médicos e Consultas de acordo com a descrição abaixo:
--Pacientes (codP (PK), nome, cpf, sexo, idade, convenio)
--Medicos (codM (PK), nome, especialidade, turno, salario)
--Consultas (paciente (FK), medico (FK), data, diagnostico, preco)
	--paciente referencia Pacientes (codP)
	--medico referencia Medicos (codM)


CREATE TABLE Paciente (
codP int identity,
nome varchar (90)not null,
cpf varchar (30) not null,
sexo char(1) not null,
idade int not null,
convenio varchar (30) default 'Individual'

Primary key (codP),
unique (cpf),
check (sexo in ('M','F')),
check (convenio in ('Individual','Familia', 'Trabalhista'))

)

CREATE TABLE Medico(
codM int identity,
nome varchar (30) not null,
especialidade varchar (80) not null,
turno varchar (20) not null,
salario numeric (10,3) not null,

Primary Key (codM),
check (turno in ('manhã','tarde','noite'))


)
CREATE TABLE Consulta (
paciente int not null,
medico int not null,
data datetime,
diagnostico varchar (80),
preco numeric (10,3) not null,



Foreign key (paciente) references Paciente, 
Foreign key (medico) references Medico,

)
select * from Paciente
select * from Medico
select * from Consulta

