-- =====================================================
-- 02_CARGA.SQL
-- Dados fictícios da Clínica de Fisioterapia
-- PostgreSQL 14+
-- =====================================================


-- =====================================================
-- 1. ESPECIALIDADE
-- =====================================================

INSERT INTO ESPECIALIDADE
    (id_especialidade, nome_especialidade, descricao)
VALUES
    (1, 'Ortopédica', 'Tratamento de lesões e alterações musculoesqueléticas'),
    (2, 'Neurológica', 'Tratamento de alterações neurológicas'),
    (3, 'Respiratória', 'Tratamento e reabilitação do sistema respiratório'),
    (4, 'Desportiva', 'Tratamento e prevenção de lesões esportivas');


-- =====================================================
-- 2. PROFISSIONAL
-- =====================================================

INSERT INTO PROFISSIONAL
    (id_profissional, nome, cpf, data_admissao, telefone)
VALUES
    (1, 'Ana Carolina Silva', '10000000001', '2023-01-10', '61991000001'),
    (2, 'Bruno Henrique Costa', '10000000002', '2023-02-15', '61991000002'),
    (3, 'Camila Oliveira Santos', '10000000003', '2023-03-20', '61991000003'),
    (4, 'Daniel Pereira Lima', '10000000004', '2023-04-05', '61991000004'),
    (5, 'Eduarda Martins Alves', '10000000005', '2023-05-12', '61991000005'),
    (6, 'Felipe Rodrigues Souza', '10000000006', '2023-06-01', '61991000006'),
    (7, 'Gabriela Ferreira Rocha', '10000000007', '2023-07-17', '61991000007'),
    (8, 'Henrique Gomes Dias', '10000000008', '2023-08-21', '61991000008'),
    (9, 'Isabela Mendes Castro', '10000000009', '2023-09-04', '61991000009'),
    (10, 'João Victor Almeida', '10000000010', '2023-10-09', '61991000010'),
    (11, 'Larissa Ribeiro', '10000000011', '2024-01-15', '61991000011'),
    (12, 'Marcos Vinicius Lopes', '10000000012', '2024-02-20', '61991000012');


-- =====================================================
-- 3. FISIOTERAPEUTA
-- =====================================================

INSERT INTO FISIOTERAPEUTA
    (id_profissional, numero_crefito)
VALUES
    (1, 'CREFITO-11-10001'),
    (2, 'CREFITO-11-10002'),
    (3, 'CREFITO-11-10003'),
    (4, 'CREFITO-11-10004'),
    (5, 'CREFITO-11-10005'),
    (6, 'CREFITO-11-10006');


-- =====================================================
-- 4. RECEPCIONISTA
-- =====================================================

INSERT INTO RECEPCIONISTA
    (id_profissional, ramal)
VALUES
    (7, '201'),
    (8, '202'),
    (9, '203');


-- =====================================================
-- 5. ADMINISTRATIVO
-- =====================================================

INSERT INTO ADMINISTRATIVO
    (id_profissional, cargo)
VALUES
    (10, 'Administrador'),
    (11, 'Financeiro'),
    (12, 'Recursos Humanos');


-- =====================================================
-- 6. QUALIFICACAO
-- =====================================================

INSERT INTO QUALIFICACAO
    (id_profissional, id_especialidade, data_qualificacao)
VALUES
    (1, 1, '2023-02-01'),
    (1, 4, '2023-03-01'),
    (2, 2, '2023-03-10'),
    (3, 3, '2023-04-10'),
    (4, 1, '2023-05-01'),
    (5, 4, '2023-06-10'),
    (6, 2, '2023-07-10');


-- =====================================================
-- 7. CONVENIO
-- =====================================================

INSERT INTO CONVENIO
    (id_convenio, nome_convenio, registro_ans)
VALUES
    (1, 'Unimed', '123456'),
    (2, 'Bradesco Saude', '234567'),
    (3, 'Amil', '345678'),
    (4, 'SulAmerica', '456789'),
    (5, 'Particular', '000000');


