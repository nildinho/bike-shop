-- Comando para criar um novo bando de dados 
 CREATE DATABASE bikeshop;
-- Comando para selecionar banco de dados criado
 USE bikeshop;
-- Comando para criação de tabela
 CREATE TABLE inventario(
 idinventario int auto_increment primary key,
 modelo varchar(50) not null unique, 
 marca varchar(50) not null,
 quantidade int,
 preco decimal(6,2),
 idfornecedor int not null
  );
  CREATE TABLE cliente(
  idcliente int auto_increment primary key,
  nome varchar(50) not null,
  endereco enum("Rua","Avenida","Travessa","Estrada","Viela","Praça","Alameda"),
  contato int not null, 
  email varchar(50) not null unique
  );
  CREATE TABLE vendas(
  idvendedor int auto_increment primary key,
  data_da_venda date,
  idcliente int not null,
  idinventario int not null,
  quantidade int not null,
  preco decimal (7,2),
  pagamento enum("dinheiro","cartao","pix")
  );
  CREATE TABLE fornecedor(
  idfornecedor int auto_increment primary key,
  fornecedor varchar (50),
  contato int not null,
  endereco int not null,
  email varchar (100)not null unique
  );
  
  CREATE TABLE vendedor(
  idvendedor int auto_increment primary key,
  nome_do_vendedor varchar(50),
  idfuncionario int not null unique
  );
  CREATE TABLE funcionario(
  idfuncionario int auto_increment primary key,
  nome_do_funcionario varchar(50),
  cargo varchar(30)not null,
  salario decimal(7,2),
  data_de_admissao datetime
  );
  -- Relacionamento da tabela cliente com venda
-- Alterar a tabela para adicionar
-- uma chave estrangeira e um relacionamento
-- com a tabela

ALTER TABLE inventario
ADD CONSTRAINT `fk.inve_pk.forne`
fOREIGN KEY inventario (`idfornecedor`)
references fornecedor(`idfornecedor`);

alter table venda
add constraint `fk.venda_pk.cliente`
foreign key venda (`idcliente`)
references cliente (`idcliente`);

alter table venda
add constraint `fk.venda_pk.inventario`
foreign key venda (`idinventario`)
references inventario (`idinventario`);

alter table venda
add constraint `fk.venda_pk.vendedor`
foreign key venda (`idvendedor`)
references vendedor (`idvendedor`);

alter table vendedor
add constraint `fk.vendedor_pk.funci`
foreign key vendedor (`idfuncionario`)
references funcionario (`idfuncionario`);