USE Ecommerce;

-- =====================================================
-- QUERY 01
-- Listar todos os clientes
-- =====================================================

SELECT * FROM Client;


-- =====================================================
-- QUERY 02
-- Listar clientes Pessoa Física
-- =====================================================

SELECT
    c.idClient,
    pf.Fname,
    pf.Lname,
    pf.CPF,
    c.Address
FROM Client c
INNER JOIN ClientPF pf
ON c.idClient = pf.idClient;


-- =====================================================
-- QUERY 03
-- Listar clientes Pessoa Jurídica
-- =====================================================

SELECT
    c.idClient,
    pj.SocialName,
    pj.TradeName,
    pj.CNPJ,
    c.Address
FROM Client c
INNER JOIN ClientPJ pj
ON c.idClient = pj.idClient;


-- =====================================================
-- QUERY 04
-- Produtos eletrônicos
-- =====================================================

SELECT *
FROM Product
WHERE Category='Eletrônico';


-- =====================================================
-- QUERY 05
-- Produtos com avaliação acima de 4.7
-- =====================================================

SELECT
    Pname,
    Category,
    Product_rating
FROM Product
WHERE Product_rating > 4.7;


-- =====================================================
-- QUERY 06
-- Produtos ordenados por avaliação
-- =====================================================

SELECT
    Pname,
    Product_rating
FROM Product
ORDER BY Product_rating DESC;


-- =====================================================
-- QUERY 07
-- Estoque do maior para o menor
-- =====================================================

SELECT *
FROM ProductStorage
ORDER BY quantity DESC;


-- =====================================================
-- QUERY 08
-- Pedidos confirmados
-- =====================================================

SELECT *
FROM Orders
WHERE orderStatus='Confirmado';


-- =====================================================
-- QUERY 09
-- Pedidos cancelados
-- =====================================================

SELECT *
FROM Orders
WHERE orderStatus='Cancelado';


-- =====================================================
-- QUERY 10
-- Clientes e seus pedidos
-- =====================================================

SELECT

c.idClient,

COALESCE(
CONCAT(pf.Fname,' ',pf.Lname),
pj.SocialName
) AS Cliente,

o.idOrder,
o.orderStatus,
o.sendValue

FROM Client c

LEFT JOIN ClientPF pf
ON c.idClient=pf.idClient

LEFT JOIN ClientPJ pj
ON c.idClient=pj.idClient

INNER JOIN Orders o
ON c.idClient=o.idOrderClient;


-- =====================================================
-- QUERY 11
-- Produtos presentes nos pedidos
-- =====================================================

SELECT

o.idOrder,

p.Pname,

po.poQuantity,

po.poStatus

FROM Orders o

INNER JOIN ProductOrder po
ON o.idOrder=po.idPOorder

INNER JOIN Product p
ON p.idProduct=po.idPOproduct;


-- =====================================================
-- QUERY 12
-- Relação Produto x Fornecedor
-- =====================================================

SELECT

p.Pname,

s.SocialName,

ps.quantity

FROM Product p

INNER JOIN ProductSupplier ps
ON p.idProduct=ps.idPsProduct

INNER JOIN Supplier s
ON s.idSupplier=ps.idPsSupplier;


-- =====================================================
-- QUERY 13
-- Relação Produto x Vendedor
-- =====================================================

SELECT

p.Pname,

se.SocialName,

ps.prodQuantity

FROM Product p

INNER JOIN ProductSeller ps
ON p.idProduct=ps.idProduct

INNER JOIN Seller se
ON se.idSeller=ps.idPseller;


-- =====================================================
-- QUERY 14
-- Produto e localização no estoque
-- =====================================================

SELECT

p.Pname,

st.storageLocation,

st.quantity,

sl.Location

FROM Product p

INNER JOIN StorageLocation sl
ON p.idProduct=sl.idLproduct

INNER JOIN ProductStorage st
ON st.idProdStorage=sl.idLstorage;


-- =====================================================
-- QUERY 15
-- Produto, fornecedor e estoque
-- =====================================================

SELECT

p.Pname,

s.SocialName,

st.storageLocation,

st.quantity

FROM Product p

INNER JOIN ProductSupplier ps
ON p.idProduct=ps.idPsProduct

INNER JOIN Supplier s
ON s.idSupplier=ps.idPsSupplier

INNER JOIN StorageLocation sl
ON p.idProduct=sl.idLproduct

INNER JOIN ProductStorage st
ON st.idProdStorage=sl.idLstorage;