-- =====================================================
-- 8. SALA
-- =====================================================

INSERT INTO SALA
    (id_sala, numero_sala, capacidade)
VALUES
    (1, '101', 2),
    (2, '102', 2),
    (3, '103', 3),
    (4, '104', 2),
    (5, '105', 4),
    (6, '106', 2);


-- =====================================================
-- 9. EQUIPAMENTO_SALA
-- =====================================================

INSERT INTO EQUIPAMENTO_SALA
    (id_sala, equipamento)
VALUES
    (1, 'Maca'),
    (1, 'Bola Suica'),
    (2, 'Maca'),
    (2, 'Ultrassom'),
    (3, 'Maca'),
    (3, 'Bicicleta Ergometrica'),
    (4, 'Maca'),
    (4, 'TENS'),
    (5, 'Maca'),
    (5, 'Esteira'),
    (6, 'Maca'),
    (6, 'Barra Paralela');


-- =====================================================
-- 10. PROCEDIMENTO
-- =====================================================

INSERT INTO PROCEDIMENTO
    (id_procedimento, nome_procedimento, id_especialidade,
     valor_tabela, duracao_padrao_min)
VALUES
    (1, 'Avaliacao Fisioterapeutica', 1, 150.00, 60),
    (2, 'Cinesioterapia', 1, 100.00, 50),
    (3, 'Terapia Manual', 1, 120.00, 50),
    (4, 'Reabilitacao Neurologica', 2, 160.00, 60),
    (5, 'Treino de Marcha', 2, 140.00, 50),
    (6, 'Fisioterapia Respiratoria', 3, 130.00, 50),
    (7, 'Exercicios Respiratorios', 3, 110.00, 40),
    (8, 'Reabilitacao Esportiva', 4, 150.00, 60),
    (9, 'Fortalecimento Muscular', 4, 100.00, 50),
    (10, 'Alongamento Terapapeutico', 1, 90.00, 40);


-- =====================================================
-- 11. COBERTURA
-- =====================================================

INSERT INTO COBERTURA
    (id_convenio, id_procedimento, percentual_cobertura)
VALUES
    (1, 1, 80.00),
    (1, 2, 80.00),
    (1, 3, 70.00),
    (1, 4, 80.00),
    (1, 5, 80.00),
    (2, 1, 90.00),
    (2, 2, 80.00),
    (2, 4, 90.00),
    (2, 6, 80.00),
    (3, 1, 80.00),
    (3, 3, 80.00),
    (3, 6, 80.00),
    (3, 8, 70.00),
    (4, 1, 90.00),
    (4, 2, 90.00),
    (4, 4, 80.00),
    (4, 7, 80.00);


-- =====================================================
-- 12. PACIENTE
-- 50 pacientes ficticios
-- =====================================================

INSERT INTO PACIENTE
    (id_paciente, cpf, nome, data_nascimento,
     logradouro, numero, bairro, cidade, UF, CEP,
     id_paciente_indicador)
