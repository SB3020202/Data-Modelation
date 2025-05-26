-- RF 12 – Proponha um requisito relevante ainda por identificar e que requeira o desenvolvimento de functions/procedures para o satisfazer.
-- Function para calcular e verificar a eficiência de um produtor

DELIMITER $$                             -- Altera o delimitador padrão (;) para $$, permitindo blocos de código complexos

CREATE FUNCTION fn_CalcularEficienciaProdutor(produtorNIF INT)  -- Cria a função, que recebe o NIF do produtor como parâmetro
RETURNS DECIMAL(10,2)                  -- Define o tipo de retorno da função: decimal com 2 casas decimais (ex: 2.53)
DETERMINISTIC                          -- Garante que para o mesmo input, a função devolve sempre o mesmo resultado
BEGIN

    DECLARE totalProducao INT;         -- Declara variável para armazenar a soma da produção (em kg)
    DECLARE totalRecursos FLOAT;       -- Declara variável para armazenar o total de recursos usados (ex: litros de água)
    DECLARE eficiencia DECIMAL(10,2);  -- Variável final para armazenar o resultado da eficiência

    -- Somatório da produção total do produtor (em kg)
    SELECT SUM(RP.Quantidade) INTO totalProducao
    FROM RegistosProducao RP
    JOIN Cultivo C ON RP.Cultivo_ID_Registos_Producao = C.ID    -- Junta os registos de produção com os cultivos
    WHERE C.Produtor_NIF_Cultivo = produtorNIF;                  -- Filtra apenas pelos cultivos daquele produtor

    -- Somatório da quantidade de recursos usados pelo produtor (ex: litros de água, kg de fertilizante)
    SELECT SUM(GR.Quantidade) INTO totalRecursos
    FROM Gestao_Recursos GR
    WHERE GR.NIF_Produtor = produtorNIF;                         -- Filtra os recursos usados por esse produtor

    -- Se não houver dados ou o total de recursos for zero, evita divisão por zero e define eficiência como 0
    IF totalRecursos IS NULL OR totalRecursos = 0 THEN
        SET eficiencia = 0;
    ELSE
        -- Caso contrário, calcula eficiência = produção total / recursos totais
        SET eficiencia = totalProducao / totalRecursos;
    END IF;

    RETURN eficiencia;                                           -- Devolve o valor final da eficiência calculada

END$$

DELIMITER ;                                                      -- Restaura o delimitador padrão (;)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------