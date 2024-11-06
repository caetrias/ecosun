CREATE DATABASE ECOSUN;
USE ECOSUN;

CREATE TABLE Clientes (
    email VARCHAR(50),
    nome VARCHAR(50),
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    CEP VARCHAR(50),
    fk_telefone_telefone_PK INTEGER,
    CPF VARCHAR(50),
    CNPJ VARCHAR(50),
    Clientes_TIPO VARCHAR(50),
    PRIMARY KEY (CPF, CNPJ)
);

CREATE TABLE Instalacao (
    ID_instalacao INTEGER PRIMARY KEY,
    comentario_servico VARCHAR(50),
    data_instalacao INTEGER
);

CREATE TABLE Tecnico (
    Nome VARCHAR(50),
    Telefone INTEGER,
    Email VARCHAR(50),
    ID_Tecnico INTEGER PRIMARY KEY,
    fk_Tecnico_ID_Tecnico INTEGER,
    fk_Instalacao_ID_instalacao INTEGER
);

CREATE TABLE Fornecedor (
    Nome_Empresa VARCHAR(50),
    CNPJ VARCHAR(50) PRIMARY KEY,
    telefone INTEGER,
    email VARCHAR(50),
    rua VARCHAR(50),
    bairro VARCHAR(50),
    Cidade VARCHAR(50),
    CEP INTEGER
);

CREATE TABLE Forma_Pagamento (
    valor_total REAL,
    ID_Pagamento INTEGER PRIMARY KEY,
    data_emissao VARCHAR(50),
    desconto REAL,
    qdt_parcelas INTEGER,
    valor_parcela INTEGER,
    Forma_Pagamento_TIPO VARCHAR(50)
);

CREATE TABLE Placa (
    Potencia_placa INTEGER,
    qtd_placas INTEGER,
    ID_placa INTEGER PRIMARY KEY,
    prazo_garantia VARCHAR(50),
    fk_Instalacao_ID_instalacao INTEGER,
    fk_Fornecedor_CNPJ VARCHAR(50)
);

CREATE TABLE pedido_faz (
    fk_Forma_Pagamento_ID_Pagamento INTEGER,
    fk_Instalacao_ID_instalacao INTEGER,
    fk_Clientes_CPF VARCHAR(50),
    fk_Clientes_CNPJ VARCHAR(50)
);

CREATE TABLE telefone (
    telefone_PK INTEGER NOT NULL PRIMARY KEY,
    telefone INT
);

 
ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes_2
    FOREIGN KEY (fk_telefone_telefone_PK)
    REFERENCES telefone (telefone_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Tecnico ADD CONSTRAINT FK_Tecnico_2
    FOREIGN KEY (fk_Tecnico_ID_Tecnico)
    REFERENCES Tecnico (ID_Tecnico);
 
ALTER TABLE Tecnico ADD CONSTRAINT FK_Tecnico_3
    FOREIGN KEY (fk_Instalacao_ID_instalacao)
    REFERENCES Instalacao (ID_instalacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Placa ADD CONSTRAINT FK_Placa_2
    FOREIGN KEY (fk_Instalacao_ID_instalacao)
    REFERENCES Instalacao (ID_instalacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Placa ADD CONSTRAINT FK_Placa_3
    FOREIGN KEY (fk_Fornecedor_CNPJ)
    REFERENCES Fornecedor (CNPJ)
    ON DELETE RESTRICT;
 
ALTER TABLE pedido_faz ADD CONSTRAINT FK_pedido_faz_1
    FOREIGN KEY (fk_Forma_Pagamento_ID_Pagamento)
    REFERENCES Forma_Pagamento (ID_Pagamento)
    ON DELETE RESTRICT;
 
ALTER TABLE pedido_faz ADD CONSTRAINT FK_pedido_faz_2
    FOREIGN KEY (fk_Instalacao_ID_instalacao)
    REFERENCES Instalacao (ID_instalacao);
 
ALTER TABLE pedido_faz ADD CONSTRAINT FK_pedido_faz_3
    FOREIGN KEY (fk_Clientes_CPF, fk_Clientes_CNPJ)
    REFERENCES Clientes (CPF, CNPJ);
    
-- populando os campos
-- Populando a tabela telefone
INSERT INTO telefone (telefone_PK, telefone) VALUES
(1, 123456789),
(2, 987654321),
(3, 555666777);

-- Populando a tabela Clientes
INSERT INTO Clientes (email, nome, rua, bairro, cidade, CEP, fk_telefone_telefone_PK, CPF, CNPJ, Clientes_TIPO) VALUES
('cliente1@example.com', 'João Silva', 'Rua A', 'Bairro 1', 'Cidade X', '123456', 1, '12345678901', '00000000000191', 'F'),
('cliente2@example.com', 'Maria Santos', 'Rua B', 'Bairro 2', 'Cidade Y', '654321', 2, '98765432100', '00000000000281', 'F'),
('empresa1@example.com', 'Empresa Solar', 'Rua C', 'Bairro 3', 'Cidade Z', '111222', 3, '11122233344', '12345678000190', 'J');

-- Populando a tabela Instalacao
INSERT INTO Instalacao (ID_instalacao, comentario_servico, data_instalacao) VALUES
(1, 'Instalação realizada com sucesso', 20240101),
(2, 'Instalação com revisão necessária', 20240215);

-- Populando a tabela Tecnico
INSERT INTO Tecnico (Nome, Telefone, Email, ID_Tecnico, fk_Tecnico_ID_Tecnico, fk_Instalacao_ID_instalacao) VALUES
('Carlos Mendes', 123987654, 'carlos@example.com', 1, 1, 1),
('Ana Costa', 321654987, 'ana@example.com', 2, 2, 2);

-- Populando a tabela Fornecedor
INSERT INTO Fornecedor (Nome_Empresa, CNPJ, telefone, email, rua, bairro, Cidade, CEP) VALUES
('Fornecedor SolarTech', '11223344000155', 444555666, 'contato@solartech.com', 'Rua D', 'Bairro 4', 'Cidade W', 333444);

-- Populando a tabela Forma_Pagamento
INSERT INTO Forma_Pagamento (valor_total, ID_Pagamento, data_emissao, desconto, qdt_parcelas, valor_parcela, Forma_Pagamento_TIPO) VALUES
(5000.00, 1, '2024-01-15', 500.00, 10, 450, 1),
(3000.00, 2, '2024-02-20', 300.00, 5, 540, 2);

-- Populando a tabela Placa
INSERT INTO Placa (Potencia_placa, qtd_placas, ID_placa, prazo_garantia, fk_Instalacao_ID_instalacao, fk_Fornecedor_CNPJ) VALUES
(400, 10, 1, '5 anos', 1, '11223344000155'),
(350, 8, 2, '4 anos', 2, '11223344000155');

-- Populando a tabela pedido_faz
INSERT INTO pedido_faz (fk_Forma_Pagamento_ID_Pagamento, fk_Instalacao_ID_instalacao, fk_Clientes_CPF, fk_Clientes_CNPJ) VALUES
(1, 1, '12345678901', '00000000000191'),
(2, 2, '98765432100', '00000000000281');