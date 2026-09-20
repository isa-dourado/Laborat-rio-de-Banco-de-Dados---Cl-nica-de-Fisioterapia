CREATE DATABASE IF NOT EXISTS clinica_fisioterapia;

USE clinica_fisioterapia;


-- =====================================================
-- 1. PACIENTE
-- =====================================================

CREATE TABLE PACIENTE (
    id_paciente INT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    logradouro VARCHAR(150),
    numero VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    UF CHAR(2),
    CEP VARCHAR(8),
    id_paciente_indicador INT,

    CONSTRAINT fk_paciente_indicador
        FOREIGN KEY (id_paciente_indicador)
        REFERENCES PACIENTE(id_paciente)
);


-- =====================================================
-- 2. TELEFONE_PACIENTE
-- =====================================================

CREATE TABLE TELEFONE_PACIENTE (
    id_paciente INT,
    telefone VARCHAR(20),

    PRIMARY KEY (id_paciente, telefone),

    CONSTRAINT fk_telefone_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES PACIENTE(id_paciente)
);


-- =====================================================
-- 3. PROFISSIONAL
-- =====================================================

CREATE TABLE PROFISSIONAL (
    id_profissional INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_admissao DATE,
    telefone VARCHAR(20)
);


-- =====================================================
-- 4. FISIOTERAPEUTA
-- =====================================================

CREATE TABLE FISIOTERAPEUTA (
    id_profissional INT PRIMARY KEY,
    numero_crefito VARCHAR(30) NOT NULL UNIQUE,

    CONSTRAINT fk_fisioterapeuta_profissional
        FOREIGN KEY (id_profissional)
        REFERENCES PROFISSIONAL(id_profissional)
);


-- =====================================================
-- 5. RECEPCIONISTA
-- =====================================================

CREATE TABLE RECEPCIONISTA (
    id_profissional INT PRIMARY KEY,
    ramal VARCHAR(10),

    CONSTRAINT fk_recepcionista_profissional
        FOREIGN KEY (id_profissional)
        REFERENCES PROFISSIONAL(id_profissional)
);


-- =====================================================
-- 6. ADMINISTRATIVO
-- =====================================================

CREATE TABLE ADMINISTRATIVO (
    id_profissional INT PRIMARY KEY,
    cargo VARCHAR(100),

    CONSTRAINT fk_administrativo_profissional
        FOREIGN KEY (id_profissional)
        REFERENCES PROFISSIONAL(id_profissional)
);


-- =====================================================
-- 7. ESPECIALIDADE
-- =====================================================

CREATE TABLE ESPECIALIDADE (
    id_especialidade INT PRIMARY KEY,
    nome_especialidade VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);


-- =====================================================
-- 8. QUALIFICACAO
-- =====================================================

CREATE TABLE QUALIFICACAO (
    id_profissional INT,
    id_especialidade INT,
    data_qualificacao DATE,

    PRIMARY KEY (id_profissional, id_especialidade),

    CONSTRAINT fk_qualificacao_profissional
        FOREIGN KEY (id_profissional)
        REFERENCES PROFISSIONAL(id_profissional),

    CONSTRAINT fk_qualificacao_especialidade
        FOREIGN KEY (id_especialidade)
        REFERENCES ESPECIALIDADE(id_especialidade)
);


-- =====================================================
-- 9. CONVENIO
-- =====================================================

CREATE TABLE CONVENIO (
    id_convenio INT PRIMARY KEY,
    nome_convenio VARCHAR(100) NOT NULL,
    registro_ans VARCHAR(30)
);


-- =====================================================
-- 10. VINCULO_CONVENIO
-- =====================================================

CREATE TABLE VINCULO_CONVENIO (
    id_paciente INT,
    id_convenio INT,
    data_inicio DATE,
    data_fim DATE,
    numero_carteirinha VARCHAR(50),

    PRIMARY KEY (id_paciente, id_convenio, data_inicio),

    CONSTRAINT fk_vinculo_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES PACIENTE(id_paciente),

    CONSTRAINT fk_vinculo_convenio
        FOREIGN KEY (id_convenio)
        REFERENCES CONVENIO(id_convenio)
);


