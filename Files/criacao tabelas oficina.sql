-- modelagem de banco de dados  construindo seu primeiro Projeto Logico do Zero. 
-- desafio Oficina 
-- criação do BD e das Tabelas

-- cria o BD
create database oficina;
use oficina;



-- -----------------------------------------------------
-- Table `oficina`.`Cadastro`
-- -----------------------------------------------------
CREATE TABLE Cadastro (
  idCadastro INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  CPF char(11) NOT NULL,
  Endereço VARCHAR(255) NOT NULL,
  Telefone CHAR(11) NOT NULL,
  PRIMARY KEY (idCadastro),
  constraint unique_cpf_cliente unique (CPF) -- evitar duplicidade de dados

  );

alter table Cadastro auto_increment=1;

-- -----------------------------------------------------
-- Table .`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Clientes (
  idClientes INT NOT NULL PRIMARY KEY auto_increment,
  email VARCHAR(45) NOT NULL,
  Cadastro_idCadastro INT NOT NULL,
  constraint email_unico unique (email),
  constraint fk_idcadastro foreign key (Cadastro_idCadastro) references Cadastro(idCadastro)
		on update cascade
);
  
  
  alter table Clientes auto_increment=1;
  
-- -----------------------------------------------------
-- Table.`Mecanicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Mecanicos (
  idMecanicos INT NOT NULL auto_increment primary key,
  especialidade ENUM('Motor', 'Suspensão', 'Revisão') NULL DEFAULT 'Revisão',
  Cadastro_idCadastro_Mec INT NOT NULL,
  constraint fk_idcadastro_mecanico foreign key (Cadastro_idCadastro_Mec) references Cadastro(idCadastro)
		on update  cascade
	
);

alter table Mecanicos auto_increment=1;

-- -----------------------------------------------------
-- Table .`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Veiculo (
  idVeiculo INT NOT NULL auto_increment primary key,
  Marca VARCHAR(45) NULL,
  modelo VARCHAR(45) NULL,
  Placa CHAR(7) NULL,
  Observações VARCHAR(255) NULL,
  Clientes_idClientes INT NOT NULL,
  constraint fk_idClientes_cad foreign key (Clientes_idClientes) references Clientes(idClientes),
  constraint placa_unica unique (Placa)
  
  );

alter table Veiculo  auto_increment=1;
-- -----------------------------------------------------
-- Table Ordem_de_Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ordem_de_Servico (
	idOrdem_de_Servico INT NOT NULL auto_increment primary key,
	data_emissao DATE NOT NULL,
	hora_trabalhada TIME NOT NULL DEFAULT 1,
	Peças VARCHAR(45) NULL,
	Status VARCHAR(45) NOT NULL,
	Data_Prevista DATE NULL,
	Valor_Peças FLOAT NULL,
	Valor_Total FLOAT NULL,
    Veiculo_idVeiculo INT NOT NULL,
    Veiculo_Clientes_idClientes INT NOT NULL,
	constraint veiculo_id_veiculos foreign key (Veiculo_idVeiculo) references Veiculo(idVeiculo) 
			on update cascade,
	constraint veiculo_idCliente foreign key (Veiculo_Clientes_idClientes) references Veiculo(Clientes_idClientes)

  
);
 alter table Ordem_de_Servico auto_increment=1; 
-- -----------------------------------------------------
-- Table `Mão_de_Obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Mao_de_Obra (
  idMao_de_Obra INT NOT NULL auto_increment primary key,
  valor_hora_motor FLOAT NOT NULL DEFAULT 250,
  valor_hora_suspensao FLOAT NOT NULL DEFAULT 200,
  valor_hora_revisao FLOAT NOT NULL DEFAULT 150,
  OS_idOrdem_de_Servico INT NOT NULL,
  OS_Veiculo_idVeiculo INT NOT NULL,
  constraint id_ordem_serviço foreign key (OS_idOrdem_de_Servico) references Ordem_de_Servico(Veiculo_idVeiculo),
  constraint id_os_veiculo foreign key (OS_Veiculo_idVeiculo) references Ordem_de_Servico(Veiculo_idVeiculo)
);

 alter table Mao_de_Obra auto_increment=1; 

