-- =============================================
-- POPULAR BASE DE DADOS: smartagriculture_db
-- =============================================

-- =============================================
-- PRODUTORES
-- =============================================
INSERT INTO Produtor (NIF, Name, Address, PhoneNum, AreaCultivada) VALUES
(101000001, 'João Silva',      'Rua das Oliveiras, 12',     912345678, '5.0'),
(101000002, 'Maria Santos',    'Estrada Nacional 1, km 30', 913456789, '3.2'),
(101000003, 'Carlos Matos',    'Rua do Pomar, 45',          914567890, '7.5'),
(101000004, 'Ana Oliveira',    'Av. das Flores, 120',       915678901, '2.8'),
(101000005, 'Ricardo Costa',   'Rua do Campo, 88',          916789012, '4.6'),
(101000006, 'Teresa Fonseca',  'Monte da Serra, Lote 3',    917890123, '6.1'),
(101000007, 'Bruno Ribeiro',   'Quinta do Vale, 17',        918901234, '8.3'),
(101000008, 'Paula Mendes',    'Travessa da Videira, 6',    919012345, '3.9'),
(101000009, 'Miguel Rocha',    'Rua do Pinhal, 23',         911123456, '5.7'),
(101000010, 'Helena Lima',     'Estrada da Vinha, 50',      912234567, '6.8');


-- =============================================
-- CULTIVOS
-- =============================================
INSERT INTO Cultivo (ID, Produtor_NIF_Cultivo, Tipo, DataPlantado, DataColhido, Rendimento, TipoPratica) VALUES
(1, 101000001, 'Tomate',       '2024-03-15', '2024-06-20', 4.5, 'Biológica'),
(2, 101000002, 'Batata',       '2024-02-01', '2024-05-10', 6.0, 'Convencional'),
(3, 101000003, 'Cenoura',      '2024-04-10', '2024-07-15', 5.2, 'Biológica'),
(4, 101000004, 'Milho',        '2024-03-25', '2024-07-30', 7.0, 'Convencional'),
(5, 101000005, 'Couve',        '2024-01-15', '2024-04-20', 3.8, 'Biológica'),
(6, 101000006, 'Alface',       '2024-03-01', '2024-05-25', 2.9, 'Hidroponia'),
(7, 101000007, 'Pepino',       '2024-02-20', '2024-05-30', 4.2, 'Biológica'),
(8, 101000008, 'Tomate',       '2024-04-05', '2024-07-10', 5.5, 'Convencional'),
(9, 101000009, 'Pimento',      '2024-03-12', '2024-06-18', 3.6, 'Biológica'),
(10,101000010, 'Batata-doce',  '2024-02-28', '2024-06-05', 6.3, 'Convencional');

-- =============================================
-- TRATAMENTOS
-- =============================================
INSERT INTO Tratamentos (Nome, Fornecedor, QuantidadeUsada, DataAplicacao) VALUES
('Fertimax NPK',     'AgroQuímica Lda',  50, '2024-03-10'),
('BioGrow Verde',    'Bioplantas SA',    30, '2024-03-15'),
('AquaBoost',        'IrrigaTech',       20, '2024-03-18'),
('TerraFértil Plus', 'AgroSolo',         40, '2024-04-01'),
('AntiPraga X1',     'ProtectAgro',      25, '2024-04-10'),
('FungoStop B',      'BioSafe',          35, '2024-04-12'),
('RootStart',        'PlantaVida',       15, '2024-04-20'),
('CloroZero',        'IrrigaTech',       10, '2024-04-22'),
('VerdeMais',        'AgroVerde',        60, '2024-05-01'),
('PestBlock Z',      'ProtectAgro',      45, '2024-05-05');

-- Atualização de estoque de tratamentos
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 200 WHERE Nome = 'Fertimax NPK';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 180 WHERE Nome = 'BioGrow Verde';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 150 WHERE Nome = 'AquaBoost';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 170 WHERE Nome = 'TerraFértil Plus';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 160 WHERE Nome = 'AntiPraga X1';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 140 WHERE Nome = 'FungoStop B';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 130 WHERE Nome = 'RootStart';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 120 WHERE Nome = 'CloroZero';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 190 WHERE Nome = 'VerdeMais';
UPDATE Tratamentos SET QuantidadeEstoqueTotal = 175 WHERE Nome = 'PestBlock Z';


