USE Ecommerce;

-- =====================================================
-- CLIENTES
-- =====================================================

INSERT INTO Client (Address) VALUES
('Rua das Palmeiras, 120 - Rio de Janeiro'),
('Av. Brasil, 550 - São Paulo'),
('Rua Afonso Pena, 88 - Belo Horizonte'),
('Rua XV de Novembro, 220 - Curitiba'),
('Av. Oceânica, 410 - Salvador'),
('Rua Boa Vista, 97 - Recife'),
('Av. Beira Mar, 300 - Fortaleza'),
('Rua Goiás, 110 - Goiânia'),
('Rua das Flores, 87 - Florianópolis'),
('Av. Central, 60 - Brasília'),
('Rua Rio Branco, 98 - Vitória'),
('Rua Amazonas, 77 - Manaus'),
('Rua Dom Pedro II, 245 - Belém'),
('Av. Independência, 350 - Porto Alegre'),
('Rua Tiradentes, 54 - Campo Grande'),
('Av. Paulista, 1500 - São Paulo'),
('Rua das Acácias, 22 - Campinas'),
('Rua dos Andradas, 510 - Porto Alegre'),
('Av. Getúlio Vargas, 102 - Cuiabá'),
('Rua do Comércio, 180 - Niterói');

INSERT INTO ClientPF
(idClient, Fname, Mname, Lname, CPF)
VALUES
(1,'João','A','Silva','11111111111'),
(2,'Maria','B','Souza','22222222222'),
(3,'Pedro','C','Oliveira','33333333333'),
(4,'Ana','D','Costa','44444444444'),
(5,'Lucas','E','Santos','55555555555'),
(6,'Fernanda','F','Almeida','66666666666'),
(7,'Carlos','G','Pereira','77777777777'),
(8,'Juliana','H','Rocha','88888888888'),
(9,'Rafael','I','Martins','99999999999'),
(10,'Camila','J','Gomes','10101010101'),
(11,'Bruno','K','Ribeiro','12121212121'),
(12,'Patrícia','L','Dias','13131313131'),
(13,'Eduardo','M','Barbosa','14141414141'),
(14,'Amanda','N','Ferreira','15151515151'),
(15,'Thiago','O','Nunes','16161616161');

INSERT INTO ClientPJ
(idClient, SocialName, TradeName, CNPJ)
VALUES
(16,'Mercado Bom Preço LTDA','Bom Preço','11111111000111'),
(17,'Tech Solutions LTDA','Tech Solutions','22222222000122'),
(18,'Construtora Alpha S/A','Alpha','33333333000133'),
(19,'Farmácia Vida LTDA','Farmácia Vida','44444444000144'),
(20,'Papelaria Central LTDA','Papelaria Central','55555555000155');

-- =====================================================
-- PRODUTOS
-- =====================================================

INSERT INTO Product
(Pname, Classification_kids, Category, Product_rating, ProductSize)
VALUES
('Notebook Dell Inspiron',0,'Eletrônico',4.8,NULL),
('Smartphone Samsung Galaxy S24',0,'Eletrônico',4.9,NULL),
('Smart TV LG 55"',0,'Eletrônico',4.7,NULL),
('Mouse Gamer Logitech',0,'Eletrônico',4.6,NULL),
('Teclado Mecânico Redragon',0,'Eletrônico',4.5,NULL),
('Camiseta Nike Dry Fit',0,'Roupa',4.8,'M'),
('Calça Jeans Masculina',0,'Roupa',4.3,'42'),
('Vestido Floral',0,'Roupa',4.6,'G'),
('Tênis Adidas RunFalcon',0,'Roupa',4.9,'41'),
('Jaqueta Corta Vento',0,'Roupa',4.4,'GG'),
('Boneca Barbie Fashion',1,'Brinquedos',4.9,NULL),
('Carrinho Hot Wheels',1,'Brinquedos',4.8,NULL),
('Lego Classic',1,'Brinquedos',5.0,NULL),
('Quebra-Cabeça 1000 peças',1,'Brinquedos',4.7,NULL),
('Chocolate 90g',0,'Alimentos',4.9,NULL),
('Café Gourmet 500g',0,'Alimentos',4.8,NULL),
('Arroz Tipo 1 - 5kg',0,'Alimentos',4.5,NULL),
('Sofá Retrátil 3 Lugares',0,'Móveis',4.8,NULL),
('Mesa de Jantar 6 Lugares',0,'Móveis',4.7,NULL),
('Cadeira Office Ergonômica',0,'Móveis',4.9,NULL);

