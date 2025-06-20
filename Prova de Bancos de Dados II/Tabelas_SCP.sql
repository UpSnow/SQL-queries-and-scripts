CREATE DATABASE SCP_PROVA

USE SCP_PROVA

Create Table Cliente (
codigo int not null,
nome varchar(40) not null,
tipo char(2) not null,
contato varchar(30),
cargo varchar(30),
endereco varchar(50) not null,
cep varchar(10),
fone varchar(16),
fax varchar(16),
obs text,

CONSTRAINT pk_Cliente PRIMARY KEY (codigo),
CONSTRAINT ck_Cliente_Tipo CHECK (tipo IN ('PF','PJ')),
)

Create Table Produto (
codigo int not null,
nome varchar(40) not null,
descricao varchar(45) not null,
apresent varchar(30),
venda money not null,
custo money not null,
quantest int not null,
estmin int,
situacao char(1),

CONSTRAINT pk_Produto PRIMARY KEY (codigo),
CONSTRAINT un_Nome_Produto UNIQUE (nome),
CONSTRAINT ck_Produto_Situacao CHECK (situacao IN ('N','S','D'))
)

Create Table Funcionario (
codigo int not null,
nome varchar(40) not null,
sexo char(1) not null,
estcivil char(1) not null,
rg varchar(15) not null,
cpf varchar(12) not null,
datanasc date not null,
dataadm date not null,
endereco varchar(40) not null,
complemento varchar(20),
bairro varchar(20),
cep varchar(10),
fone varchar(10),
celular varchar(10),
salario money,
email varchar(40),
Obs text,

CONSTRAINT pk_Funcionario PRIMARY KEY (codigo),
CONSTRAINT ck_Funcionario_Sexo CHECK ( sexo IN ('M','F')),
CONSTRAINT ck_Funcionario_EstCivil CHECK ( estcivil IN ('S','C', 'D', 'V', 'O')),
CONSTRAINT un_Funcionario_Rg  UNIQUE (rg),
CONSTRAINT un_Funcionario_Cpf UNIQUE (cpf),
)

Create Table Pedido (
codigo int not null,
cliente int not null,
vendedor int not null,
dataPedido date not null,
dataFatura date,
via char(1),
frete money,

CONSTRAINT pk_Pedido PRIMARY KEY (codigo),
CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (cliente) REFERENCES Cliente,
CONSTRAINT fk_Pedido_Funcionario FOREIGN KEY (vendedor) REFERENCES Funcionario,
CONSTRAINT ck_via_pedido CHECK (via IN ('A','T','M'))
)

Create Table Itens (
pedido int not null,
produto int not null,
preco money,
quant int not null,
desconto decimal(4,1) not null,

CONSTRAINT pk_Itens PRIMARY KEY (pedido,produto),
CONSTRAINT fk_Itens_Pedido FOREIGN KEY (pedido) REFERENCES Pedido,
CONSTRAINT fk_Itens_Produto FOREIGN KEY (produto) REFERENCES Produto
)