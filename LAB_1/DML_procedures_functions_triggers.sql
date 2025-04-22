-- RF 12 – Proponha um requisito relevante ainda por identificar e que requeira o desenvolvimento de functions/procedures para o satisfazer. Implemente.
-- Function para calcular e verificar a eficiência de um produtor
DELIMITER $$

CREATE FUNCTION fn_CalcularEficienciaProdutor(produtorNIF INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totalProducao INT;
    DECLARE totalRecursos FLOAT;
    DECLARE eficiencia DECIMAL(10,2);

    -- Somatório da produção total do produtor
    SELECT SUM(RP.Quantidade) INTO totalProducao
    FROM RegistosProducao RP
    JOIN Cultivo C ON RP.Cultivo_ID_Registos_Producao = C.ID
    WHERE C.Produtor_NIF_Cultivo = produtorNIF;

    -- Somatório da quantidade de recursos utilizados pelo produtor
    SELECT SUM(GR.Quantidade) INTO totalRecursos
    FROM Gestao_Recursos GR
    WHERE GR.NIF_Produtor = produtorNIF;

    -- Evita divisão por zero
    IF totalRecursos IS NULL OR totalRecursos = 0 THEN
        SET eficiencia = 0;
    ELSE
        SET eficiencia = totalProducao / totalRecursos;
    END IF;

    RETURN eficiencia;
END$$

DELIMITER ;


-- ------------------------------------------------------------------------------------------------------------------------------------------------------