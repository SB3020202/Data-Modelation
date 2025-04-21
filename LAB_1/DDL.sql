-- Operações CRUD

-- Produtores --
INSERT INTO Produtor (NIF, Name, Address, PhoneNum, AreaCultivada) VALUES
(101000001, 'João Silva',      'Rua das Oliveiras, 12',   912345678, '5.0'),
(101000002, 'Maria Santos',    'Estrada Nacional 1, km 30', 913456789, '3.2'),
(101000003, 'Carlos Matos',    'Rua do Pomar, 45',         914567890, '7.5'),
(101000004, 'Ana Oliveira',    'Av. das Flores, 120',      915678901, '2.8'),
(101000005, 'Ricardo Costa',   'Rua do Campo, 88',         916789012, '4.6'),
(101000006, 'Teresa Fonseca',  'Monte da Serra, Lote 3',   917890123, '6.1'),
(101000007, 'Bruno Ribeiro',   'Quinta do Vale, 17',       918901234, '8.3'),
(101000008, 'Paula Mendes',    'Travessa da Videira, 6',   919012345, '3.9'),
(101000009, 'Miguel Rocha',    'Rua do Pinhal, 23',        911123456, '5.7'),
(101000010, 'Helena Lima',     'Estrada da Vinha, 50',     912234567, '6.8');


-- Cultivo --
INSERT INTO Cultivo (
    ID, Produtor_NIF_Cultivo, Tipo, DataPlantado, DataColhido, Rendimento, TipoPratica
) VALUES
    (1,  101000001, 'Tomate',       '2024-03-15', '2024-06-20', 4.5, 'Biológica'),
    (2,  101000002, 'Batata',       '2024-02-01', '2024-05-10', 6.0, 'Convencional'),
    (3,  101000003, 'Cenoura',      '2024-04-10', '2024-07-15', 5.2, 'Biológica'),
    (4,  101000004, 'Milho',        '2024-03-25', '2024-07-30', 7.0, 'Convencional'),
    (5,  101000005, 'Couve',        '2024-01-15', '2024-04-20', 3.8, 'Biológica'),
    (6,  101000006, 'Alface',       '2024-03-01', '2024-05-25', 2.9, 'Hidroponia'),
    (7,  101000007, 'Pepino',       '2024-02-20', '2024-05-30', 4.2, 'Biológica'),
    (8,  101000008, 'Tomate',       '2024-04-05', '2024-07-10', 5.5, 'Convencional'),
    (9,  101000009, 'Pimento',      '2024-03-12', '2024-06-18', 3.6, 'Biológica'),
    (10, 101000010, 'Batata-doce',  '2024-02-28', '2024-06-05', 6.3, 'Convencional');

-- Tratamentos --
INSERT INTO Tratamentos (Nome, Fornecedor, QuantidadeUsada, DataAplicacao) VALUES
    ('Fertimax NPK',      'AgroQuímica Lda',  50, '2024-03-10'),
    ('BioGrow Verde',     'Bioplantas SA',    30, '2024-03-15'),
    ('AquaBoost',         'IrrigaTech',       20, '2024-03-18'),
    ('TerraFértil Plus',  'AgroSolo',         40, '2024-04-01'),
    ('AntiPraga X1',      'ProtectAgro',      25, '2024-04-10'),
    ('FungoStop B',       'BioSafe',          35, '2024-04-12'),
    ('RootStart',         'PlantaVida',       15, '2024-04-20'),
    ('CloroZero',         'IrrigaTech',       10, '2024-04-22'),
    ('VerdeMais',         'AgroVerde',        60, '2024-05-01'),
    ('PestBlock Z',       'ProtectAgro',      45, '2024-05-05');

-- RegistosProducao --
INSERT INTO RegistosProducao (
    LoteID, Cultivo_ID_Registos_Producao, Quantidade, DataColhida, Qualidade, Destino
) VALUES
    (1,  1,  1500, '2024-06-21', 1, 'Distribuidor A'),
    (2,  2,  2200, '2024-05-11', 1, 'Distribuidor B'),
    (3,  3,  1800, '2024-07-16', 0, 'Distribuidor C'),
    (4,  4,  2600, '2024-08-01', 1, 'Distribuidor D'),
    (5,  5,  1300, '2024-04-21', 1, 'Distribuidor A'),
    (6,  6,   950, '2024-05-26', 0, 'Distribuidor E'),
    (7,  7,  1600, '2024-06-01', 1, 'Distribuidor B'),
    (8,  8,  2000, '2024-07-11', 1, 'Distribuidor C'),
    (9,  9,  1400, '2024-06-19', 0, 'Distribuidor D'),
    (10,10, 2100, '2024-06-06', 1, 'Distribuidor E');