-- =====================================================
-- QUERY 16
-- Pedidos com pagamento
-- =====================================================

SELECT

o.idOrder,

pay.paymentType,

po.valuePaid

FROM Orders o

INNER JOIN PaymentOrder po
ON o.idOrder=po.idOrder

INNER JOIN Payment pay
ON pay.idPayment=po.idPayment;


-- =====================================================
-- QUERY 17
-- Pedidos e entregas
-- =====================================================

SELECT

o.idOrder,

d.trackingCode,

d.deliveryStatus

FROM Orders o

INNER JOIN Delivery d
ON o.idOrder=d.idOrder;


-- =====================================================
-- QUERY 18
-- Clientes com suas formas de pagamento
-- =====================================================

SELECT

COALESCE(
CONCAT(pf.Fname,' ',pf.Lname),
pj.SocialName
) AS Cliente,

pay.paymentType,

pay.availableLimit

FROM Client c

LEFT JOIN ClientPF pf
ON c.idClient=pf.idClient

LEFT JOIN ClientPJ pj
ON c.idClient=pj.idClient

INNER JOIN Payment pay
ON pay.idClient=c.idClient;


-- =====================================================
-- QUERY 19
-- Produtos infantis
-- =====================================================

SELECT *

FROM Product

WHERE Classification_kids=1;


-- =====================================================
-- QUERY 20
-- Frete com acréscimo de 10%
-- =====================================================

SELECT

idOrder,

sendValue,

(sendValue*1.10) AS Frete_Com_Acrescimo

FROM Orders;

-- =====================================================
-- QUERY 21
-- Quantos pedidos cada cliente realizou?
-- =====================================================

SELECT

COALESCE(
CONCAT(pf.Fname,' ',pf.Lname),
pj.SocialName
) AS Cliente,

COUNT(o.idOrder) AS Total_Pedidos

FROM Client c

LEFT JOIN ClientPF pf
ON c.idClient=pf.idClient

LEFT JOIN ClientPJ pj
ON c.idClient=pj.idClient

LEFT JOIN Orders o
ON c.idClient=o.idOrderClient

GROUP BY Cliente

ORDER BY Total_Pedidos DESC;


-- =====================================================
-- QUERY 22
-- Clientes com mais de um pedido
-- =====================================================

SELECT

COALESCE(
CONCAT(pf.Fname,' ',pf.Lname),
pj.SocialName
) AS Cliente,

COUNT(o.idOrder) AS Total

FROM Client c

LEFT JOIN ClientPF pf
ON c.idClient=pf.idClient

LEFT JOIN ClientPJ pj
ON c.idClient=pj.idClient

INNER JOIN Orders o
ON c.idClient=o.idOrderClient

GROUP BY Cliente

HAVING COUNT(o.idOrder) > 1;


-- =====================================================
-- QUERY 23
-- Algum vendedor também é fornecedor?
-- =====================================================

SELECT

s.SocialName

FROM Supplier s

INNER JOIN Seller se

ON s.SocialName = se.SocialName;


-- =====================================================
-- QUERY 24
-- Relação de fornecedores e produtos
-- =====================================================

SELECT

s.SocialName,

p.Pname

FROM Supplier s

INNER JOIN ProductSupplier ps

ON s.idSupplier=ps.idPsSupplier

INNER JOIN Product p

ON p.idProduct=ps.idPsProduct

ORDER BY s.SocialName;


-- =====================================================
-- QUERY 25
-- Relação de produtos, fornecedores e estoques
-- =====================================================

SELECT

p.Pname,

s.SocialName,

st.storageLocation,

st.quantity

FROM Product p

INNER JOIN ProductSupplier ps
ON p.idProduct=ps.idPsProduct

INNER JOIN Supplier s
ON s.idSupplier=ps.idPsSupplier

INNER JOIN StorageLocation sl
ON p.idProduct=sl.idLproduct

INNER JOIN ProductStorage st
ON st.idProdStorage=sl.idLstorage;


-- =====================================================
-- QUERY 26
-- Quantidade de produtos fornecidos por fornecedor
-- =====================================================

SELECT

s.SocialName,

COUNT(ps.idPsProduct) AS Produtos

FROM Supplier s

INNER JOIN ProductSupplier ps

ON s.idSupplier=ps.idPsSupplier

GROUP BY s.SocialName

ORDER BY Produtos DESC;


