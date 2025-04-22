-- RF4 - Histórico de colheitas de um produtor num intervalo de tempo
CREATE OR REPLACE VIEW vw_RF4_HistoricoColheitas AS
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
    Produtor_NIF_Cultivo = 101001001
    AND DataColhido BETWEEN '2024-03-01' AND '2024-06-30'
ORDER BY 
    DataColhido DESC;
-- ---------------------------------------------------------------------
# DEBUG DO RF4
SELECT * FROM Cultivo WHERE Produtor_NIF_Cultivo = 101000001;
SELECT * FROM vw_RF4_HistoricoColheitas;


-- RF5 - Histórico de colheitas de um produtor num intervalo de tempo
   #   PRECISA SER FEITO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- -------------------------------------------------------------------


-- RF6: Estado atual dos tratamentos e estoque de produtos
-- Esta query mostra:
-- - O nome e fornecedor de cada tratamento
-- - A data de aplicação
-- - A quantidade usada
-- - O total disponível em stock
-- - E a quantidade restante (em stock) após uso
CREATE OR REPLACE VIEW vw_RF6_EstadoTratamentosEstoque AS
SELECT 
    Nome,                               -- Nome do tratamento
    Fornecedor,                         -- Fornecedor do tratamento
    DataAplicacao,                      -- Data em que foi aplicado
    QuantidadeUsada,                    -- Quantidade que já foi usada
    QuantidadeEstoqueTotal,             -- Quantidade total recebida
    (QuantidadeEstoqueTotal - QuantidadeUsada) AS QuantidadeRestante -- Quantidade ainda disponível
FROM 
    Tratamentos;
-- ----------------------------------------------------------------------------------------------------
# Para consultar os dados, usa:
SELECT * FROM vw_RF6_EstadoTratamentosEstoque;


-- RF7: Estado dos sensores IoT – máximos, mínimos e médias
-- Esta view processa os dados dos sensores ligados aos cultivos
-- e calcula estatísticas agregadas úteis para análise agrícola.
CREATE OR REPLACE VIEW vw_RF7_EstadoSensoresIoT AS
SELECT 
    MAX(Temperatura) AS TemperaturaMaxima,
    MIN(Temperatura) AS TemperaturaMinima,
    ROUND(AVG(Temperatura), 2) AS TemperaturaMedia,

    MAX(humidadeSolo) AS HumidadeMaxima,
    MIN(humidadeSolo) AS HumidadeMinima,
    ROUND(AVG(humidadeSolo), 2) AS HumidadeMedia,

    MAX(luminosidade) AS LuminosidadeMaxima,
    MIN(luminosidade) AS LuminosidadeMinima,
    ROUND(AVG(luminosidade), 2) AS LuminosidadeMedia,

    MAX(NivelIrrigacao) AS IrrigacaoMaxima,
    MIN(NivelIrrigacao) AS IrrigacaoMinima,
    ROUND(AVG(NivelIrrigacao), 2) AS IrrigacaoMedia,

    MAX(QualidadeAr) AS QualidadeArMaxima,
    MIN(QualidadeAr) AS QualidadeArMinima,
    ROUND(AVG(QualidadeAr), 2) AS QualidadeArMedia
FROM 
    Sensores_IoT;
-- ------------------------------------------------------------
-- Para consultar os resultados:
SELECT * FROM vw_RF7_EstadoSensoresIoT;


-- RF8: Relatório sobre eficiência agrícola e uso de recursos
CREATE OR REPLACE VIEW vw_RF8_EficienciaRecursos AS
SELECT 
    GR.NIF_Produtor,                        -- Identifica o produtor
    P.Name AS NomeProdutor,                -- Nome do produtor
    GR.Tipo_Recurso,                       -- Tipo de recurso usado (água, fertilizante, etc.)
    SUM(GR.Quantidade) AS TotalUsado,      -- Quantidade total usada do recurso
    ROUND(AVG(GR.Custo), 2) AS CustoMedio, -- Custo médio do recurso
    COUNT(*) AS RegistosUso                -- Número de vezes que o recurso foi usado
FROM 
    Gestao_Recursos GR                     -- Fonte principal dos dados de uso de recursos
JOIN 
    Produtor P ON GR.NIF_Produtor = P.NIF  -- Junta com tabela de produtores para obter nomes
GROUP BY 
    GR.NIF_Produtor, P.Name, GR.Tipo_Recurso
ORDER BY 
    GR.NIF_Produtor;
-- -----------------------------------------------------------------------------------------------
-- Para consultar os resultados:
SELECT * FROM vw_RF8_EficienciaRecursos;
