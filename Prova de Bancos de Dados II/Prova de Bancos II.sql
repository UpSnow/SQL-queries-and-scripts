use SCP_PROVA

--A
select c.nome,pr.nome, COUNT(*) as VezesCompradas from Cliente c
join Pedido p on c.codigo = p.cliente
join Itens i on p.codigo = i.pedido
join Produto pr on pr.codigo = i.produto
group by c.nome,pr.nome
having  count(*)>5

--B
create view ClientePedido as
select c.nome,count(*) as Total from Cliente c
join Pedido p on c.codigo = p.cliente
where DATEPART(yy,p.dataPedido) ='2023'
group by c.nome

select cli.nome from ClientePedido cli
where cli.Total in (select max(cl.Total) from ClientePedido cl)

--c
select pr.nome from Produto pr
	where pr.codigo in 
		(select i.produto from Itens i
			where i.pedido in 
				(select p.codigo from Pedido p
					where p.cliente in 
						(select c.codigo from Cliente c
							where c.tipo = 'PF')))
--D
Create procedure FunçãoD
@codigo int, @ano int as
select c.nome,pr.venda,p.dataPedido from Cliente c
join Pedido p on c.codigo = p.cliente
join Itens i on i.pedido = p.codigo
join Produto pr on pr.codigo = i.produto
where @codigo = p.codigo and DATEPART(yy,p.dataPedido) = @ano 


exec FunçãoD 10, 2007



--E
select pr.nome from Produto pr 
join Itens i on i.produto = pr.codigo
join Pedido p on p.codigo = i.pedido
Where DATEPART(yy,p.dataPedido) between '2020' and '2023' and pr.venda > (select avg(pr.venda) from Produto pr)


--F
select f.* from Funcionario f
join Pedido p on f.codigo = p.vendedor
where DATEPART(yy, p.dataPedido)= '2020' and f.email is not null and f.sexo = 'M'

