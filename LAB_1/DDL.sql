INSERT INTO `Gestao_Recursos` (`ID`, `NIF_Produtor`, `Data`, `Tipo_Recurso`, `Quantidade`, `Custo`, `Descricao`)
VALUES
(1, 123456789, '2025-01-01', 'Água', 100.0, 50.0, 'Recurso inicial para o produtor');
(2, 123456789, '2025-01-02', 'Pão', 150.0, 20.0, 'Recurso 2'),
(3, 123456789, '2025-01-02', 'Morangos', 50.0, 10.0, 'Recurso 3');

INSERT INTO smartagriculture_db.produtor
(`NIF`, `Name`, `Address`, `Number`, `Area_Cultivada`, `Gestao_Recursos_ID`)
VALUES 
(1, 'João Silva', 'Rua das Flores, 123', '912345678', '15 hectares', 1),
(2, 'Cristiano Ronaldo', 'Cais do Sodré, 2', '911222333', '2 metros', 1),
(3, 'Maria Fernandes', 'Avenida da Liberdade, 45', '934567890', '10 hectares', 2),
(4, 'Pedro Costa', 'Rua do Carmo, 88', '918273645', '7 hectares', 2),
(5, 'Ana Martins', 'Travessa do Comércio, 12', '926374829', '3 hectares', 1),
(6, 'Ricardo Santos', 'Rua Augusta, 200', '935647382', '20 hectares', 2),
(7, 'Sofia Oliveira', 'Avenida de Roma, 50', '917364829', '5 hectares', 3),
(8, 'Tiago Pereira', 'Rua Garrett, 30', '914738291', '12 hectares', 1),
(9, 'Beatriz Lopes', 'Largo do Chiado, 5', '913847291', '8 hectares', 3),
(10, 'Miguel Almeida', 'Praça da Figueira, 7', '936192837', '6 hectares', 2),
(11, 'Carla Ribeiro', 'Rua do Ouro, 15', '912837465', '14 hectares', 2),
(12, 'André Carvalho', 'Avenida Almirante Reis, 80', '915374829', '18 hectares', 1),
(13, 'Inês Sousa', 'Rua de São Paulo, 4', '916283746', '9 hectares', 3),
(14, 'Diogo Gonçalves', 'Rua Castilho, 100', '917465839', '11 hectares', 2),
(15, 'Marta Rocha', 'Calçada da Glória, 22', '918374652', '13 hectares', 1),
(16, 'Bruno Mendes', 'Rua das Portas de Santo Antão, 9', '919283746', '16 hectares', 3),
(17, 'Patrícia Nunes', 'Rua da Prata, 56', '920374819', '4 hectares', 2),
(18, 'Rui Moreira', 'Rua dos Fanqueiros, 3', '921374829', '7 hectares', 1),
(19, 'Cláudia Leite', 'Praça do Comércio, 1', '922837465', '22 hectares', 3),
(20, 'Vasco Lopes', 'Rua de São Nicolau, 14', '923647382', '30 hectares', 2),
(21, 'Helena Ferreira', 'Rua de Santa Justa, 18', '924738291', '19 hectares', 1),
(22, 'Nuno Silva', 'Travessa de Santo António, 6', '925374829', '6 hectares', 2),
(23, 'Leonor Santos', 'Rua Nova do Almada, 7', '926374829', '3 hectares', 3),
(24, 'Alexandre Pinto', 'Rua do Arsenal, 2', '927374829', '28 hectares', 1),
(25, 'Vanessa Matos', 'Rua dos Douradores, 40', '928374829', '24 hectares', 2),
(26, 'Eduardo Gomes', 'Rua da Madalena, 12', '929374829', '17 hectares', 3),
(27, 'Filipa Correia', 'Rua dos Correeiros, 55', '930374829', '13 hectares', 1),
(28, 'Gonçalo Ribeiro', 'Rua da Conceição, 16', '931374829', '8 hectares', 3),
(29, 'Catarina Figueiredo', 'Rua do Crucifixo, 19', '932374829', '9 hectares', 2),
(30, 'Henrique Matias', 'Rua Áurea, 31', '933374829', '21 hectares', 2);