VALUES
    (1, '20000000001', 'Alice Martins', '1990-03-15', 'Rua das Flores', '101', 'Asa Sul', 'Brasilia', 'DF', '70000001', NULL),
    (2, '20000000002', 'Beatriz Souza', '1985-07-22', 'Rua Central', '202', 'Asa Norte', 'Brasilia', 'DF', '70000002', 1),
    (3, '20000000003', 'Carlos Eduardo Lima', '1992-11-10', 'Avenida Brasil', '303', 'Taguatinga', 'Brasilia', 'DF', '72000003', 1),
    (4, '20000000004', 'Daniela Oliveira', '1978-01-05', 'Rua do Sol', '404', 'Ceilandia', 'Brasilia', 'DF', '72000004', 2),
    (5, '20000000005', 'Eduardo Santos', '1995-05-18', 'Rua Verde', '505', 'Samambaia', 'Brasilia', 'DF', '72300005', 3),
    (6, '20000000006', 'Fernanda Costa', '1988-09-30', 'Rua Primavera', '606', 'Guara', 'Brasilia', 'DF', '71000006', 4),
    (7, '20000000007', 'Gabriel Rocha', '1999-02-12', 'Rua das Palmeiras', '707', 'Lago Sul', 'Brasilia', 'DF', '71600007', 5),
    (8, '20000000008', 'Helena Ferreira', '1982-06-25', 'Rua das Acacias', '808', 'Lago Norte', 'Brasilia', 'DF', '71500008', 6),
    (9, '20000000009', 'Igor Almeida', '1991-12-03', 'Rua Azul', '909', 'Sudoeste', 'Brasilia', 'DF', '70600009', 7),
    (10, '20000000010', 'Juliana Ribeiro', '1987-04-17', 'Rua Nova', '1001', 'Octogonal', 'Brasilia', 'DF', '70600010', 8),
    (11, '20000000011', 'Lucas Mendes', '1993-08-21', 'Rua Bela Vista', '110', 'Asa Sul', 'Brasilia', 'DF', '70000011', 9),
    (12, '20000000012', 'Mariana Alves', '1996-10-14', 'Rua Principal', '120', 'Asa Norte', 'Brasilia', 'DF', '70000012', 10),
    (13, '20000000013', 'Nicolas Gomes', '1980-02-28', 'Rua das Arvores', '130', 'Taguatinga', 'Brasilia', 'DF', '72000013', 11),
    (14, '20000000014', 'Olivia Castro', '1989-06-09', 'Rua da Paz', '140', 'Ceilandia', 'Brasilia', 'DF', '72000014', 12),
    (15, '20000000015', 'Paulo Henrique', '1975-11-19', 'Rua Esperanca', '150', 'Samambaia', 'Brasilia', 'DF', '72300015', 13),
    (16, '20000000016', 'Rafaela Dias', '1994-03-07', 'Rua das Rosas', '160', 'Guara', 'Brasilia', 'DF', '71000016', 14),
    (17, '20000000017', 'Samuel Martins', '1983-07-11', 'Rua do Parque', '170', 'Lago Sul', 'Brasilia', 'DF', '71600017', 15),
    (18, '20000000018', 'Tatiana Lopes', '1990-09-16', 'Rua Horizonte', '180', 'Lago Norte', 'Brasilia', 'DF', '71500018', 16),
    (19, '20000000019', 'Vinicius Souza', '1997-01-23', 'Rua Liberdade', '190', 'Sudoeste', 'Brasilia', 'DF', '70600019', 17),
    (20, '20000000020', 'Yasmin Pereira', '1986-05-04', 'Rua Harmonia', '200', 'Octogonal', 'Brasilia', 'DF', '70600020', 18),
    (21, '20000000021', 'Andre Luiz', '1992-08-13', 'Rua do Lago', '210', 'Asa Sul', 'Brasilia', 'DF', '70000021', 19),
    (22, '20000000022', 'Bruna Carvalho', '1984-12-29', 'Rua das Flores', '220', 'Asa Norte', 'Brasilia', 'DF', '70000022', 20),
    (23, '20000000023', 'Caio Fernandes', '1998-04-08', 'Rua Central', '230', 'Taguatinga', 'Brasilia', 'DF', '72000023', 21),
    (24, '20000000024', 'Diana Martins', '1979-10-25', 'Avenida Brasil', '240', 'Ceilandia', 'Brasilia', 'DF', '72000024', 22),
    (25, '20000000025', 'Enzo Rodrigues', '2000-02-15', 'Rua do Sol', '250', 'Samambaia', 'Brasilia', 'DF', '72300025', 23),
    (26, '20000000026', 'Flavia Nunes', '1988-06-18', 'Rua Verde', '260', 'Guara', 'Brasilia', 'DF', '71000026', 24),
    (27, '20000000027', 'Gustavo Vieira', '1993-09-27', 'Rua Primavera', '270', 'Lago Sul', 'Brasilia', 'DF', '71600027', 25),
    (28, '20000000028', 'Heloisa Moraes', '1981-03-31', 'Rua das Palmeiras', '280', 'Lago Norte', 'Brasilia', 'DF', '71500028', 26),
    (29, '20000000029', 'Ivan Oliveira', '1995-07-06', 'Rua das Acacias', '290', 'Sudoeste', 'Brasilia', 'DF', '70600029', 27),
    (30, '20000000030', 'Julia Fernandes', '1987-11-12', 'Rua Azul', '300', 'Octogonal', 'Brasilia', 'DF', '70600030', 28),
    (31, '20000000031', 'Leonardo Costa', '1991-01-20', 'Rua Nova', '310', 'Asa Sul', 'Brasilia', 'DF', '70000031', 29),
    (32, '20000000032', 'Manuela Silva', '1999-05-16', 'Rua Bela Vista', '320', 'Asa Norte', 'Brasilia', 'DF', '70000032', 30),
    (33, '20000000033', 'Nathan Santos', '1985-08-09', 'Rua Principal', '330', 'Taguatinga', 'Brasilia', 'DF', '72000033', 31),
    (34, '20000000034', 'Olga Ribeiro', '1977-12-18', 'Rua das Arvores', '340', 'Ceilandia', 'Brasilia', 'DF', '72000034', 32),
    (35, '20000000035', 'Pedro Henrique', '1996-04-23', 'Rua da Paz', '350', 'Samambaia', 'Brasilia', 'DF', '72300035', 33),
    (36, '20000000036', 'Quezia Alves', '1989-09-05', 'Rua Esperanca', '360', 'Guara', 'Brasilia', 'DF', '71000036', 34),
    (37, '20000000037', 'Ricardo Gomes', '1982-02-11', 'Rua das Rosas', '370', 'Lago Sul', 'Brasilia', 'DF', '71600037', 35),
    (38, '20000000038', 'Sabrina Castro', '1994-06-29', 'Rua do Parque', '380', 'Lago Norte', 'Brasilia', 'DF', '71500038', 36),
    (39, '20000000039', 'Thiago Lima', '1990-10-07', 'Rua Horizonte', '390', 'Sudoeste', 'Brasilia', 'DF', '70600039', 37),
    (40, '20000000040', 'Ursula Dias', '1986-01-14', 'Rua Liberdade', '400', 'Octogonal', 'Brasilia', 'DF', '70600040', 38),
    (41, '20000000041', 'Vitor Hugo', '1997-03-22', 'Rua Harmonia', '410', 'Asa Sul', 'Brasilia', 'DF', '70000041', 39),
    (42, '20000000042', 'Wesley Martins', '1983-07-28', 'Rua do Lago', '420', 'Asa Norte', 'Brasilia', 'DF', '70000042', 40),
    (43, '20000000043', 'Aline Carvalho', '1992-11-17', 'Rua das Flores', '430', 'Taguatinga', 'Brasilia', 'DF', '72000043', 41),
    (44, '20000000044', 'Bianca Fernandes', '1988-05-30', 'Rua Central', '440', 'Ceilandia', 'Brasilia', 'DF', '72000044', 42),
    (45, '20000000045', 'Cecilia Rocha', '1995-09-13', 'Avenida Brasil', '450', 'Samambaia', 'Brasilia', 'DF', '72300045', 43),
    (46, '20000000046', 'Diego Almeida', '1980-12-06', 'Rua do Sol', '460', 'Guara', 'Brasilia', 'DF', '71000046', 44),
    (47, '20000000047', 'Esther Lopes', '1998-02-19', 'Rua Verde', '470', 'Lago Sul', 'Brasilia', 'DF', '71600047', 45),
    (48, '20000000048', 'Fabio Nunes', '1985-06-24', 'Rua Primavera', '480', 'Lago Norte', 'Brasilia', 'DF', '71500048', 46),
    (49, '20000000049', 'Giovana Vieira', '1993-10-02', 'Rua das Palmeiras', '490', 'Sudoeste', 'Brasilia', 'DF', '70600049', 47),
    (50, '20000000050', 'Henrique Carvalho', '1987-04-11', 'Rua das Acacias', '500', 'Octogonal', 'Brasilia', 'DF', '70600050', 48);


