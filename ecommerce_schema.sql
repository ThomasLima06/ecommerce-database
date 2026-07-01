-- criação do banco de dados para o cenário E-commerce


-- =====================================================
-- CRIAÇÃO DO BANCO
-- =====================================================

CREATE DATABASE Ecommerce;
USE Ecommerce;

-- =====================================================
-- CLIENTE
-- =====================================================

CREATE TABLE Client(
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL
);

-- =====================================================
-- CLIENTE PESSOA FÍSICA
-- =====================================================

CREATE TABLE ClientPF(
    idClient INT PRIMARY KEY,
    Fname VARCHAR(20) NOT NULL,
    Mname VARCHAR(5),
    Lname VARCHAR(30) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,

    CONSTRAINT fk_client_pf
    FOREIGN KEY(idClient)
    REFERENCES Client(idClient)
);

-- =====================================================
-- CLIENTE PESSOA JURÍDICA
-- =====================================================

CREATE TABLE ClientPJ(
    idClient INT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    TradeName VARCHAR(255),
    CNPJ CHAR(14) NOT NULL UNIQUE,

    CONSTRAINT fk_client_pj
    FOREIGN KEY(idClient)
    REFERENCES Client(idClient)
);

-- =====================================================
-- PRODUTO
-- =====================================================

CREATE TABLE Product(
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(30) NOT NULL,
    Classification_kids BOOLEAN DEFAULT FALSE,
    Category ENUM(
        'Eletrônico',
        'Roupa',
        'Brinquedos',
        'Alimentos',
        'Móveis'
    ) NOT NULL,
    Product_rating FLOAT DEFAULT 0,
    ProductSize VARCHAR(10)
);

-- =====================================================
-- PEDIDOS
-- =====================================================

CREATE TABLE Orders(
    idOrder INT AUTO_INCREMENT PRIMARY KEY,

    idOrderClient INT NOT NULL,

    orderStatus ENUM(
        'Cancelado',
        'Confirmado',
        'Em processamento'
    ) DEFAULT 'Em processamento',

    orderDescription VARCHAR(255),

    sendValue DECIMAL(10,2) DEFAULT 10.00,

    CONSTRAINT fk_orders_client
    FOREIGN KEY(idOrderClient)
    REFERENCES Client(idClient)
);

-- =====================================================
-- ESTOQUE
-- =====================================================

CREATE TABLE ProductStorage(
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- =====================================================
-- FORNECEDOR
-- =====================================================

CREATE TABLE Supplier(
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL UNIQUE,
    Contact VARCHAR(11) NOT NULL
);

-- =====================================================
-- VENDEDOR
-- =====================================================

CREATE TABLE Seller(
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15) UNIQUE,
    CPF CHAR(11) UNIQUE,
    Location VARCHAR(255),
    Contact VARCHAR(11) NOT NULL
);

-- =====================================================
-- PRODUTO X VENDEDOR
-- =====================================================

CREATE TABLE ProductSeller(
    idPseller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,

    PRIMARY KEY(idPseller,idProduct),

    CONSTRAINT fk_product_seller
    FOREIGN KEY(idPseller)
    REFERENCES Seller(idSeller),

    CONSTRAINT fk_product_product
    FOREIGN KEY(idProduct)
    REFERENCES Product(idProduct)
);

-- =====================================================
-- PRODUTO X PEDIDO
-- =====================================================

CREATE TABLE ProductOrder(
    idPOproduct INT,
    idPOorder INT,

    poQuantity INT DEFAULT 1,

    poStatus ENUM(
        'Disponível',
        'Indisponível'
    ) DEFAULT 'Disponível',

    PRIMARY KEY(idPOproduct,idPOorder),

    CONSTRAINT fk_po_product
    FOREIGN KEY(idPOproduct)
    REFERENCES Product(idProduct),

    CONSTRAINT fk_po_order
    FOREIGN KEY(idPOorder)
    REFERENCES Orders(idOrder)
);

-- =====================================================
-- LOCALIZAÇÃO DO ESTOQUE
-- =====================================================

CREATE TABLE StorageLocation(
    idLproduct INT,
    idLstorage INT,
    Location VARCHAR(255) NOT NULL,

    PRIMARY KEY(idLproduct,idLstorage),

    CONSTRAINT fk_storage_location_product
    FOREIGN KEY(idLproduct)
    REFERENCES Product(idProduct),

    CONSTRAINT fk_storage_location_storage
    FOREIGN KEY(idLstorage)
    REFERENCES ProductStorage(idProdStorage)
);

-- =====================================================
-- PRODUTO X FORNECEDOR
-- =====================================================

CREATE TABLE ProductSupplier(
    idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,

    PRIMARY KEY(idPsSupplier,idPsProduct),

    CONSTRAINT fk_product_supplier_supplier
    FOREIGN KEY(idPsSupplier)
    REFERENCES Supplier(idSupplier),

    CONSTRAINT fk_product_supplier_product
    FOREIGN KEY(idPsProduct)
    REFERENCES Product(idProduct)
);

-- =====================================================
-- PAGAMENTO
-- =====================================================

CREATE TABLE Payment(
    idPayment INT AUTO_INCREMENT PRIMARY KEY,

    idClient INT NOT NULL,

    paymentType ENUM(
        'Cartão Crédito',
        'Cartão Débito',
        'PIX',
        'Boleto'
    ) NOT NULL,

    availableLimit DECIMAL(10,2),

    CONSTRAINT fk_payment_client
    FOREIGN KEY(idClient)
    REFERENCES Client(idClient)
);

-- =====================================================
-- PAGAMENTO X PEDIDO
-- =====================================================

CREATE TABLE PaymentOrder(
    idPayment INT,
    idOrder INT,

    valuePaid DECIMAL(10,2),

    PRIMARY KEY(idPayment,idOrder),

    CONSTRAINT fk_po_payment
    FOREIGN KEY(idPayment)
    REFERENCES Payment(idPayment),

    CONSTRAINT fk_po_order_payment
    FOREIGN KEY(idOrder)
    REFERENCES Orders(idOrder)
);

-- =====================================================
-- ENTREGA
-- =====================================================

CREATE TABLE Delivery(
    idDelivery INT AUTO_INCREMENT PRIMARY KEY,

    idOrder INT UNIQUE,

    trackingCode VARCHAR(30),

    deliveryStatus ENUM(
        'Preparando',
        'Enviado',
        'Em Transporte',
        'Entregue'
    ),

    CONSTRAINT fk_delivery_order
    FOREIGN KEY(idOrder)
    REFERENCES Orders(idOrder)
);