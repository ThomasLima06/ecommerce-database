# 📦 Banco de Dados - E-commerce (MySQL)

## 📖 Sobre o projeto

Este projeto consiste na modelagem e implementação de um banco de dados relacional para um sistema de E-commerce utilizando MySQL.

O objetivo foi aplicar conceitos de modelagem lógica, integridade referencial e consultas SQL avançadas, simulando um ambiente real de comércio eletrônico.

Além da modelagem base, foram aplicados refinamentos propostos no desafio:

- Separação de clientes em Pessoa Física (PF) e Pessoa Jurídica (PJ)
- Um cliente pode possuir múltiplas formas de pagamento
- Controle de entrega com status e código de rastreio

---

## 🧱 Modelo do banco de dados

O sistema é composto pelas seguintes tabelas:

- Client
- ClientPF
- ClientPJ
- Product
- Orders
- ProductStorage
- Supplier
- Seller
- ProductSeller
- ProductSupplier
- ProductOrder
- StorageLocation
- Payment
- PaymentOrder
- Delivery

---

## 🛠️ Tecnologias utilizadas

- MySQL 8
- MySQL Workbench
- SQL (DDL e DML)

---

## ⚙️ Como executar o projeto

1. Abra o MySQL Workbench
2. Execute os scripts na ordem abaixo:

```text
01_criacao_banco.sql
02_criacao_tabelas.sql
03_inserts.sql
04_consultas.sql