-- =====================================================
-- 13. TELEFONE_PACIENTE
-- =====================================================

INSERT INTO TELEFONE_PACIENTE
    (id_paciente, telefone)
SELECT
    id_paciente,
    '619920' || LPAD(id_paciente::TEXT, 5, '0')
FROM PACIENTE;


-- =====================================================
-- 14. VINCULO_CONVENIO
-- =====================================================

INSERT INTO VINCULO_CONVENIO
    (id_paciente, id_convenio, data_inicio, data_fim, numero_carteirinha)
SELECT
    id_paciente,
    ((id_paciente - 1) % 4) + 1,
    DATE '2025-01-01' + ((id_paciente - 1) * 3),
    NULL,
    'CAR' || LPAD(id_paciente::TEXT, 8, '0')
FROM PACIENTE
WHERE id_paciente <= 40;


-- =====================================================
-- 15. AGENDAMENTO
-- 120 agendamentos
-- =====================================================

INSERT INTO AGENDAMENTO
    (id_agendamento, id_paciente, id_fisioterapeuta, id_sala,
     data_hora_inicio, data_hora_fim, status)
SELECT
    gs,
    ((gs - 1) % 50) + 1,
    ((gs - 1) % 6) + 1,
    ((gs - 1) % 6) + 1,
    TIMESTAMP '2026-01-05 08:00:00'
        + ((gs - 1) * INTERVAL '1 day'),
    TIMESTAMP '2026-01-05 08:00:00'
        + ((gs - 1) * INTERVAL '1 day')
        + INTERVAL '50 minutes',
    CASE
        WHEN gs <= 100 THEN 'CONCLUIDO'
        WHEN gs <= 110 THEN 'REALIZADO'
        ELSE 'AGENDADO'
    END
