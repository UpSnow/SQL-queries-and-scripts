use Hotel


--a) Exiba os nomes de todos os hospedes.
select nome from Hospedes

--b) Exiba todos os dados dos serviços.
select * from Servicos

--c) Mostre o tipo, o valor da diária, e o lucro mensal de cada quarto (valor da diária * 31). Renomeie esta última coluna para Valor da Diária/Mês.
Select q.tipo, q.valorDiaria, q.valorDiaria * 31 AS 'Valor da Diária/Mês' From Quartos q

--d) Mostre a soma e a média dos preços de todos os serviços.
select sum(s.preco)'soma', avg(s.preco)'Media' from Servicos s

--e) Mostre o valor da diária do quarto mais caro e do mais barato.
select max(q.valorDiaria) 'Quarto mais caro', min(q.valorDiaria) 'Quarto mais barato' from Quartos q
select * from Quartos

--f) Exiba a data de nascimento do hóspede mais novo.
select max(dataNascimento) from Hospedes h

--g) Mostre quantos serviços foram solicitados pelo hóspede de CPF 922411035844.
select count(so.servico) from Solicitacoes so
where so.hospede ='922411035844' 

select so.servico from Solicitacoes so
where so.hospede = '922411035844'

--h) Mostre quantos hóspedes distintos já tiveram estadias.
select distinct count(e.hospede) from Estadias e

--i) Mostre a descrição, preço e o preço com 35% de aumento, de todos os serviços.
select s.descrição, s.preco, s.preco * 1.35 'preço com 35% de aumento' from Servicos s

--j) Quais os nomes dos hóspedes que nasceram no ano de 1990?
select h.nome from Hospedes h
where h.dataNascimento >= '1990-01-01' and h.dataNascimento <= '1990-12-31'

--k) Quais os dados dos quartos que possuem valor de diária maior que R$ 300?
select * from Quartos q
where q.valorDiaria > 300

--l) Mostre os dados de todos os hóspedes que tiveram estadias no ano de 2018.
select h.* from Estadias e, Hospedes h 
Where e.dataEntrada >= '2018-01-01' and e.dataEntrada <= '2018-12-31' and e.hospede = h.cpf

--m) Exiba os dados dos serviços solicitados em setembro de 2023.
select s.* from Servicos s, Solicitacoes so
where s.codServico = so.servico and so.data >= '2023-09-01' and so.data <= '2023-09-30'

--n) Exiba os nomes dos hóspedes e a hora da solicitação do serviço, para hospedes que solicitaram serviços de Lavanderia ou de Babá.
select h.nome, so.hora from Hospedes h, Solicitacoes so, Servicos s
where h.cpf = so.hospede and s.codServico = so.servico and s.descrição in ('Lavanderia ','Babá')
select count(so.servico) from Solicitacoes so
where so.servico in ('1','3')

--o) Mostre quantos serviços foram solicitados por hóspedes do sexo masculino, no primeiro semestre de 2012.
select h.cpf,h.nome,count(so.servico) from  Hospedes h, Solicitacoes so
Where h.cpf= so.hospede and h.sexo = 'M'
group by h.nome, h.cpf
select * from Solicitacoes
