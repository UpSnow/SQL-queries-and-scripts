

--a) Mostre, para cada serviço, a sua descrição e uma média de preços pagos, apenas para serviços solicitados entre os anos de 2015 e 2018. Mostre apenas serviços cuja média de preços pagos seja maior que R$60.
select s.descricao, Avg(s.preco) as MediaPreco from Servicos s
join Solicitacoes so on s.codServico =so.servico
where so.data between '01/01/2015' and '31/12/2018'
group by s.descricao
having Avg(s.preco)>60

--Professora
-------------------------------------------------------------------------------------------------------
select s.descricao, Avg(s.preco) as MediaPreco from Servicos s
join Solicitacoes so on s.codServico =so.servico
where DATEPART(yy,so.data) between '2015' and '2018'
group by s.descricao
having Avg(s.preco)>60
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
--b) Mostre, para cada quarto, o seu tipo, valor de diária e quantidade de estadias. Mostre apenas os quartos que tiveram mais do que 10 estadias. Ordene pelo tipo do quarto.
select q.tipo, q.valorDiaria, count(*) as QuantEstadia from Quartos q 
join Estadias e on e.quarto = q.numero
group by q.tipo, q.valorDiaria
having count(*)> 10
order by q.tipo 
-------------------------------------------------------------------------------------------------------

 --Teste
Create View QuantEstadias as
select q.tipo, q.valorDiaria, count(*) as QuantEstadia from Quartos q 
join Estadias e on e.quarto = q.numero
group by q.tipo, q.valorDiaria
having count(*)> 10

select * from QuantEstadias q
order by q.tipo
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
--c) Crie uma Stored procedure que, passando como parâmetro de entrada o número do quarto, mostre as datas de estadias que ele teve.
Create Procedure QuantoEstadia
	@num int as 
		begin
		select e.dataEntrada, e.dataSaida from Estadias e
			join Quartos q on e.quarto =q.numero
			where  q.numero = @num
		end


exec QuantoEstadia 220
select * from Quartos
--Professora
-------------------------------------------------------------------------------------------------------
Create Procedure QtdEstadiasQuarto
@numeroquarto int as
Begin
	Select dataEntrada, dataSaida
	From Estadias
	Where quarto = @numeroquarto
End

Exec QtdEstadiasQuarto 220
Exec QtdEstadiasQuarto 330
drop procedure QtdEstadiasQuarto
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
--d) Crie uma Stored procedure que, passando como parâmetro de entrada a descrição do serviço, mostre como parâmetro de saída uma média de preços pagos na solicitação do mesmo.
Create procedure ServicoSolicao
@descr varchar (80), @media float output as
	begin
		select @media = AVG(s.preco)  from Servicos s
		Where s.descricao = @descr
	end

declare @media float
exec ServicoSolicao 'Lavanderia', @media output
select @media

drop procedure ServicoSolicao
--Professora
-------------------------------------------------------------------------------------------------------

Create Procedure MediaPrecoServ
@descricaoServico varchar (50), @mediaValores float OUTPUT
as
Begin
	
	Select @mediaValores = AVG (se.preco)
	From Servicos se, Solicitacoes so
	Where se.codServico = so.servico and se.descricao = @descricaoServico
End

Declare @mediaValores float
Exec MediaPrecoServ 'Lavanderia', @mediaValores OUTPUT
Select @mediaValores



drop procedure ServicoSolicao
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

--e) Crie uma Stored procedure que, passando como parâmetro de entrada a data da solicitação, mostre as descrições do serviço solicitados naquela data, o nome e sexo do hóspede que o solicitou.
create procedure Solicitacao 
@data date as 
	begin
		select s.descricao, h.nome, h.sexo from Solicitacoes so
		join Servicos s on so.servico = s.codServico
		join Hospedes h on h.CPF = so.hospede
			 Where so.data = @data
	end

 exec Solicitacao '15-10-2022'
 drop procedure Solicitacao

 --Teste
 select * from Solicitacoes
 order by Solicitacoes.data
  select * from Servicos

--Professora
-------------------------------------------------------------------------------------------------------
  Create Procedure ServicoPorData
@dataSolicitacao datetime as
Begin
	Select se.descricao, h.nome, h.sexo
	From Servicos se JOIN Solicitacoes so on se.codServico = so.servico JOIN Hospedes h on h.CPF = so.hospede
	Where so.data = @dataSolicitacao
End

Exec ServicoPorData '15-10-2022'

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------


--f) Crie uma Stored procedure que, passando como parâmetro de entrada a data da solicitação do serviço, mostre a descrição dos serviços e os nomes dos hóspedes que solicitaram naquela data.
Create procedure servicoSoli
@data date as
	begin
		select s.descricao, h.nome from Solicitacoes so
		join Servicos s on s.codServico = so.servico
		join Hospedes h on so.hospede = h.CPF
			where so.data = @data
	end

exec servicoSoli '15-10-2022'