-- =====================================================
-- QUERY 27
-- Fornecedores com mais de um produto
-- =====================================================

SELECT

s.SocialName,

COUNT(ps.idPsProduct) AS Produtos

FROM Supplier s

INNER JOIN ProductSupplier ps

ON s.idSupplier=ps.idPsSupplier

GROUP BY s.SocialName

HAVING COUNT(ps.idPsProduct)>1;


-- =====================================================
-- QUERY 28
-- Quantidade de produtos vendidos por vendedor
-- =====================================================

SELECT

se.SocialName,

COUNT(ps.idProduct) AS Produtos

FROM Seller se

INNER JOIN ProductSeller ps

ON se.idSeller=ps.idPseller

GROUP BY se.SocialName

ORDER BY Produtos DESC;


-- =====================================================
-- QUERY 29
-- Estoque total disponível
-- =====================================================

SELECT

SUM(quantity) AS Estoque_Total

FROM ProductStorage;


-- =====================================================
-- QUERY 30
-- Média das avaliações dos produtos
-- =====================================================

SELECT

AVG(Product_rating) AS Media_Avaliacao

FROM Product;


-- =====================================================
-- QUERY 31
-- Produto mais bem avaliado
-- =====================================================

SELECT

Pname,

Product_rating

FROM Product

WHERE Product_rating=(

SELECT MAX(Product_rating)

FROM Product

);


-- =====================================================
-- QUERY 32
-- Produto com menor avaliação
-- =====================================================

SELECT

Pname,

Product_rating

FROM Product

WHERE Product_rating=(

SELECT MIN(Product_rating)

FROM Product

);


-- =====================================================
-- QUERY 33
-- Produto com maior estoque
-- =====================================================

SELECT

storageLocation,

quantity

FROM ProductStorage

WHERE quantity=(

SELECT MAX(quantity)

FROM ProductStorage

);


-- =====================================================
-- QUERY 34
-- Produtos com estoque acima da média
-- =====================================================

SELECT

storageLocation,

quantity

FROM ProductStorage

WHERE quantity>

(

SELECT AVG(quantity)

FROM ProductStorage

);


-- =====================================================
-- QUERY 35
-- Quantidade de clientes PF e PJ
-- =====================================================

SELECT

'Pessoa Física' AS Tipo,

COUNT(*) AS Quantidade

FROM ClientPF

UNION

SELECT

'Pessoa Jurídica',

COUNT(*)

FROM ClientPJ;


-- =====================================================
-- QUERY 36
-- Clientes que possuem mais de uma forma de pagamento
-- =====================================================

SELECT

COALESCE(
CONCAT(pf.Fname,' ',pf.Lname),
pj.SocialName
) AS Cliente,

COUNT(pay.idPayment) AS Formas_Pagamento

FROM Client c

LEFT JOIN ClientPF pf
ON c.idClient=pf.idClient

LEFT JOIN ClientPJ pj
ON c.idClient=pj.idClient

INNER JOIN Payment pay
ON pay.idClient=c.idClient

GROUP BY Cliente

HAVING COUNT(pay.idPayment)>1;


-- =====================================================
-- QUERY 37
-- Situação do estoque utilizando CASE
-- =====================================================

SELECT

storageLocation,

quantity,

CASE

WHEN quantity>=150 THEN 'ALTO'

WHEN quantity>=80 THEN 'MÉDIO'

ELSE 'BAIXO'

END AS Nivel_Estoque

FROM ProductStorage;


-- =====================================================
-- QUERY 38
-- Classificação da avaliação dos produtos
-- =====================================================

SELECT

Pname,

Product_rating,

CASE

WHEN Product_rating>=4.8 THEN 'EXCELENTE'

WHEN Product_rating>=4.5 THEN 'MUITO BOM'

WHEN Product_rating>=4 THEN 'BOM'

ELSE 'REGULAR'

END AS Classificacao

FROM Product;


-- =====================================================
-- QUERY 39
-- Quantidade de pedidos por status
-- =====================================================

SELECT

orderStatus,

COUNT(*) AS Total

FROM Orders

GROUP BY orderStatus;


-- =====================================================
-- QUERY 40
-- Valor total pago por tipo de pagamento
-- =====================================================

SELECT

pay.paymentType,

SUM(po.valuePaid) AS Valor_Total

FROM Payment pay

INNER JOIN PaymentOrder po

ON pay.idPayment=po.idPayment

GROUP BY pay.paymentType

ORDER BY Valor_Total DESC;