-- =====================================================
-- ESTOQUES
-- =====================================================

INSERT INTO ProductStorage
(storageLocation, quantity)
VALUES
('RJ-A1',120),
('RJ-A2',90),
('RJ-A3',45),
('RJ-A4',70),
('RJ-A5',60),
('SP-B1',150),
('SP-B2',130),
('SP-B3',80),
('SP-B4',75),
('SP-B5',65),
('MG-C1',95),
('MG-C2',140),
('MG-C3',110),
('MG-C4',55),
('MG-C5',200),
('PR-D1',180),
('PR-D2',170),
('SC-E1',25),
('SC-E2',15),
('GO-F1',50);

-- =====================================================
-- FORNECEDORES
-- =====================================================

INSERT INTO Supplier
(SocialName, CNPJ, Contact)
VALUES
('Tech Distribuidora','111111111111111','21990000001'),
('Fashion Brasil','222222222222222','21990000002'),
('Brinquedos Kids','333333333333333','21990000003'),
('Alimentos Premium','444444444444444','21990000004'),
('Móveis Brasil','555555555555555','21990000005'),
('Mega Eletrônicos','666666666666666','21990000006'),
('Casa Moderna','777777777777777','21990000007'),
('Logística Sul','888888888888888','21990000008'),
('Office Center','999999999999999','21990000009'),
('Super Imports','101010101010101','21990000010'),
('Fornecedor Alpha','111111111111112','21990000011'),
('Fornecedor Beta','111111111111113','21990000012'),
('Fornecedor Gama','111111111111114','21990000013'),
('Fornecedor Delta','111111111111115','21990000014'),
('Fornecedor Ômega','111111111111116','21990000015'),
('Fornecedor Sigma','111111111111117','21990000016'),
('Fornecedor Prime','111111111111118','21990000017'),
('Fornecedor Master','111111111111119','21990000018'),
('Fornecedor Global','111111111111120','21990000019'),
('Fornecedor Brasil','111111111111121','21990000020');

-- =====================================================
-- VENDEDORES
-- =====================================================

INSERT INTO Seller
(SocialName, AbstName, CNPJ, CPF, Location, Contact)
VALUES

('Tech Distribuidora','TECH','121212121212121',NULL,'Rio de Janeiro','21981110001'),
('Fashion Brasil','FASHION','131313131313131',NULL,'São Paulo','11981110002'),
('Loja Digital RJ','LDRJ','141414141414141',NULL,'Rio de Janeiro','21981110003'),
('Loja Premium SP','LPSP','151515151515151',NULL,'São Paulo','11981110004'),
('Casa Moderna','CASA','161616161616161',NULL,'Curitiba','41981110005'),
('Mega Eletrônicos','MEGA','171717171717171',NULL,'Belo Horizonte','31981110006'),
('Center Games','CGAMES','181818181818181',NULL,'Fortaleza','85981110007'),
('Móveis Brasil','MOVEIS','191919191919191',NULL,'Salvador','71981110008'),
('Info Store','INFO','202020202020202',NULL,'Brasília','61981110009'),
('Office Center','OFFICE','212121212121212',NULL,'Vitória','27981110010'),
('Loja Alpha','ALPHA','222222222222223',NULL,'Manaus','92981110011'),
('Loja Beta','BETA','222222222222224',NULL,'Belém','91981110012'),
('Loja Gama','GAMA','222222222222225',NULL,'Goiânia','62981110013'),
('Loja Delta','DELTA','222222222222226',NULL,'Florianópolis','48981110014'),
('Loja Ômega','OMEGA','222222222222227',NULL,'Recife','81981110015'),
('Loja Sigma','SIGMA','222222222222228',NULL,'João Pessoa','83981110016'),
('Loja Prime','PRIME','222222222222229',NULL,'Natal','84981110017'),
('Loja Master','MASTER','222222222222230',NULL,'Porto Alegre','51981110018'),
('Super Imports','SUPER','222222222222231',NULL,'Campinas','19981110019'),
('Fornecedor Brasil','FBRASIL','222222222222232',NULL,'Niterói','21981110020');

