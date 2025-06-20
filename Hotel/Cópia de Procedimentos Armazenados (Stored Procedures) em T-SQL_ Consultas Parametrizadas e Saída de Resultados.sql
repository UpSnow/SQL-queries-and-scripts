--T-SQL: estudar futuramente.
--Consulta par hospedes que tiveram estadia em 2021
select h.nome from Hospedes h 
join Estadias e on h.CPF = e.hospede
where DATEPART(yy,e.dataEntrada) = 2021


-- Stored Procedures
CREATE PROCEDURE HospedesAno -- Criando o procedure
@ano int as -- Varaivel 
	begin -- Sintaxe para come�ar
		select h.nome from Hospedes h 
		join Estadias e on h.CPF = e.hospede
		where DATEPART(yy, e.dataEntrada) =@ano
	end --Sintaxe para terminar

exec HospedesAno 2021 -- Forma de executar o store procedure

-- Crie uma stored procedure que, passando como par�mentro  de entrada o nome do h�spede, mostre a quantidade de estadias que o mesmo teve no hotel.
create procedure QuantEstadia 
@nome varchar (80) as
	begin
		select COUNT(*) as QuantidadeEstadia from Hospedes h
		join Estadias e on h.CPF = e.hospede
		where h.nome in(@nome)
	end

exec QuantEstadia 'John Smith'

--Com par�metro de saida

Create procedure QuantEst 
@nome varchar (50), @Quant int output as
	begin
		select @Quant = COUNT(*) from Hospedes h
		join Estadias e on h.CPF = e.hospede
			Where  h.nome = @nome
	end
declare @quant int
exec QuantEst 'John Smith', @Quant output
select @Quant 
drop procedure QuantEst


-- Deu errado
--op��es: Drop, altera ou mudar o nome 
drop procedure QuantEstadia

Alter procedure QuantEstadia 
@nome varchar  as -- teste de alterar 
	begin
		select COUNT(*) as QuantidadeEstadia from Hospedes h
		join Estadias e on h.CPF = e.hospede
		where h.nome = (@nome)
	end