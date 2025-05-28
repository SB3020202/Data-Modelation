USE smartagriculture_db;
DELIMITER $$

CREATE FUNCTION fn_CalcularEficienciaProdutor(produtorNIF INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totalProducao FLOAT;
    DECLARE totalRecursos FLOAT;
    DECLARE eficiencia DECIMAL(10,2);

    SELECT SUM(RP.Quantidade) INTO totalProducao
    FROM RegistosProducao RP
    JOIN Cultivo C ON RP.Cultivo_ID_Registos_Producao = C.ID
    WHERE C.Produtor_NIF_Cultivo = produtorNIF;

    SELECT SUM(GR.Quantidade) INTO totalRecursos
    FROM Gestao_Recursos GR
    WHERE GR.NIF_Produtor = produtorNIF;

    IF totalRecursos IS NULL OR totalRecursos = 0 THEN
        SET eficiencia = 0;
    ELSE
        SET eficiencia = totalProducao / totalRecursos;
    END IF;

    RETURN eficiencia;
END$$

DELIMITER ;