-- =============================================
-- REGISTOS DE PRODUÇÃO
-- =============================================
INSERT INTO RegistosProducao (LoteID, Cultivo_ID_Registos_Producao, Quantidade, DataColhida, Qualidade, Destino) VALUES
(1, 1, 1500, '2024-06-21', 1, 'Distribuidor A'),
(2, 2, 2200, '2024-05-11', 1, 'Distribuidor B'),
(3, 3, 1800, '2024-07-16', 0, 'Distribuidor C'),
(4, 4, 2600, '2024-08-01', 1, 'Distribuidor D'),
(5, 5, 1300, '2024-04-21', 1, 'Distribuidor A'),
(6, 6,  950, '2024-05-26', 0, 'Distribuidor E'),
(7, 7, 1600, '2024-06-01', 1, 'Distribuidor B'),
(8, 8, 2000, '2024-07-11', 1, 'Distribuidor C'),
(9, 9, 1400, '2024-06-19', 0, 'Distribuidor D'),
(10,10,2100, '2024-06-06', 1, 'Distribuidor E');


-- =============================================
-- SENSORES IoT
-- =============================================
INSERT INTO Sensores_IoT (ID, Cultivo_ID_Sensores, Temperatura, humidadeSolo, QualidadeAr, NivelIrrigacao, luminosidade) VALUES
(1, 1, 18.5, 78.2, 85.1, 60.5, 320),
(2, 2, 26.3, 60.1, 72.3, 75.0, 890),
(3, 3, 24.9, 63.7, 70.2, 80.1, 750),
(4, 4, 17.2, 81.5, 90.0, 55.5, 310),
(5, 5, 27.8, 58.4, 68.9, 70.0, 910),
(6, 6, 25.5, 62.9, 75.6, 78.3, 800);


-- =============================================
-- GESTÃO DE RECURSOS
-- =============================================
INSERT INTO Gestao_Recursos (ID, Sensor_ID_GestaoRecursos, NIF_Produtor, Data, Tipo_Recurso, Quantidade, Custo, Descricao) VALUES
(1, 1, 101000001, '2024-03-15', 'Água',        500, 30.00, 'Rega para plantação de tomate'),
(2, 2, 101000002, '2024-03-18', 'Fertilizante', 50, 60.00, 'Aplicação de Fertimax'),
(3, 3, 101000003, '2024-03-20', 'Água',        600, 35.00, 'Rega para batatas'),
(4, 4, 101000004, '2024-04-01', 'Pesticida',    20, 40.00, 'Controle de pragas em milho'),
(5, 5, 101000005, '2024-04-05', 'Água',        450, 27.00, 'Rega couves'),
(6, 6, 101000006, '2024-04-07', 'Água',        300, 20.00, 'Rega alfaces');

-- =============================================
-- RF9: Produtos mais vendidos por produtor
-- =============================================
INSERT INTO ProdutosMaisVendidos (Produtor_NIF_PMV, TipoProduto, QuantidadeVendidaTotal)
SELECT 
    P.NIF,
    C.Tipo,
    SUM(CZ.QuantidadeVendida)
FROM 
    Produtor P
JOIN Cultivo C ON C.Produtor_NIF_Cultivo = P.NIF
JOIN RegistosProducao RP ON RP.Cultivo_ID_Registos_Producao = C.ID
JOIN Comercializacao CZ ON CZ.LoteID_RegistosProducao = RP.LoteID
GROUP BY 
    P.NIF, C.Tipo;

-- Comercializações simuladas para os mesmos LoteIDs já inseridos nos RegistosProducao
INSERT INTO Comercializacao (ID, LoteID_RegistosProducao, Precokg, CustosLogistica, ProcuraMercado, DataVenda, QuantidadeVendida) VALUES
(1, 1, 2.00, 100, 300, '2024-06-22', 1400),
(2, 2, 1.90, 120, 250, '2024-05-12', 2000),
(3, 3, 2.50, 130, 310, '2024-07-17', 1600),
(4, 4, 1.80, 110, 270, '2024-08-02', 2500),
(5, 5, 2.10, 100, 290, '2024-04-22', 1250),
(6, 6, 2.20, 90, 230,  '2024-05-27', 900),
(7, 7, 2.00, 85, 300,  '2024-06-02', 1500),
(8, 8, 2.40, 95, 280,  '2024-07-12', 1900),
(9, 9, 1.95, 100, 260, '2024-06-20', 1300),
(10, 10, 2.05, 110, 270, '2024-06-07', 2000);