FROM generate_series(1, 120) AS gs;


-- =====================================================
-- 16. ITEM_AGENDAMENTO
-- =====================================================

INSERT INTO ITEM_AGENDAMENTO
    (id_agendamento, id_procedimento, valor_cobrado, duracao_realizada)
SELECT
    id_agendamento,
    ((id_agendamento - 1) % 10) + 1,
    CASE
        WHEN ((id_agendamento - 1) % 10) + 1 = 1 THEN 150.00
        WHEN ((id_agendamento - 1) % 10) + 1 = 2 THEN 100.00
        WHEN ((id_agendamento - 1) % 10) + 1 = 3 THEN 120.00
        WHEN ((id_agendamento - 1) % 10) + 1 = 4 THEN 160.00
        WHEN ((id_agendamento - 1) % 10) + 1 = 5 THEN 140.00
        WHEN ((id_agendamento - 1) % 10) + 1 = 6 THEN 130.00
        WHEN ((id_agendamento - 1) % 10) + 1 = 7 THEN 110.00
        WHEN ((id_agendamento - 1) % 10) + 1 = 8 THEN 150.00
        WHEN ((id_agendamento - 1) % 10) + 1 = 9 THEN 100.00
        ELSE 90.00
    END,
    50
FROM AGENDAMENTO;


-- =====================================================
-- 17. EVOLUCAO
-- =====================================================

INSERT INTO EVOLUCAO
    (id_paciente, num_evolucao, data_evolucao,
     id_agendamento, id_fisioterapeuta_responsavel,
     descricao_evolucao)
SELECT
    a.id_paciente,
    ROW_NUMBER() OVER (
        PARTITION BY a.id_paciente
        ORDER BY a.id_agendamento
    )::INT,
    a.data_hora_inicio::DATE,
    a.id_agendamento,
    a.id_fisioterapeuta,
    'Paciente apresentou evolucao satisfatoria durante a sessao.'
FROM AGENDAMENTO a
WHERE a.status = 'CONCLUIDO';


-- =====================================================
-- FIM DA CARGA
-- =====================================================