-- -----------------------------------------------------
-- Table .`Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pecas (
	idPecas INT NOT NULL auto_increment primary key,
	descricao  VARCHAR(45) NULL,
	montadora VARCHAR(45) NULL,
	valor FLOAT NULL
	
  
  );
   alter table Pecas auto_increment=1; 



-- -----------------------------------------------------
-- Table `Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Estoque (
  idEstoque INT NOT NULL auto_increment primary key,
  local VARCHAR(45) NULL
);

 alter table Estoque auto_increment=1; 


-- -----------------------------------------------------
-- Table Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fornecedor (
  idFornecedor INT NOT NULL auto_increment primary key,
  Razao_Social VARCHAR(45) NOT NULL,
  CNPJ CHAR(14) NOT NULL,
  constraint unique_CNPJ unique (CNPJ)
 
  );
 alter table Fornecedor  auto_increment=1; 


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pagamento (
  idPagamento INT NOT NULL AUTO_INCREMENT primary key,
  Cartao CHAR(14) NULL,
  Dinheiro_pix INT NULL,
  Valor INT NOT NULL,
  OS_idOrdem_de_Servico INT NOT NULL,
  OS_Veiculo_idVeiculo  INT NOT NULL,

  constraint os_ordem_de_servico  foreign key (OS_idOrdem_de_Servico) references Ordem_de_Servico(Veiculo_idVeiculo),
  constraint Os_Veiculo_cliente foreign key ( OS_Veiculo_idVeiculo) references  Ordem_de_Servico(Veiculo_idVeiculo)
);
 alter table Pagamento  auto_increment=1; 

-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor_Disponibiliza_Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fornecedor_Disponibiliza_Peças (
	Pecas_idPecas INT NOT NULL,
	Fornecedor_idFornecedor INT NOT NULL,
	PRIMARY KEY (Pecas_idPecas, Fornecedor_idFornecedor),
    constraint fk_fornecedor foreign key (Fornecedor_idFornecedor) references Fornecedor(idFornecedor),
	constraint fk_produto foreign key (Pecas_idPecas) references  Pecas(IdPecas)
	
    
    
    );


-- -----------------------------------------------------
-- Table Peças_em_Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Peças_em_Estoque(
  Pecas_idPecas INT NOT NULL,
  Estoque_idEstoque INT NOT NULL,
  Quantidade  int ,
  PRIMARY KEY (Pecas_idPecas, Estoque_idEstoque ),
  constraint fk_idPeca foreign key(Pecas_idPecas) references Pecas(idPecas),
  constraint fk_id_estoque  foreign key (Estoque_idEstoque) references Estoque(idEstoque)
  
  
  
  );
-- -----------------------------------------------------
-- Table Peças_Para_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pecas_Para_OS (
	Ordem_de_Servico_idOrdem_de_Servico INT NOT NULL,
	Pecas_idPecas INT NOT NULL,
	Quantidade VARCHAR(45) NULL,
	Valor FLOAT NULL,
	PRIMARY KEY (Ordem_de_Servico_idOrdem_de_Servico, Pecas_idPecas),
	constraint foreign key	fk_pecas_para_os(Pecas_idPecas) references  Pecas(IdPecas),
	constraint foreign key  fk_ordem_servico_pecas (Ordem_de_Servico_idOrdem_de_Servico) references Ordem_de_Servico(idOrdem_de_Servico)
);

-- -----------------------------------------------------
-- Table  Mecanico_pega_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Mecanico_pega_OS (
	Mecanicos_idMecanicos INT NOT NULL ,
	Ordem_de_Serviço_idOrdem_de_Serviço INT NOT NULL,
	Ordem_de_Serviço_Veiculo_idVeiculo INT NOT NULL,
	PRIMARY KEY (Mecanicos_idMecanicos, Ordem_de_Serviço_idOrdem_de_Serviço, Ordem_de_Serviço_Veiculo_idVeiculo),
	constraint foreign key fk_mecanico_pega_OS (Mecanicos_idMecanicos) references Mecanicos(idMecanicos),
    constraint foreign key fk_Ordem_Servico_id (Ordem_de_Serviço_idOrdem_de_Serviço) references Ordem_de_Servico(idOrdem_de_Servico)
    
    
);

show tables;




