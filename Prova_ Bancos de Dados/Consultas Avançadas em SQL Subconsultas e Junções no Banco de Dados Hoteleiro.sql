use Hotel

select tipo from Quartos
where valorDiaria = (select max(valorDiaria)from Quartos) --usar sub-consulta pricinpalmente em funções prontas 
--"=" so quando temos uma linha de resultado 

select h.nome from Hospedes h, Solicitacoes so, Servicos s
where s.codServico= so.servico and h.CPF =so.hospede and s.preco> (select AVG(preco)from Servicos)


select nome from Hospedes 
where CPF in (
	select hospede from Solicitacoes 
		where servico in (
			select codServico from Servicos 
				where preco>(
					select avg(preco)from Servicos))) -- vatangem da sub-consulta, rapidez 

--Mostre os dados dos Hospedes que tiveram estadias em quartos Standard (Sub-consulta obrigatorio)

select * from Hospedes h
	where CPF in (
		select hospede from Estadias
			where quarto in(select numero from Quartos
					where tipo = 'Standard'))


--Join é mais rapizo em questão de performace.
-- Join tem quatros tipode de junções. 
-- interna: trais resultados que se combina
select h.nome, e.dataEntrada from Hospedes h join Estadias e on h.CPF = e.hospede join Quartos q on q.numero = e.quarto 
-- externa : trais resultados que não se combina
-- direita : right
select h.nome, e.dataEntrada from Hospedes h right join Estadias e on h.CPF = e.hospede join Quartos q on q.numero = e.quarto 
-- esquerda : left
select h.nome, e.dataEntrada from Hospedes h left join Estadias e on h.CPF = e.hospede join Quartos q on q.numero = e.quarto 








