use Clinica
--3. De acordo com o esquema criado na questão anterior, escreva scripts para inserção de dados nessas tabelas (pelo menos dois registros em cada tabela).
insert into Paciente (nome, cpf,sexo,idade,convenio) values ('Aliny Araujo', '14785236965', 'F', 27, 'Familia');
insert into Paciente values('Nivia Figueiredo','98745632187','F',21,'Trabalhista');
insert into Paciente (nome,cpf,sexo,idade) values ('Arthur Cezar', '12365478954', 'M',21);
insert into Paciente values ('João Marlon', '12345678912', 'M', 7, 'Familia');
insert into Paciente values (' Marlon', 1234567912, 'M', 7, 'Familia');

select * from Paciente


insert into Medico (nome, especialidade,turno,salario) values ('Adriano Franklin','Pediatra','manhã',15000.000);
insert into Medico values ('Simone Sousa','Geral', 'noite', 20000.000);
insert Medico (nome, especialidade, turno, salario) values ('Eudes Sousa','cardiologista', 'tarde', 250000.000);
insert into Medico values ('Snow','dentista', 'noite', 1000.00);
select * from Medico

insert into Consulta (paciente,medico,data,diagnostico, preco) values (4,1,2024-03-26,'Autismo',300.00);
insert into Consulta values (3,3,2022-07-05,'coração', 2000.00);
insert into Consulta (paciente,medico,data, diagnostico,preco) values (2,2,2021-02-20,'Gripe',100.00);
insert into Consulta values (1,2,2020-08-30,'Dengue',150.00);

select * from Consulta

 
--4. Realize consultas simples utilizando o comando SELECT atributo FROM tabela
select * from Consulta
select * from Medico
select * from Paciente
--5. Atualize os salários dos médicos pediatras para que eles ganhem o dobro.

--6. Atualize os preços das consultas para R$ 120,45.
update Consulta set preco = 120.45
--7. Exclua da tabela de médicos todos os que tiverem salário menor do que R$ 1500,00.
delete from Medico
Where salario < 1500.00
--8. Exclua da tabela de consultas todas as que custaram menos de R$ 80
delete from Consulta
Where preco < 80
--9. Altere a tabela consultas para incluir um campo horário.
alter table Consulta add horario datetime
alter table Cosnulta drop column horario 
--10. Exclua o campo diagnostico da tabela Consultas.
alter table Consulta drop column diagnostico
alter table Consulta add diagnostico varchar (20)
--11. Exclua a Tabela Consultas.
delete from Consulta
--12. Exclua a base de dados Clinica.
drop database Clinica