INSERT INTO `smartagriculture_db`.`alertas`
(`ID_Alerta`,`ID_Sensor`,`Cultivo_ID`,`Data_Alerta`,`alerta_humidade`,`alerta_temperatura`,`alerta_irrigacao`,`alerta_qualidade`)
VALUES
(1, 1, 1, '2025-04-10', 1, 0, 2, 0),
(2, 2, 2, '2025-04-09', 2, 2, 0, 3),
(3, 3, 1, '2025-04-08', 0, 1, 0, 0),
(4, 4, 3, '2025-04-07', 3, 3, 1, 1),
(5, 5, 2, '2025-04-06', 1, 0, 0, 2),
(6, 6, 4, '2025-04-05', 0, 2, 3, 0),
(7, 7, 3, '2025-04-04', 2, 3, 0, 1),
(8, 8, 5, '2025-04-03', 0, 1, 1, 0),
(9, 9, 4, '2025-04-02', 3, 3, 3, 3),
(10, 10, 5, '2025-04-01', 0, 0, 2, 0);

INSERT INTO `smartagriculture_db`.`sensores_iot`
(`ID_Sensor`,`Temperatura`,` humidade_solo`,`Qualidade_ar`,`Nivel_Irrigacao`,`Alertas_ID_Alerta`,`   Gestao de recursos_ID`)
VALUES
(1, 22.5, 35.0, 80.0, 50.0, 1, 1),
(2, 24.1, 40.2, 78.5, 45.0, 2, 1),
(3, 20.0, 30.5, 82.3, 55.0, 3, 2),
(4, 26.7, 45.3, 75.0, 60.0, 4, 2),
(5, 23.4, 38.0, 79.1, 52.5, 5, 3),
(6, 25.0, 42.7, 76.9, 48.0, 6, 3),
(7, 21.8, 34.9, 81.0, 53.0, 7, 2),
(8, 27.2, 47.5, 74.5, 61.0, 8, 2),
(9, 22.9, 36.4, 80.2, 49.5, 9, 1),
(10, 24.8, 41.3, 77.8, 54.0, 10, 3);

INSERT INTO `smartagriculture_db`.`registos_producao`
(`ID_Lote`,`Quantidade`,`Data_colheita`,`Qualidade`,`Destino`,`Cultivo_ID`,`Cultivo_Produtor_NIF`,`Comercializacao_ID_Comercializacao`)
VALUES
(1, 5000, '2025-01-10', 1, 'Local Market', 1, 123456789, 101),
(2, 6000, '2025-01-15', 0, 'Export', 1, 123456789, 102),
(3, 4500, '2025-02-02', 1, 'Local Market', 2, 123456789, 103),
(4, 7000, '2025-03-05', 1, 'Export', 2, 123456789, 104),
(5, 8000, '2025-04-01', 1, 'Wholesale', 3, 123456789, 105);

INSERT INTO `smartagriculture_db`.`cultivo`
(`ID`,`Tipo`,`Tempo_Culticacao`,`Tempo_Colheita`,`Rendimento`,`Tipo_Pratica`,`Produtor_NIF`,`Sensores IoT_ID_Sensor`,`Alertas_ID_Alerta`)
VALUES
(1, 'Milho', '120 dias', '30 dias', '9000 kg/hectare', 'Convencional', 1, 1, 1),
(2,'Trigo', '150 dias', '40 dias', '7000 kg/hectare', 'Biológica', 1, 2, 2),
(3,  'Arroz', '140 dias', '35 dias', '8000 kg/hectare', 'Convencional', 3, 3, 1),
(4, 'Cevada', '130 dias', '25 dias', '6500 kg/hectare', 'Biológica', 2, 1, 3),
(5,  'Soja', '110 dias', '20 dias', '7200 kg/hectare', 'Convencional', 5, 2, 2),
(6, 'Batata', '100 dias', '15 dias', '10000 kg/hectare', 'Biológica', 6, 3, 1),
(7,  'Tomate', '90 dias', '20 dias', '12000 kg/hectare', 'Convencional', 7, 1, 3),
(8,  'Girassol', '80 dias', '18 dias', '4000 kg/hectare', 'Biológica', 8, 2, 2),
(9, 'Vinha', '200 dias', '50 dias', '6000 kg/hectare', 'Convencional', 9, 3, 1),
(10, 'Olival', '220 dias', '60 dias', '5000 kg/hectare', 'Biológica', 10, 1, 3);