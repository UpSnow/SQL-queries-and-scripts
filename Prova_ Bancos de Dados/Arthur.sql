Create database Arthur
use Arthur


Create table PARTICIPANTES (
CPF int not null,
nome varchar (30) not null,
estado varchar (30) not null,


Primary Key (CPF),

)

Create table PALESTRANTES (
codP varchar (30) not null,
nome varchar (30) not null,
areaPesquisa varchar (30) ,


PRIMARY KEY (codP)
)


Create table EVENTOS (
Codigo varchar(40) not null,
palestrante varchar(30) not null,
data datetime,
vagas int ,

PRIMARY KEY (Codigo),
FOREIGN KEY (palestrante) REFERENCES PALESTRANTES (codP) 


)

Create table INSCRICOES (
participante int not null,
evento varchar (40) not null,
valor money,


FOREIGN KEY (participante) REFERENCES PARTICIPANTES (CPF),
FOREIGN KEY (evento) REFERENCES EVENTOS (Codigo),
check (valor> 0)
)

--2
alter table PARTICIPANTES add idade int
select * from PARTICIPANTES
alter table PALESTRANTES add instituicao varchar (50)
select * from PALESTRANTES
--3
insert into PARTICIPANTES (CPF,nome,estado) values('165498486', 'Lukas','PB')
insert into PALESTRANTES (codP,nome,areaPesquisa) values('15641879484', 'Marlon','Educação')