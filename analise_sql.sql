-- 1. Quantos chamados foram abertos no dia 01/04/2023?

SELECT 
COUNT(id_chamado) as qtde_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE DATE(data_inicio) = '2023-04-01'
LIMIT 1000;

-- 2. Qual o tipo de chamado que teve mais reclamações no dia 01/04/2023?

SELECT
tipo,
COUNT (id_chamado) as quantidade
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY tipo
ORDER BY quantidade DESC
LIMIT 1;

-- 3. Quais os nomes dos 3 bairros que mais tiveram chamados abertos nesse dia?

SELECT
b.nome,
COUNT (b.nome) AS quantidade
FROM `datario.administracao_servicos_publicos.chamado_1746` AS sp
INNER JOIN `datario.dados_mestres.bairro` AS b on sp.id_bairro = b.id_bairro
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY b.nome
ORDER BY quantidade DESC
LIMIT 3;

-- 4. Qual o nome da subprefeitura com mais chamados abertos nesse dia?

SELECT
b.subprefeitura,
COUNT (b.subprefeitura) AS quantidade
FROM `datario.administracao_servicos_publicos.chamado_1746` AS sp
INNER JOIN `datario.dados_mestres.bairro` AS b on sp.id_bairro = b.id_bairro
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY b.subprefeitura
ORDER BY quantidade DESC
LIMIT 1;

-- 5. Existe algum chamado aberto nesse dia que não foi associado a um bairro ou subprefeitura na tabela de bairros? Se sim, por que isso acontece?

SELECT
*
FROM `datario.administracao_servicos_publicos.chamado_1746` AS sp
LEFT JOIN `datario.dados_mestres.bairro` AS b on sp.id_bairro = b.id_bairro
WHERE DATE(data_inicio) = '2023-04-01' AND subprefeitura IS NULL
LIMIT 1000;