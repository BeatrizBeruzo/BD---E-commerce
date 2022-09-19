-- criação do banco de dados para o cenário de e-commerce

create database ecommerce;

use ecommerce;

-- criando as tabelas

-- tabela cliente
Create Table clients (
idClient int auto_increment primary key,
Fname Varchar(45),
Minit char(3),
Lname varchar(20),
CPF char(11) not null,
Address varchar(255),
constraint unique_cpf_client unique (CPF)
);

ALTER TABLE clients CHANGE Address Address varchar(255); -- alterando a qtd de caracteres do campo

-- tabela produto
-- size = dimensãod o produto
Create Table product (
idProduct int auto_increment primary key,
Pname Varchar(45),
classification_kids bool default false,
category enum('Eletronic', 'Vestimenta', 'Brinquedos', 'Alimentos','Móveis') not null,
avaliation float default 0,
size varchar(10)
);

drop table payments;
create table payments(
id_payment int primary key,
typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
limitvaliable float
);
-- tablea pedido
Alter table payments change typePaymente typePayment enum('Boleto', 'Cartão', 'Dois cartões');

desc payments;

drop table orders;
Create Table orders(
idOrder int auto_increment primary key,
idOrderClient int,
OrderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
orderDescription varchar(255),
sendValue float default 10,
paymentCash bool default false,
constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

-- tabela estoque
create table productStorage(
idProductStorage int auto_increment primary key,
storagelocation varchar(255),
qauntity int default 0
);
ALTER TABLE productStorage CHANGE qauntity quantity int default 0;

-- tabela fornecedor

create table supplier(
idSupplier int auto_increment primary key,
SocialName varchar(255) not null,
CNPJ char(15) not null,
contact varchar(11) not null,
constraint unique_supplier unique (CNPJ)
);

-- tabela vendedor

create table seller(
idSeller int auto_increment primary key,
SocialName varchar(255) not null,
AbstName varchar(255),
CNPJ char(15),
CPF char(9),
location varchar(255),
contact varchar(11) not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
idPSeller int,
idProduct int,
prodQuantity int default 1,
primary key (idPSeller, idProduct),
constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
constraint fk_product_product foreign key (idProduct) references product(idproduct)
);

drop table productOrder;
create table productOrder(
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
primary key (idPOproduct, idPOorder),
constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storagelocation(
idLproduct int,
idLstorage int,
location varchar(255) not null,
primary key (idLproduct, idLstorage),
constraint fk_storage_location_product foreign key (idLproduct) references product(idproduct),
constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProductstorage)
);

create table productSupplier(
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct),
constraint fk_product_supplier_suppllier foreign key (idPsSupplier) references supplier(idSupplier),
constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
drop table orderpayments;
create table orderpayments(
idOPpayment int,
idOPorder int,
primary key(idOPpayment, idOPorder),
constraint fk_order_payments_payments foreign key (idOPpayment) references payments (id_payment),
constraint fk_order_order_payment foreign key (idOPorder) references orders (idOrder)
);

show tables;
desc payments;

show databases;

