use Hotel 


--a)Mostre os nomes dos h�spedes e a descri��o dos servi�os solicitados, para cada h�spede que solicitou servi�o no segundo semestre de 2023.
select h.nome,s.descri��o from Hospedes h, Servicos s , Solicitacoes so
where h.cpf = so.hospede and s.codServico =  so.servico and so.data between '01-07-2023' and '31-12-2023'





select * from Solicitacoes so
where so.data between '01-07-2023' and '31-12-2023'

--b) Exiba os dados dos servi�os solicitados por h�spedes cujo nome tenha �Santos� em qualquer parte. Ordene pela descri��o do servi�o.
select s.* from Servicos s , Solicitacoes so, Hospedes h
where s.codServico = so.servico and h.cpf = so.hospede and  h.nome like ('%Santos%')
order by s.descri��o



--c) Mostre os nomes dos h�spedes e as datas de suas estadias, para hospedes que tiveram estadias em quartos do tipo Standard ou Luxo Superior em 2012.
select h.nome,e.dataEntrada from Hospedes h, Estadias e, Quartos q
where h.cpf = e.hospede and q.numero = e.quarto and q.tipo in ('Standard','Luxo Superior') and e.dataEntrada between '01-01-2012' and '31-12-2012'


--d) Mostre as datas de entrada e sa�da das estadias realizadas por h�spedes que informaram a data de nascimento. Ordene pela data de entrada em ordem descendente.
select e.dataEntrada, e.dataSaida from Estadias e , Hospedes h
where h.cpf = e.hospede and h.dataNascimento is not null 
order by e.dataEntrada desc

select * from Hospedes order by nome

--e) Quais as datas e horas dos servi�os solicitados por h�spedes do sexo feminino?
select so.data, so.hora from Solicitacoes so , Hospedes h
where so.hospede = h.cpf and h.sexo = 'F'


--f) Mostre a quantidade de h�spedes por sexo.
select COUNT(h.sexo) from Hospedes h


--g) Mostre, para cada servi�o, a sua descri��o e uma m�dia de pre�os pagos, apenas para servi�os solicitados entre os anos de 2015 e 2018.
select s.descri��o, avg(s.preco) 'media de pre�o pago' from Servicos s, Solicitacoes so
where s.codServico = so.servico and so.data between '01-01-2015' and '31-12-2018'
group by s.descri��o 



--h) Exiba os distintos nomes dos h�spedes que tiveram estadias em quartos cujo valor da di�ria � maior que R$500, e que solicitaram servi�o de Lanchonete ou Passadeira.
select distinct h.nome from Hospedes h, Estadias e, Quartos q, Solicitacoes so, Servicos s
where h.cpf =e.hospede and h.cpf = so.hospede and q.numero = e.quarto and s.codServico = so.servico and q.valorDiaria > 500 and s.descri��o in('Lanchonete','Passadeira')
 


--i) Mostre, para cada quarto, o seu tipo, valor de di�ria e quantidade de estadias. Ordene pelo tipo do quarto.
select q.tipo, q.valorDiaria, count(*)'quantidade de estadias' from Quartos q , Estadias e
where q.numero = e.quarto
group by q.tipo, q.valorDiaria
order by q.tipo