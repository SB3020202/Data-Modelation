
-- RF4 - Histórico de colheitas de um produtor num intervalo de tempo
SELECT 
    ID                  AS CultivoID,
    Tipo                AS Cultura,
    DataPlantado,
    DataColhido,
    Rendimento,
    TipoPratica
FROM 
    Cultivo
WHERE 
    Produtor_NIF = 101001001
    AND DataColhido BETWEEN '2024-03-01' AND '2024-06-30'
ORDER BY 
    DataColhido DESC;
-- ------------------------------------------------------------------------------------

-- RF5: Visualizar os produtores que mais comercializam produtos
SELECT 
    P.NIF,                                        -- Mostra o NIF do produtor
    P.Name,                                       -- Mostra o nome do produtor
    COUNT(C.ID) AS TotalComercializacoes,         -- Conta quantas comercializações estão ligadas ao produtor
    SUM(C.QuantidadeVendida) AS TotalKgVendidos   -- Soma a quantidade total vendida (em kg)
FROM 
    Produtor P                                     -- Tabela principal: Produtores
-- Ligação de cada produtor aos seus cultivos
JOIN 
    Cultivo CU ON CU.Produtor_NIF_Cultivo = P.NIF
-- Ligação dos cultivos aos registos de produção (lotes)
JOIN 
    RegistosProducao RP ON RP.Cultivo_ID_Registos_Producao = CU.ID
-- Ligação dos lotes às comercializações realizadas
JOIN 
    Comercializacao C ON C.LoteID_RegistosProducao = RP.LoteID
-- Agrupamos os resultados por produtor (NIF e nome)
GROUP BY 
    P.NIF, P.Name
-- Ordenamos do produtor que mais vendeu (em kg) para o que menos vendeu
ORDER BY 
    TotalKgVendidos DESC;
-- ------------------------------------------------------------------------------------


-- RF6: Estado atual dos tratamentos e estoque de produtos
SELECT 
    Nome,                         -- Nome do tratamento
    Fornecedor,                   -- Quem forneceu o tratamento
    DataAplicacao,                -- Quando foi aplicado
    QuantidadeUsada,              -- Quanto foi usado
    QuantidadeEstoqueTotal,       -- Total disponível no estoque
    (QuantidadeEstoqueTotal - QuantidadeUsada) AS QuantidadeRestante  -- Estoque atual disponível
FROM 
    Tratamentos;
-- ------------------------------------------------------------------------------------
