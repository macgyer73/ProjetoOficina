use oficina;

 -- Consultar ordens de serviço com status específico
SELECT * 
FROM Ordem_de_Servico 
WHERE Status = 'Em andamento';


-- Contar quantos veículos cada cliente possui

SELECT c.Nome, COUNT(v.idVeiculo) AS Qtd_Veiculos
FROM Cadastro c
LEFT JOIN Veiculo v ON c.idCadastro = v.Clientes_idClientes
GROUP BY c.Nome;


-- Consultar o valor total de peças em um determinada ordem de serviço

SELECT SUM(pp.Valor) AS Valor_Total_Pecas 
FROM Pecas_Para_OS pp
WHERE pp.Ordem_de_Servico_idOrdem_de_Serviço = ?;


-- Listar todos os mecanismos e suas especialidades

SELECT m.idMecanicos, m.especialidade, c.Nome
FROM Mecanicos m
JOIN Cadastro c ON m.Cadastro_idCadastro_Mec = c.idCadastro;

-- Para realizar a consulta de peças e seus fornecedores disponíveis 
SELECT    p.idPecas, 
    p.descricao AS Descricao_Peca, 
    f.idFornecedor, 
    f.Razao_Social AS Nome_Fornecedor
FROM 
    Pecas p
JOIN 
    Fornecedor_Disponibiliza_Peças fd ON p.idPecas = fd.Pecas_idPecas
JOIN 
    Fornecedor f ON fd.Fornecedor_idFornecedor = f.idFornecedor;
    
    
    -- Para consultar as ordens de serviço por cliente, incluindo o valor pago pelo cliente, o meio de pagamento 
    -- e o nome do mecânico responsável, você pode usar a seguinte consulta SQL. Esta consulta combina informações de várias tabelas com o uso de JOIN. 
    
    
 SELECT 
    c.Nome AS Nome_Cliente,
    os.idOrdem_de_Servico AS Id_Ordem_Servico,
    os.data_emissao AS Data_Emissao,
    p.Valor AS Valor_Pago,
    CASE 
        WHEN p.Cartao IS NOT NULL AND p.Cartao <> '' THEN 'Cartão' 
        WHEN p.Dinheiro_pix IS NOT NULL AND p.Dinheiro_pix <> 0 THEN 'Dinheiro/PIX'
        ELSE 'Não Especificado' 
    END AS Meio_Pagamento,
    m.Cadastro_idCadastro_Mec AS Nome_Mecanico
FROM 
    Ordem_de_Servico os
JOIN 
    Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
JOIN 
    Clientes cl ON v.Clientes_idClientes = cl.idClientes
JOIN 
    Cadastro c ON cl.Cadastro_idCadastro = c.idCadastro
JOIN 
    Pagamento p ON p.OS_idOrdem_de_Servico = os.idOrdem_de_Servico
JOIN 
    Mecanico_pega_OS mo ON os.idOrdem_de_Servico = mo.Ordem_de_Serviço_idOrdem_de_Serviço
JOIN 
    Mecanicos m ON mo.Mecanicos_idMecanicos = m.idMecanicos
WHERE 
    c.idCadastro = 1;  -- Substitua '?' pelo ID do cliente desejado


