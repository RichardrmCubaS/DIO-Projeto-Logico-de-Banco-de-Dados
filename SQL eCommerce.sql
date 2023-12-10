CREATE DATABASE Ecommerce;
USE Ecommerce;

-- CLIENTE
CREATE TABLE Cliente(
	IdCliente INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45),
    Endereço VARCHAR(45),
	TipoCliente VARCHAR(20)	  
    );

DESC Cliente;

-- CLIENTE FISICO
CREATE TABLE ClienteFisico(
	ClienteFisico_IdClienteFisico INT,
    CPF CHAR (11) NOT NULL,
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
	CONSTRAINT fk_ClienteFisico_IdClienteFisico FOREIGN KEY (ClienteFisico_IdClienteFisico) REFERENCES Cliente(IdCliente)
    );

DESC Cliente Fisico;

-- CLIENTE JURIDICO
CREATE TABLE ClienteJuridico(
	ClienteJuridico_IdClienteJuridico INT,
    RazãoSocial VARCHAR(90),
    NomeFantasia VARCHAR(45),
	CNPJ VARCHAR(18)NOT NULL,
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ),
	CONSTRAINT fk_ClienteJuridico_IdClienteJuridico FOREIGN KEY (ClienteJuridico_IdClienteJuridico) REFERENCES Cliente(IdCliente)
    );

DESC Cliente Juridico;

-- TIPO PAGAMENTO
CREATE TABLE TipoPagamento(
	IdPagamento INT auto_increment PRIMARY KEY,
	ClientePagamento_IdClientePagamento INT,
    TipoPagamento VARCHAR(20),
    Numero Cartão VARCHAR(30),
    Vencimento DATE,
	Valor FLOAT,
    CONSTRAINT fk_ClientePagamento_IdClientePagamento FOREIGN KEY (ClientePagamento_IdClientePagamento) REFERENCES Cliente(IdCliente)
);

DESC Tipo Pagamento;

-- PEDIDO
CREATE TABLE Pedido(
	IdPedido INT auto_increment PRIMARY KEY,
	Cliente_IdCliente INT,
    StatusPedido BOOL DEFAULT FALSE,
    Frete FLOAT,
    Descrição VARCHAR(45),
	CONSTRAINT fk_Cliente_IdCliente FOREIGN KEY (Cliente_IdCliente) REFERENCES Cliente(IdCliente)    
);

DESC Pedido;

-- PEDIDO ENTREGA
CREATE TABLE PedidoEntrega(
	Pedido_IdPedido INT,
    StatusEntrega BOOL DEFAULT FALSE,
    CodigoRastreio VARCHAR(45),
	DataEntrega DATE,
	CONSTRAINT fk_Pedido_IdPedido FOREIGN KEY (Pedido_IdPedido) REFERENCES Pedido(IdPedido)   
);

DESC Pedido Entrega;

-- PEDIDO PRODUTO
CREATE TABLE PedidoProduto(
	Pedido_IdPedido INT,
	Produto_IdProduto INT,
    Quantidade FLOAT,
	CONSTRAINT fk_Pedido_IdPedido FOREIGN KEY (Pedido_IdPedido) REFERENCES Pedido(IdPedido),
    CONSTRAINT fk_Produto_IdProduto FOREIGN KEY (Produto_IdProduto) REFERENCES Produto(IdProduto)
);

DESC Pedido Produto;

-- PRODUTO
CREATE TABLE Produto(
	IdProduto INT auto_increment PRIMARY KEY,
    Categoria VARCHAR(45),
    Descrição VARCHAR(45),
	Valor FLOAT
);

DESC Produto;

-- ESTOQUE
CREATE TABLE Estoque(
	IdEstoque INT auto_increment PRIMARY KEY,
    Locali VARCHAR(45)
);

DESC Estoque;

-- PRODUTOS EM ESTOQUE
CREATE TABLE ProdutoEstoque(
	Produto_IdProduto INT,
	Estoque_IdEstoque INT,
    Quantidade FLOAT,
    CONSTRAINT fk_Estoque_IdEstoque FOREIGN KEY (Estoque_IdEstoque) REFERENCES Estoque(IdEstoque),
    CONSTRAINT fk_Produto_IdProduto FOREIGN KEY (Produto_IdProduto) REFERENCES Produto(IdProduto)
);

DESC Produto Estoque;

-- PRODUTOS DISPONIBILIZADOS 
CREATE TABLE EstoqueFornecedor(
	Fornecedor_IdFornecedor INT,
    Produto_IdProdutoFornecedor INT,
	Quantidade FLOAT,
    CONSTRAINT fk_Fornecedor_IdFornecedor FOREIGN KEY (Fornecedor_IdFornecedor) REFERENCES Fornecedor(IdFornecedor),
    CONSTRAINT fk_Produto_IdProdutoFornecedor FOREIGN KEY (Produto_IdProdutoFornecedor) REFERENCES Produto(IdProduto)
);

DESC Produtos Disponibilizados;

-- PRODUTOS DISPONIBILIZADOS TERCEIROS.
CREATE TABLE EstoqueFornecedor(
	TerceiroVendedor_IdTerceiroVendedor INT,
    Produto_IdProdutoFornecedor INT,
	Quantidade FLOAT,
    CONSTRAINT fk_TerceiroVendedor_IdTerceiroVendedor  FOREIGN KEY (TerceiroVendedor_IdTerceiroVendedor) REFERENCES Fornecedor(IdFornecedor),
    CONSTRAINT fk_Produto_IdProdutoFornecedor FOREIGN KEY (Produto_IdProdutoFornecedor) REFERENCES Produto(IdProduto)
);

DESC Produtos Disponibilizados Terceiros;

-- FORNECEDOR 
CREATE TABLE Fornecedor(
	IdFornecedor INT auto_increment PRIMARY KEY,
    RazãoSocial VARCHAR(45),
	NomeFantasia VARCHAR(45),
	Endereço VARCHAR(90),
    CNPJ VARCHAR(18) NOT NULL,
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);

DESC Fornecedor;

-- TERCEIRO VENDEDOR
CREATE TABLE TerceiroVendedor(
	IdTerceiroVendedor INT auto_increment PRIMARY KEY,
	RazãoSocial VARCHAR(45),
    Localização VARCHAR(45),
    CPF CHAR (11) NOT NULL,
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF)
    
);

DESC Terceiro;