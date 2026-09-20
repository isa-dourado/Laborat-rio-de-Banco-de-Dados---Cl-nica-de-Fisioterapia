-- =====================================================
-- 03_CONSULTAS.SQL
-- Consultas de verificação da Clínica de Fisioterapia
-- =====================================================


-- =====================================================
-- 1. LISTAR TODOS OS PACIENTES
-- =====================================================

SELECT
    id_paciente,
    nome,
    cpf,
    data_nascimento
FROM PACIENTE
ORDER BY nome;


-- =====================================================
-- 2. LISTAR PACIENTES E SEUS TELEFONES
-- =====================================================

SELECT
    p.id_paciente,
    p.nome,
    t.telefone
FROM PACIENTE p
JOIN TELEFONE_PACIENTE t
    ON p.id_paciente = t.id_paciente
ORDER BY p.nome;


-- =====================================================
-- 3. LISTAR FISIOTERAPEUTAS E SUAS ESPECIALIDADES
-- =====================================================

SELECT
    f.id_profissional,
    p.nome AS fisioterapeuta,
    e.nome_especialidade AS especialidade
FROM FISIOTERAPEUTA f
JOIN PROFISSIONAL p
    ON f.id_profissional = p.id_profissional
JOIN QUALIFICACAO q
    ON f.id_profissional = q.id_profissional
JOIN ESPECIALIDADE e
    ON q.id_especialidade = e.id_especialidade
ORDER BY p.nome;


-- =====================================================
-- 4. LISTAR PROCEDIMENTOS COM SUAS ESPECIALIDADES
-- =====================================================

SELECT
    pr.id_procedimento,
    pr.nome_procedimento,
    e.nome_especialidade,
    pr.valor_tabela,
    pr.duracao_padrao_min
FROM PROCEDIMENTO pr
JOIN ESPECIALIDADE e
    ON pr.id_especialidade = e.id_especialidade
ORDER BY e.nome_especialidade, pr.nome_procedimento;


-- =====================================================
-- 5. LISTAR OS CONVENIOS DOS PACIENTES
-- =====================================================

SELECT
    p.nome AS paciente,
    c.nome_convenio AS convenio,
    vc.numero_carteirinha,
    vc.data_inicio,
    vc.data_fim
FROM VINCULO_CONVENIO vc
JOIN PACIENTE p
    ON vc.id_paciente = p.id_paciente
JOIN CONVENIO c
    ON vc.id_convenio = c.id_convenio
ORDER BY p.nome;


-- =====================================================
-- 6. LISTAR AGENDAMENTOS COM PACIENTE E FISIOTERAPEUTA
-- =====================================================

SELECT
    a.id_agendamento,
    p.nome AS paciente,
    pf.nome AS fisioterapeuta,
    a.data_hora_inicio,
    a.data_hora_fim,
    a.status
FROM AGENDAMENTO a
JOIN PACIENTE p
    ON a.id_paciente = p.id_paciente
JOIN FISIOTERAPEUTA f
    ON a.id_fisioterapeuta = f.id_profissional
JOIN PROFISSIONAL pf
    ON f.id_profissional = pf.id_profissional
ORDER BY a.data_hora_inicio;


-- =====================================================
-- 7. CONTAR QUANTOS AGENDAMENTOS EXISTEM POR STATUS
-- =====================================================

SELECT
    status,
    COUNT(*) AS quantidade
FROM AGENDAMENTO
GROUP BY status
ORDER BY status;


-- =====================================================
-- 8. MOSTRAR A QUANTIDADE DE AGENDAMENTOS DE CADA FISIOTERAPEUTA
-- =====================================================

SELECT
    pf.nome AS fisioterapeuta,
    COUNT(a.id_agendamento) AS quantidade_agendamentos
FROM FISIOTERAPEUTA f
JOIN PROFISSIONAL pf
    ON f.id_profissional = pf.id_profissional
LEFT JOIN AGENDAMENTO a
    ON f.id_profissional = a.id_fisioterapeuta
GROUP BY pf.id_profissional, pf.nome
ORDER BY quantidade_agendamentos DESC;


