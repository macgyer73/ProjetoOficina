# Projeto Oficina
Desafio modelagem do Zero projeto para controle e gerenciamento de execução de Ordens de Serviço em uma Oficina Mecanica.

# Narrativa:
Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.

Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas.

Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.

A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.

O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços.

A mesma equipe avalia e executa os serviços.

Os mecânicos possuem código, nome, endereço e especialidade.

Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

# Modelo Proposto
<img src="https://github.com/macgyer73/ProjetoOficina/blob/main/Files/OS-template.png" alt="Modelo Oficina Proposto">

Sistema de Cadastro unico, para facilitar dados em comum, Entidades Mecanicos e Cliente.
Criado Entidade Veiculo- pois cada cliente pode ter mais de 1 veiculo.
Criada entidade Mão de Obra com valores para hora de serviço de cada especialidade
Criado Conunto entidades para peças com controle de estoque e fornecedor.
Tudo relacionado em OS, que vai ter informações de Mão de obra, peças, Equipe de mecanicos , status, data abertura e data prevista.