-- =====================================================
-- 11. SALA
-- =====================================================

CREATE TABLE SALA (
    id_sala INT PRIMARY KEY,
    numero_sala VARCHAR(20) NOT NULL,
    capacidade INT
);


-- =====================================================
-- 12. EQUIPAMENTO_SALA
-- =====================================================

CREATE TABLE EQUIPAMENTO_SALA (
    id_sala INT,
    equipamento VARCHAR(100),

    PRIMARY KEY (id_sala, equipamento),

    CONSTRAINT fk_equipamento_sala
        FOREIGN KEY (id_sala)
        REFERENCES SALA(id_sala)
);


-- =====================================================
-- 13. PROCEDIMENTO
-- =====================================================

CREATE TABLE PROCEDIMENTO (
    id_procedimento INT PRIMARY KEY,
    nome_procedimento VARCHAR(100) NOT NULL,
    id_especialidade INT,
    valor_tabela DECIMAL(10,2),
    duracao_padrao_min INT,

    CONSTRAINT fk_procedimento_especialidade
        FOREIGN KEY (id_especialidade)
        REFERENCES ESPECIALIDADE(id_especialidade)
);


-- =====================================================
-- 14. COBERTURA
-- =====================================================

CREATE TABLE COBERTURA (
    id_convenio INT,
    id_procedimento INT,
    percentual_cobertura DECIMAL(5,2),

    PRIMARY KEY (id_convenio, id_procedimento),

    CONSTRAINT fk_cobertura_convenio
        FOREIGN KEY (id_convenio)
        REFERENCES CONVENIO(id_convenio),

    CONSTRAINT fk_cobertura_procedimento
        FOREIGN KEY (id_procedimento)
        REFERENCES PROCEDIMENTO(id_procedimento)
);


-- =====================================================
-- 15. AGENDAMENTO
-- =====================================================

CREATE TABLE AGENDAMENTO (
    id_agendamento INT PRIMARY KEY,
    id_paciente INT,
    id_fisioterapeuta INT,
    id_sala INT,
    data_hora_inicio DATETIME,
    data_hora_fim DATETIME,
    status VARCHAR(30),

    CONSTRAINT fk_agendamento_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES PACIENTE(id_paciente),

    CONSTRAINT fk_agendamento_fisioterapeuta
        FOREIGN KEY (id_fisioterapeuta)
        REFERENCES FISIOTERAPEUTA(id_profissional),

    CONSTRAINT fk_agendamento_sala
        FOREIGN KEY (id_sala)
        REFERENCES SALA(id_sala)
);


-- =====================================================
-- 16. ITEM_AGENDAMENTO
-- =====================================================

CREATE TABLE ITEM_AGENDAMENTO (
    id_agendamento INT,
    id_procedimento INT,
    valor_cobrado DECIMAL(10,2),
    duracao_realizada INT,

    PRIMARY KEY (id_agendamento, id_procedimento),

    CONSTRAINT fk_item_agendamento
        FOREIGN KEY (id_agendamento)
        REFERENCES AGENDAMENTO(id_agendamento),

    CONSTRAINT fk_item_procedimento
        FOREIGN KEY (id_procedimento)
        REFERENCES PROCEDIMENTO(id_procedimento)
);


-- =====================================================
-- 17. EVOLUCAO
-- =====================================================

CREATE TABLE EVOLUCAO (
    id_paciente INT,
    num_evolucao INT,
    data_evolucao DATE,
    id_agendamento INT,
    id_fisioterapeuta_responsavel INT,
    descricao_evolucao TEXT,

    PRIMARY KEY (id_paciente, num_evolucao),

    CONSTRAINT fk_evolucao_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES PACIENTE(id_paciente),

    CONSTRAINT fk_evolucao_agendamento
        FOREIGN KEY (id_agendamento)
        REFERENCES AGENDAMENTO(id_agendamento),

    CONSTRAINT fk_evolucao_fisioterapeuta
        FOREIGN KEY (id_fisioterapeuta_responsavel)
        REFERENCES FISIOTERAPEUTA(id_profissional)
);
