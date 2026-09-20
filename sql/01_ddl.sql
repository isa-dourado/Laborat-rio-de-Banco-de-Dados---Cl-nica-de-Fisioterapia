-- =====================================================
-- 01_DDL.SQL
-- Estrutura do Banco de Dados da Clínica de Fisioterapia
-- =====================================================

-- =====================================================
-- EXCLUSÃO DAS TABELAS
-- Permite executar o script novamente
-- =====================================================

DROP TABLE IF EXISTS EVOLUCAO CASCADE;
DROP TABLE IF EXISTS ITEM_AGENDAMENTO CASCADE;
DROP TABLE IF EXISTS AGENDAMENTO CASCADE;
DROP TABLE IF EXISTS COBERTURA CASCADE;
DROP TABLE IF EXISTS PROCEDIMENTO CASCADE;
DROP TABLE IF EXISTS EQUIPAMENTO_SALA CASCADE;
DROP TABLE IF EXISTS SALA CASCADE;
DROP TABLE IF EXISTS VINCULO_CONVENIO CASCADE;
DROP TABLE IF EXISTS CONVENIO CASCADE;
DROP TABLE IF EXISTS QUALIFICACAO CASCADE;
DROP TABLE IF EXISTS ESPECIALIDADE CASCADE;
DROP TABLE IF EXISTS ADMINISTRATIVO CASCADE;
DROP TABLE IF EXISTS RECEPCIONISTA CASCADE;
DROP TABLE IF EXISTS FISIOTERAPEUTA CASCADE;
DROP TABLE IF EXISTS PROFISSIONAL CASCADE;
DROP TABLE IF EXISTS TELEFONE_PACIENTE CASCADE;
DROP TABLE IF EXISTS PACIENTE CASCADE;

-- =====================================================
-- 1. PACIENTE
-- =====================================================

CREATE TABLE PACIENTE (
    id_paciente INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    logradouro VARCHAR(150),
    numero VARCHAR(20),
    cpf VARCHAR(11) NOT NULL UNIQUE,
    bairro VARCHAR(80),
    cidade VARCHAR(80),
    UF CHAR(2),
    CEP VARCHAR(8),
    id_paciente_indicador INTEGER,

    CONSTRAINT fk_paciente_indicador
        FOREIGN KEY (id_paciente_indicador)
        REFERENCES PACIENTE(id_paciente)
);

-- =====================================================
-- 2. TELEFONE_PACIENTE
-- =====================================================

CREATE TABLE TELEFONE_PACIENTE (
    id_paciente INTEGER,
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
    id_profissional INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_admissao DATE NOT NULL,
    telefone VARCHAR(20)
);

-- =====================================================
-- 4. FISIOTERAPEUTA
-- =====================================================

CREATE TABLE FISIOTERAPEUTA (
    id_profissional INTEGER PRIMARY KEY,
    numero_crefito VARCHAR(30) NOT NULL UNIQUE,

    CONSTRAINT fk_fisioterapeuta_profissional
        FOREIGN KEY (id_profissional)
        REFERENCES PROFISSIONAL(id_profissional)
);

-- =====================================================
-- 5. RECEPCIONISTA
-- =====================================================

CREATE TABLE RECEPCIONISTA (
    id_profissional INTEGER PRIMARY KEY,
    ramal VARCHAR(10),

    CONSTRAINT fk_recepcionista_profissional
        FOREIGN KEY (id_profissional)
        REFERENCES PROFISSIONAL(id_profissional)
);

-- =====================================================
-- 6. ADMINISTRATIVO
-- =====================================================

CREATE TABLE ADMINISTRATIVO (
    id_profissional INTEGER PRIMARY KEY,
    cargo VARCHAR(80) NOT NULL,

    CONSTRAINT fk_administrativo_profissional
        FOREIGN KEY (id_profissional)
        REFERENCES PROFISSIONAL(id_profissional)
);

