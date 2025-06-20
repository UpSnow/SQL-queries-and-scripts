use Hotel 


--a)Mostre os nomes dos hóspedes e a descrição dos serviços solicitados, para cada hóspede que solicitou serviço no segundo semestre de 2023.
select h.nome,s.descrição from Hospedes h, Servicos s , Solicitacoes so
where h.cpf = so.hospede and s.codServico =  so.servico and so.data between '01-07-2023' and '31-12-2023'





select * from Solicitacoes so
where so.data between '01-07-2023' and '31-12-2023'

--b) Exiba os dados dos serviços solicitados por hóspedes cujo nome tenha “Santos” em qualquer parte. Ordene pela descrição do serviço.
select s.* from Servicos s , Solicitacoes so, Hospedes h
where s.codServico = so.servico and h.cpf = so.hospede and  h.nome like ('%Santos%')
order by s.descrição



--c) Mostre os nomes dos hóspedes e as datas de suas estadias, para hospedes que tiveram estadias em quartos do tipo Standard ou Luxo Superior em 2012.
select h.nome,e.dataEntrada from Hospedes h, Estadias e, Quartos q
where h.cpf = e.hospede and q.numero = e.quarto and q.tipo in ('Standard','Luxo Superior') and e.dataEntrada between '01-01-2012' and '31-12-2012'


--d) Mostre as datas de entrada e saída das estadias realizadas por hóspedes que informaram a data de nascimento. Ordene pela data de entrada em ordem descendente.
select e.dataEntrada, e.dataSaida from Estadias e , Hospedes h
where h.cpf = e.hospede and h.dataNascimento is not null 
order by e.dataEntrada desc

select * from Hospedes order by nome

--e) Quais as datas e horas dos serviços solicitados por hóspedes do sexo feminino?
select so.data, so.hora from Solicitacoes so , Hospedes h
where so.hospede = h.cpf and h.sexo = 'F'


--f) Mostre a quantidade de hóspedes por sexo.
select COUNT(h.sexo) from Hospedes h


--g) Mostre, para cada serviço, a sua descrição e uma média de preços pagos, apenas para serviços solicitados entre os anos de 2015 e 2018.
select s.descrição, avg(s.preco) 'media de preço pago' from Servicos s, Solicitacoes so
where s.codServico = so.servico and so.data between '01-01-2015' and '31-12-2018'
group by s.descrição 



--h) Exiba os distintos nomes dos hóspedes que tiveram estadias em quartos cujo valor da diária é maior que R$500, e que solicitaram serviço de Lanchonete ou Passadeira.
select distinct h.nome from Hospedes h, Estadias e, Quartos q, Solicitacoes so, Servicos s
where h.cpf =e.hospede and h.cpf = so.hospede and q.numero = e.quarto and s.codServico = so.servico and q.valorDiaria > 500 and s.descrição in('Lanchonete','Passadeira')
 


--i) Mostre, para cada quarto, o seu tipo, valor de diária e quantidade de estadias. Ordene pelo tipo do quarto.
select q.tipo, q.valorDiaria, count(*)'quantidade de estadias' from Quartos q , Estadias e
where q.numero = e.quarto
group by q.tipo, q.valorDiaria
order by q.tipo