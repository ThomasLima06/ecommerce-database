-- criação do banco de dados para o cenário E-commerce
create database Ecommerce;
			use Ecommerce;

-- criar tabela Cliente
create table Client(
		idClient INT AUTO_INCREMENT PRIMARY KEY,
        Fname VARCHAR(12),
        Mname VARCHAR(1),
        Lname VARCHAR(20),
        CPF CHAR(11) NOT NULL,
        Address VARCHAR(30),
        CONSTRAINT unique_cpf_client UNIQUE (CPF)
        );
-- criar tabela Produto

-- Size = Tamanho do produto
create table Product(
		idProduct INT AUTO_INCREMENT PRIMARY KEY,
        Pname VARCHAR(30) NOT NULL,
        Classification_kids BOOL DEFAULT FALSE,
        Category ENUM('Eletrônico', 'Roupa', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
        Product_rating FLOAT DEFAULT 0,
        Size VARCHAR(10)
        );
        

	
-- criar tabela Pedido
create table Orders(
		idOrder INT AUTO_INCREMENT PRIMARY KEY,
		idOrderClient INT,
		orderStatus ENUM('Cancelado','Confirmado', 'Em processamento') DEFAULT 'Em Processamento',
		orderDescription VARCHAR(255),
		sendValue FLOAT DEFAULT 10,
        paymentCash BOOL DEFAULT FALSE,
		CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES Client(idClient)
	);
    
    -- criar tabela estoque
    create table  productStorage(
		idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
		storageLocation VARCHAR(255),
		quantity INT DEFAULT 0
	);
    
    -- criar tabela forncedor
    create table  Supplier(
		idSupplier INT AUTO_INCREMENT PRIMARY KEY,
		SocialName VARCHAR(255) NOT NULL,
        CNPJ CHAR(15) NOT NULL,
		Contact VARCHAR(11) NOT NULL,
        CONSTRAINT unique_supplier UNIQUE (CNPJ)
	);
    
    -- criar tabela vendedor
    create table  Seller(
		idSeller INT AUTO_INCREMENT PRIMARY KEY,
		SocialName VARCHAR(255) NOT NULL,
        AbstName VARCHAR(255),
        CNPJ CHAR(15),
		CPF CHAR(11),
        Location VARCHAR(255),
		Contact VARCHAR(11) NOT NULL,
        CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
        CONSTRAINT unique_cpf_seller UNIQUE (CPF)
	);
    
    
    -- criar tabela Produtos por vendedor terceiro
		create table productSeller(
        idPseller INT,
        idProduct INT,
        prodQuantity INT DEFAULT 1,
        PRIMARY KEY (idPseller, idProduct),
        CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
		CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
        );
     -- criar tabela Ordem X Produto
		 create table productOrder(
		 idPOproduct INT,
		 idPOorder INT,
		 poQuantity INT DEFAULT 1,
		 poStatus ENUM('Disponível', 'Indisponível') DEFAULT 'Disponível',
		 PRIMARY KEY (idPOproduct, idPOorder),
		 CONSTRAINT fk_PO_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
		 CONSTRAINT fk_PO_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
		 );
    
    -- criar tabela localização de estoque
		create table storageLocation(
        idLproduct INT,
        idLstorage INT,
        Location VARCHAR(255) NOT NULL,
        PRIMARY KEY (idLproduct, idLstorage),
        CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
        CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
        );
        
        -- criar tabela produtoxfornecedor
        create table productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
    );

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
