use hotel
--g) Qual o nome do hóspede que teve mais estadias?
select h.nome, COUNT(*) as Total 
into result -- Cria um tabela do resultados 
from Hospedes h, Estadias e
where h.CPF = e.hospede
group by h.nome
----------------------------------------------------------------

select h.nome, COUNT(*) as Total 
into #result -- Cria uma tabela temporaria 
from Hospedes h, Estadias e
where h.CPF = e.hospede
group by h.nome

----------------------------------------------------------------

select r.nome from result r
where r.Total = (select max(r.Total) from result r)

select * from result

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
--Assunto Views:Cria uma tabela de visualização
Create view hospede_v as -- Cria uma tabela de visualizção para o usurario 
select  h.CPF, h.nome from Hospedes h
select * from hospede_v
----------------------------------------------------------------
Create view QtdEstadias as
select h.nome, COUNT(*) as Total 
from Hospedes h, Estadias e
where h.CPF = e.hospede
group by h.nome

select q.nome from QtdEstadias q
where q.Total = (select max(q.Total) from QtdEstadias q)
----------------------------------------------------------------
-- Apaga a view
Drop view hospede_v
Drop view QtdEstadias

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
--Assunto: clásula having e Funções
--Having regras: só é usada com "Group by" e é uma clásula de condições
select h.nome, COUNT(*) as Total from Hospedes h
join Estadias e on h.CPF = e.hospede
group by h.nome
having  COUNT(*) > 5
--Having: clasula de condicionar uma função junto com o "group by"
--Funções especificas para o SQLServer
select getdate() -- Mostra a data atual 
select DATEPART(yy,getdate()) -- mostra o ano atual		
select DATEPART(mm,getdate()) -- mostra Mes atual	
select DATEPART(dd,getdate()) -- mostra o dia atual 
----------------------------------------------------------------
select datename(mm,getdate()) -- mostra o nome do mês atual
----------------------------------------------------------------
-- Quais foram as estadias realizadas nos últimos 5 anos?
select * from Estadias e
where DATEDIFF(yy,dataEntrada,getdate())<= 5







