-- RF4 Visualizar o histórico de colheitas de um produtor num intervalo de tempo. 
SELECT 
    *
FROM
    smartagriculture_db.registos_producao
WHERE
    Cultivo_Produtor_NIF = 123456789
        AND Data_COlheita BETWEEN '2025-01-01' AND '2025-04-30'
ORDER BY DAtA_colheita DESC;

-- ----------------------------


-- RF 5 Visualizar os produtores que mais comercializam produtos. 
SELECT
    p.NIF AS Produtor_NIF,
    p.Name AS Produtor_Name,
    SUM(rp.Quantidade) AS Total_Quantidade_Sold
FROM
    registos_producao rp
JOIN
    produtor p ON rp.Cultivo_Produtor_NIF = p.NIF
GROUP BY
    p.NIF
ORDER BY
    Total_Quantidade_Sold DESC;

-- ---------------------

-- RF 1 Implementar as operações CRUD da BD para as entidades identificadas.
SELECT * from registos_producao;
SELECT NIF from produtor;
SELECT * FROM produtor WHERE NIF = 123456789;

UPDATE produtor SET Number = '987654321', Area_Cultivada = '20 hectares'
WHERE NIF = 123456789;

DELETE FROM Produtor WHERE NIF = 123456789;

DELETE FROM smartagriculture_db.alertas
WHERE ID_Alerta BETWEEN 1 AND 10;
-- ------------------------------------

DESC sensores_iot;

ALTER TABLE registos_producao
DROP COLUMN Comercializacao_ID_Comercializacao;

ALTER TABLE cultivo
DROP COLUMN NIF_Produtor;

-- ------------------------------------


-- Exemplo
SELECT NIF, Name, gestao_recursos_id as GD_ID, g.Tipo_Recurso
FROM produtor p
INNER JOIN Gestao_Recursos g on p.Gestao_Recursos_ID = g.ID
ORDER BY
	name ASC;