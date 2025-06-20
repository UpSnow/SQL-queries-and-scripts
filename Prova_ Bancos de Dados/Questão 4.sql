use Arthur
--A)
select p.nome, p.descricao, pe.dataPedido from Produto p , Itens i, Pedido pe
where p.codigo =i.produto and pe.codigo = i.pedido and pe.dataPedido between '01-01-2020' and '31-12-2022'
--B) 
select distinct c.nome, c.tipo from Cliente c, Funcionario f , Pedido pe 
where c.codigo = pe.cliente and f.codigo = pe.vendedor and f.bairro in ('Bessa','Manaíra')

--C) 
select f.nome, COUNT(*) 'Quantidade de Vendas em 2015' from Funcionario f ,Pedido pe
where f.codigo = pe.vendedor and pe.dataPedido between '01-01-2015' and '31-12-2015'
group by f.nome
--D) 
select p.nome, p.venda, count (*)'QUANTIDAE VENDIDA', sum(p.venda) 'SOMA DOS PREÇOS'  from Produto p, Itens i
WHERE p.codigo = i.produto and p.quantest > 100
group by p.nome, p.venda


--E)
select c.nome from Cliente c , Produto p, pedido pe, Itens i
where c.codigo = pe.cliente and i.produto = p.codigo and pe.codigo = i.pedido and c.cargo is not null and p.nome like '%pizza%' and pe.dataPedido between '01-01-2017' and '31-12-2017'