-- =====================================================
-- PEDIDOS
-- =====================================================

INSERT INTO Orders
(idOrderClient, orderStatus, orderDescription, sendValue)
VALUES
(1,'Confirmado','Compra de notebook',25.00),
(2,'Em processamento','Compra de smartphone',20.00),
(3,'Confirmado','Compra de televisão',35.00),
(4,'Cancelado','Compra de mouse gamer',15.00),
(5,'Confirmado','Compra de teclado mecânico',18.00),
(6,'Confirmado','Compra de camiseta',12.00),
(7,'Em processamento','Compra de calça jeans',15.00),
(8,'Confirmado','Compra de vestido',16.00),
(9,'Confirmado','Compra de tênis',20.00),
(10,'Confirmado','Compra de jaqueta',18.00),
(11,'Em processamento','Compra de boneca',10.00),
(12,'Confirmado','Compra de carrinho',10.00),
(13,'Confirmado','Compra de LEGO',15.00),
(14,'Cancelado','Compra de quebra-cabeça',12.00),
(15,'Confirmado','Compra de chocolate',8.00),
(16,'Confirmado','Compra de café',10.00),
(17,'Em processamento','Compra de arroz',12.00),
(18,'Confirmado','Compra de sofá',70.00),
(19,'Confirmado','Compra de mesa',65.00),
(20,'Confirmado','Compra de cadeira',30.00);

-- =====================================================
-- PRODUTO X PEDIDO
-- =====================================================

INSERT INTO ProductOrder
(idPOproduct,idPOorder,poQuantity,poStatus)
VALUES
(1,1,1,'Disponível'),
(2,2,1,'Disponível'),
(3,3,1,'Disponível'),
(4,4,2,'Disponível'),
(5,5,1,'Disponível'),
(6,6,3,'Disponível'),
(7,7,1,'Disponível'),
(8,8,2,'Disponível'),
(9,9,1,'Disponível'),
(10,10,1,'Disponível'),
(11,11,2,'Disponível'),
(12,12,3,'Disponível'),
(13,13,1,'Disponível'),
(14,14,1,'Indisponível'),
(15,15,5,'Disponível'),
(16,16,3,'Disponível'),
(17,17,2,'Disponível'),
(18,18,1,'Disponível'),
(19,19,1,'Disponível'),
(20,20,2,'Disponível');

-- =====================================================
-- PRODUTO X FORNECEDOR
-- =====================================================

INSERT INTO ProductSupplier
(idPsSupplier,idPsProduct,quantity)
VALUES
(1,1,100),
(2,2,80),
(6,3,50),
(6,4,120),
(6,5,70),
(2,6,200),
(2,7,180),
(2,8,140),
(2,9,100),
(2,10,90),
(3,11,150),
(3,12,250),
(3,13,90),
(3,14,80),
(4,15,500),
(4,16,350),
(4,17,400),
(5,18,25),
(5,19,18),
(5,20,60);

-- =====================================================
-- PRODUTO X VENDEDOR
-- =====================================================

INSERT INTO ProductSeller
(idPseller,idProduct,prodQuantity)
VALUES
(1,1,15),
(6,2,20),
(6,3,8),
(3,4,30),
(3,5,18),
(2,6,25),
(4,7,15),
(4,8,12),
(4,9,18),
(4,10,10),
(7,11,35),
(7,12,40),
(7,13,15),
(7,14,12),
(9,15,60),
(9,16,50),
(9,17,70),
(8,18,5),
(8,19,4),
(10,20,12);