-- =====================================================
-- 9. VALOR MÉDIO DOS PROCEDIMENTOS POR ESPECIALIDADE
-- =====================================================

SELECT
    e.nome_especialidade,
    COUNT(pr.id_procedimento) AS quantidade_procedimentos,
    AVG(pr.valor_tabela) AS valor_medio
FROM ESPECIALIDADE e
JOIN PROCEDIMENTO pr
    ON e.id_especialidade = pr.id_especialidade
GROUP BY e.id_especialidade, e.nome_especialidade
ORDER BY e.nome_especialidade;


-- =====================================================
-- 10. TOTAL GASTO POR PACIENTE EM PROCEDIMENTOS CONCLUIDOS
-- =====================================================

SELECT
    p.id_paciente,
    p.nome AS paciente,
    COUNT(ia.id_procedimento) AS quantidade_procedimentos,
    SUM(ia.valor_cobrado) AS total_gasto
FROM PACIENTE p
JOIN AGENDAMENTO a
    ON p.id_paciente = a.id_paciente
JOIN ITEM_AGENDAMENTO ia
    ON a.id_agendamento = ia.id_agendamento
WHERE a.status = 'CONCLUIDO'
GROUP BY p.id_paciente, p.nome
ORDER BY total_gasto DESC;


-- =====================================================
-- 11. PACIENTES QUE POSSUEM MAIS DE UM AGENDAMENTO
-- =====================================================

SELECT
    p.id_paciente,
    p.nome,
    COUNT(a.id_agendamento) AS quantidade_agendamentos
FROM PACIENTE p
JOIN AGENDAMENTO a
    ON p.id_paciente = a.id_paciente
GROUP BY p.id_paciente, p.nome
HAVING COUNT(a.id_agendamento) > 1
ORDER BY quantidade_agendamentos DESC;


-- =====================================================
-- 12. PROCEDIMENTOS E RESPECTIVAS COBERTURAS DE CONVENIO
-- =====================================================

SELECT
    c.nome_convenio,
    pr.nome_procedimento,
    cb.percentual_cobertura
FROM COBERTURA cb
JOIN CONVENIO c
    ON cb.id_convenio = c.id_convenio
JOIN PROCEDIMENTO pr
    ON cb.id_procedimento = pr.id_procedimento
ORDER BY c.nome_convenio, pr.nome_procedimento;


-- =====================================================
-- 13. EVOLUCOES CLINICAS DOS PACIENTES
-- =====================================================

SELECT
    p.nome AS paciente,
    e.num_evolucao,
    e.data_evolucao,
    pf.nome AS fisioterapeuta,
    e.descricao_evolucao
FROM EVOLUCAO e
JOIN PACIENTE p
    ON e.id_paciente = p.id_paciente
JOIN FISIOTERAPEUTA f
    ON e.id_fisioterapeuta_responsavel = f.id_profissional
JOIN PROFISSIONAL pf
    ON f.id_profissional = pf.id_profissional
ORDER BY p.nome, e.num_evolucao;


-- =====================================================
-- 14. QUANTIDADE DE PACIENTES POR CONVENIO
-- =====================================================

SELECT
    c.nome_convenio,
    COUNT(DISTINCT vc.id_paciente) AS quantidade_pacientes
FROM CONVENIO c
LEFT JOIN VINCULO_CONVENIO vc
    ON c.id_convenio = vc.id_convenio
GROUP BY c.id_convenio, c.nome_convenio
ORDER BY quantidade_pacientes DESC;


-- =====================================================
-- 15. FATURAMENTO TOTAL DOS PROCEDIMENTOS CONCLUIDOS
-- =====================================================

SELECT
    COUNT(ia.id_procedimento) AS quantidade_procedimentos,
    SUM(ia.valor_cobrado) AS faturamento_total,
    AVG(ia.valor_cobrado) AS valor_medio
FROM ITEM_AGENDAMENTO ia
JOIN AGENDAMENTO a
    ON ia.id_agendamento = a.id_agendamento
WHERE a.status = 'CONCLUIDO';