-- =====================================================
-- 7. ESPECIALIDADE
-- =====================================================

CREATE TABLE ESPECIALIDADE (
    id_especialidade INTEGER PRIMARY KEY,
    nome_especialidade VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

-- =====================================================
-- 8. QUALIFICACAO
-- =====================================================

CREATE TABLE QUALIFICACAO (
    id_profissional INTEGER,
    id_especialidade INTEGER,
    data_qualificacao DATE NOT NULL,

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
    id_convenio INTEGER PRIMARY KEY,
    nome_convenio VARCHAR(100) NOT NULL,
    registro_ans VARCHAR(20) NOT NULL UNIQUE
);

-- =====================================================
-- 10. VINCULO_CONVENIO
-- =====================================================

CREATE TABLE VINCULO_CONVENIO (
    id_paciente INTEGER,
    id_convenio INTEGER,
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
    id_sala INTEGER PRIMARY KEY,
    numero_sala VARCHAR(20) NOT NULL UNIQUE,
    capacidade INTEGER NOT NULL
);

-- =====================================================
-- 12. EQUIPAMENTO_SALA
-- =====================================================

CREATE TABLE EQUIPAMENTO_SALA (
    id_sala INTEGER,
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
    id_procedimento INTEGER PRIMARY KEY,
    nome_procedimento VARCHAR(120) NOT NULL,
    id_especialidade INTEGER NOT NULL,
    valor_tabela NUMERIC(10,2) NOT NULL,
    duracao_padrao_min INTEGER NOT NULL,

    CONSTRAINT fk_procedimento_especialidade
        FOREIGN KEY (id_especialidade)
        REFERENCES ESPECIALIDADE(id_especialidade)
);

-- =====================================================
-- 14. AGENDAMENTO
-- =====================================================

CREATE TABLE AGENDAMENTO (
    id_agendamento INTEGER PRIMARY KEY,
    id_paciente INTEGER NOT NULL,
    id_fisioterapeuta INTEGER NOT NULL,
    id_sala INTEGER NOT NULL,
    data_hora_inicio TIMESTAMP NOT NULL,
    data_hora_fim TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL,

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
-- 15. ITEM_AGENDAMENTO
-- =====================================================

CREATE TABLE ITEM_AGENDAMENTO (
    id_agendamento INTEGER,
    id_procedimento INTEGER,
    valor_cobrado NUMERIC(10,2) NOT NULL,
    duracao_realizada INTEGER,

    PRIMARY KEY (id_agendamento, id_procedimento),

    CONSTRAINT fk_item_agendamento
        FOREIGN KEY (id_agendamento)
        REFERENCES AGENDAMENTO(id_agendamento),

    CONSTRAINT fk_item_procedimento
        FOREIGN KEY (id_procedimento)
        REFERENCES PROCEDIMENTO(id_procedimento)
);

-- =====================================================
-- 16. COBERTURA
-- =====================================================

CREATE TABLE COBERTURA (
    id_convenio INTEGER,
    id_procedimento INTEGER,
    percentual_cobertura NUMERIC(5,2) NOT NULL,

    PRIMARY KEY (id_convenio, id_procedimento),

    CONSTRAINT fk_cobertura_convenio
        FOREIGN KEY (id_convenio)
        REFERENCES CONVENIO(id_convenio),

    CONSTRAINT fk_cobertura_procedimento
        FOREIGN KEY (id_procedimento)
        REFERENCES PROCEDIMENTO(id_procedimento)
);

-- =====================================================
-- 17. EVOLUCAO
-- =====================================================

CREATE TABLE EVOLUCAO (
    id_paciente INTEGER,
    num_evolucao INTEGER,
    data_evolucao DATE NOT NULL,
    id_agendamento INTEGER NOT NULL,
    id_fisioterapeuta_responsavel INTEGER NOT NULL,
    descricao_evolucao TEXT NOT NULL,

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
