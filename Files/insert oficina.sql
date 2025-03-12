use oficina;




-- Inserindo dados na tabela Cadastro
INSERT INTO Cadastro (Nome, CPF, Endereço, Telefone) VALUES
('Carlos Silva', 12345678901, 'Rua das Flores, 123', '21987654321'),
('Ana Pereira', 98765432100, 'Avenida Brasil, 456', '21912345678'),
('João Souza', 32165498700, 'Praça da Paz, 789', '21965432109'),
('Mariana Lima', 45678912302, 'Rua do Sol, 101', '21914725836');

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (email, Cadastro_idCadastro) VALUES
('carlos.silva@email.com', 1),
('ana.pereira@email.com', 2),
('joao.souza@email.com', 3),
('mariana.lima@email.com', 4);

-- Inserindo dados na tabela Mecanicos
INSERT INTO Mecanicos (especialidade, Cadastro_idCadastro_Mec) VALUES
('Motor', 1),
('Suspensão', 2),
('Revisão', 3),
('Motor', 4);

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (Marca, modelo, Placa, Observações, Clientes_idClientes) VALUES
('Toyota', 'Corolla', 'ABC1A23', 'Revisão completa', 1),
('Honda', 'Civic', 'DEF2B34', 'Troca de óleo', 2),
('Ford', 'Fiesta', 'GHI3C45', 'Alinhamento e balanceamento', 3),
('Chevrolet', 'Onix', 'JKL4D56', 'Troca de pastilhas', 4);

-- Inserindo dados na tabela Ordem_de_Servico
INSERT INTO Ordem_de_Servico (data_emissao, hora_trabalhada, Peças, Status, Data_Prevista, Valor_Peças, Valor_Total, Veiculo_idVeiculo, Veiculo_Clientes_idClientes) VALUES
('2023-10-01', '08:00:00', 'Óleo, Filtro', 'Em andamento', '2023-10-05', 150, 400, 1, 1),
('2023-10-02', '09:00:00', 'Pastilhas de Freio', 'Finalizado', '2023-10-10', 250, 700, 2, 2),
('2023-10-03', '10:00:00', 'Pneus', 'Pendente', '2023-10-12', 1200, 1800, 3, 3),
('2023-10-04', '11:00:00', 'Bateria', 'Finalizado', '2023-10-07', 300, 900, 4, 4);

-- Inserindo dados na tabela Mao_de_Obra
INSERT INTO Mao_de_Obra (valor_hora_motor, valor_hora_suspensao, valor_hora_revisao, OS_idOrdem_de_Servico, OS_Veiculo_idVeiculo) VALUES
(250, 200, 150, 1, 1),
(250, 200, 150, 2, 2),
(250, 200, 150, 3, 3),
(250, 200, 150, 4, 4);

-- Inserindo dados na tabela Pecas
INSERT INTO Pecas (descricao, montadora, valor) VALUES
('Óleo de motor', 'Toyota', 100),
('Filtro de óleo', 'Honda', 50),
('Pastilhas de freio', 'Ford', 200),
('Bateria', 'Chevrolet', 300);

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (local) VALUES
('Almoxarifado 1'),
('Almoxarifado 2'),
('Oficina Principal'),
('Loja de Peças');

-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (Razao_Social, CNPJ) VALUES
('Fornecedor XYZ', '12345678000195'),
('Peças e Cia', '98765432000106'),
('Auto Peças Ltda', '45678912000118'),
('Revenda de Automóveis', '32165498000121');

-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (Cartao, Dinheiro_pix, Valor, OS_idOrdem_de_Servico, OS_Veiculo_idVeiculo) VALUES
('12345678901234', NULL, 400, 1, 1),
(NULL, 600, 0, 2, 2),
('23456789012345', NULL, 1800, 3, 3),
(NULL, 900, 0, 4, 4);

-- Inserindo dados na tabela Fornecedor_Disponibiliza_Peças
INSERT INTO Fornecedor_Disponibiliza_Peças (Pecas_idPecas, Fornecedor_idFornecedor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Inserindo dados na tabela Peças_em_Estoque
INSERT INTO Peças_em_Estoque (Pecas_idPecas, Estoque_idEstoque, Quantidade) VALUES
(1, 1, 10),
(2, 1, 20),
(3, 2, 15),
(4, 3, 5);

-- Inserindo dados na tabela Pecas_Para_OS
INSERT INTO Pecas_Para_OS (Ordem_de_Servico_idOrdem_de_Servico, Pecas_idPecas, Quantidade, Valor) VALUES
(1, 1, '2', 200),
(1, 2, '1', 50),
(2, 3, '4', 800),
(3, 4, '1', 300);

-- Inserindo dados na tabela Mecanico_pega_OS
INSERT INTO Mecanico_pega_OS (Mecanicos_idMecanicos, Ordem_de_Serviço_idOrdem_de_Serviço, Ordem_de_Serviço_Veiculo_idVeiculo) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);



-- Inserindo mais dados na tabela Cadastro
INSERT INTO Cadastro (Nome, CPF, Endereço, Telefone) VALUES
('Lucas Martins', 11223344556, 'Rua da Esperança, 200', '21912345678'),
('Bianca Teixeira', 22334455667, 'Avenida das Américas, 300', '21923456789'),
('Marcos Almeida', 33445566778, 'Bairro Novo, 400', '21934567890'),
('Juliana Costa', 44556677889, 'Estrada do Sol, 500', '21945678901');

-- Inserindo mais dados na tabela Clientes
INSERT INTO Clientes (email, Cadastro_idCadastro) VALUES
('lucas.martins@email.com', 5),
('bianca.teixeira@email.com', 6),
('marcos.almeida@email.com', 7),
('juliana.costa@email.com', 8);


-- Inserindo mais 4 veículos na tabela Veiculo
INSERT INTO Veiculo (Marca, modelo, Placa, Observações, Clientes_idClientes) VALUES
('Nissan', 'Sentra', 'XYZ5E67', 'Revisão periódica', 5),
('Kia', 'Seltos', 'ABC5D78', 'Troca de óleo e filtro', 6),
('Hyundai', 'HB20', 'DEF5G89', 'Verificação de motor', 7),
('Volkswagen', 'T-Cross', 'GHI5H90', 'Inspeção completa', 8);

select * from Clientes;

select * from Veiculo;

