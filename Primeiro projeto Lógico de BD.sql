-- inserção de dados e queries

use ecommerce;

show tables;

-- idCliente, fname, minit, lname, cpf, address
insert into Clients(Fname, Minit, Lname, CPF, Address)
values('Bia','F','Beruzo', '1234567', 'rua da bia, 1670, Penha - São Paulo'),
('Maria','J','Carioca', '7654321', 'rua da maria, 111, Morro do vidigal - Rio de Janeiro'),
('João','A','Paulista', '098765443', 'rua do joão, 2222, Belo horizonte - Minas Gerais'),
('Carlos','A','Rodrigues', '76664777', 'rua do carlos, 3333, Salvador - Bahia'),
('Patrícia','L','Neto', '5546483846', 'rua da Patrícia, 4444, 	Manaus - Amazonas');

select * from clients;

-- id product, pname, classification_kids, boolean, category, avaliation, size
insert into product(Pname, classification_kids, category, avaliation, size) values
('Fone de ouvido', false, 'Eletronic','4', null),
('Barbie', true, 'Brinquedos', '3',null),
('Cadeira gamer', true, 'Móveis','5', null),
('Chocolate', false, 'Alimentos', '2', null),
('Sofá retrátil', false, 'Móveis', '1', '3x57x80');

select * from product;

-- orders
delete from orders where idOrderClient in (1,2,3,4);
insert into orders(idOrderClient, orderstatus, orderDescription, sendValue, paymentCash) values
(11, default, 'compra via app', null, 1),
(12, default, 'compra via site', 50, 0),
(13,'Confirmado', null,null, 1),
(14, default, 'compra via web site', 150, 0);

select * from orders;

insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) values
(6,5,2,null),
(7,8,1,null),
(8,7,1,null);


insert into productstorage (storagelocation, quantity) values
('Rio de Janeiro', 1000),
('Rio de Janeiro', 500),
('São Paulo', 10),
('Natal', 100),
('Paraná',75),
('Manaus', 200),
('São Luís', 345);

select * from productStorage;

insert into storageLocation (idLproduct, idLstorage, location) values
(7,2,'SP'),
(8,4,'GO');

insert into supplier (SocialName, CNPJ, contact) values
('Alameda constant', '12345677890', '345678873'),
('Eletrônicos silva', '34987535783', '374937374'),
('Tipo Duli', '223473839374', '8364847224');

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
(1,7,500),
(1,6,400),
(2,8,633),
(3,9,5),
(2,7,10);

insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
('Tech eletronics', null, 12345678998754, null, 'Rio de Janeiro', 128365473),
('Botique Durgas', null, null, 123456783, 'São Paulo', 874649403),
('Kids World', null, 238465730982001, null, 'Rio Grande do Sul', 998763458);

insert into productSeller (idPseller, idProduct, prodQuantity) values
(1,6,80),
(2,7,10);

select * from productseller;

select count(*) from clients;

select * from clients c, orders o where c.idClient = idOrderClient;
-- qtd de clientes que fizeram pedidos
select count(*) from clients c, orders o where c.idClient = IdOrderClient;
-- recuperação de pedido com produto associado
select c.idClient, Fname, count(*) as Number_of_Orders from clients c
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder
Group by idClient;

-- recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_Orders from clients c
inner join orders o ON c.idClient = o.idOrderClient
Group by idClient;

insert into payments (id_payment, typepayment) values (1,'Cartão'), (2,'Cartão'), (3,'Dois Cartões');

select * from payments;

insert into orderpayments (idOPpayment, idOPorder) values (1,6), (2,7), (3,8);

select * from productstorage;
select storagelocation, sum(quantity) as 'Quantidade em estoque'
from productstorage
group by storagelocation
having sum(quantity) >100
order by quantity;

delete from productstorage where idproductstorage = 6;
update productstorage set idProductStorage = 7 where idProductStorage= 23;