-- =====================================================
-- LOCALIZAÇÃO DOS PRODUTOS
-- =====================================================

INSERT INTO StorageLocation
(idLproduct,idLstorage,Location)
VALUES
(1,1,'Corredor A'),
(2,2,'Corredor A'),
(3,3,'Corredor A'),
(4,4,'Corredor A'),
(5,5,'Corredor A'),
(6,6,'Corredor B'),
(7,7,'Corredor B'),
(8,8,'Corredor B'),
(9,9,'Corredor B'),
(10,10,'Corredor B'),
(11,11,'Corredor C'),
(12,12,'Corredor C'),
(13,13,'Corredor C'),
(14,14,'Corredor C'),
(15,15,'Corredor D'),
(16,16,'Corredor D'),
(17,17,'Corredor D'),
(18,18,'Corredor E'),
(19,19,'Corredor E'),
(20,20,'Corredor E');

-- =====================================================
-- FORMAS DE PAGAMENTO
-- =====================================================

INSERT INTO Payment
(idClient, paymentType, availableLimit)
VALUES
(1,'Cartão Crédito',5000.00),
(2,'PIX',NULL),
(3,'Cartão Débito',NULL),
(4,'Boleto',NULL),
(5,'Cartão Crédito',3500.00),
(6,'PIX',NULL),
(7,'Cartão Crédito',7000.00),
(8,'Cartão Débito',NULL),
(9,'PIX',NULL),
(10,'Cartão Crédito',6000.00),
(11,'Boleto',NULL),
(12,'PIX',NULL),
(13,'Cartão Crédito',2500.00),
(14,'Cartão Débito',NULL),
(15,'PIX',NULL),
(16,'Cartão Crédito',15000.00),
(17,'PIX',NULL),
(18,'Boleto',NULL),
(19,'Cartão Crédito',12000.00),
(20,'PIX',NULL);

-- Formas adicionais de pagamento
INSERT INTO Payment
(idClient, paymentType, availableLimit)
VALUES
(1,'PIX',NULL),
(3,'Cartão Crédito',4000.00),
(5,'Boleto',NULL),
(8,'PIX',NULL),
(10,'Cartão Débito',NULL);

INSERT INTO PaymentOrder
(idPayment,idOrder,valuePaid)
VALUES

(1,1,2500.00),
(2,2,4500.00),
(3,3,3200.00),
(4,4,150.00),
(5,5,450.00),
(6,6,120.00),
(7,7,180.00),
(8,8,260.00),
(9,9,520.00),
(10,10,390.00),
(11,11,180.00),
(12,12,75.00),
(13,13,350.00),
(14,14,110.00),
(15,15,18.00),
(16,16,35.00),
(17,17,32.00),
(18,18,4200.00),
(19,19,2600.00),
(20,20,950.00);

-- Pedido pago com duas formas

INSERT INTO PaymentOrder
(idPayment,idOrder,valuePaid)
VALUES
(21,1,100.00),
(22,3,800.00),
(23,5,50.00),
(24,8,40.00),
(25,10,90.00);

INSERT INTO Delivery
(idOrder,trackingCode,deliveryStatus)
VALUES

(1,'BR100000001','Entregue'),
(2,'BR100000002','Em Transporte'),
(3,'BR100000003','Entregue'),
(4,'BR100000004','Preparando'),
(5,'BR100000005','Entregue'),

(6,'BR100000006','Enviado'),
(7,'BR100000007','Em Transporte'),
(8,'BR100000008','Entregue'),
(9,'BR100000009','Enviado'),
(10,'BR100000010','Entregue'),

(11,'BR100000011','Preparando'),
(12,'BR100000012','Entregue'),
(13,'BR100000013','Em Transporte'),
(14,'BR100000014','Preparando'),
(15,'BR100000015','Entregue'),

(16,'BR100000016','Entregue'),
(17,'BR100000017','Enviado'),
(18,'BR100000018','Entregue'),
(19,'BR100000019','Em Transporte'),
(20,'BR100000020','Entregue');




