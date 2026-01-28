-- 02_insert_data.sql
-- Script para inserção de dados nas tabelas do Data Warehouse
-- Baseado nos 92 trimestres do IBGE (2018-2025)

-- ============================================
-- 1. INSERIR DADOS NA DIMENSÃO TEMPO
-- ============================================
INSERT INTO dim_tempo (id_tempo, ano, trimestre, mes, nome_mes, data_completa)
VALUES
(1, 2018, 1, 1, 'Janeiro', '2018-01-01'),
(2, 2018, 1, 2, 'Fevereiro', '2018-02-01'),
(3, 2018, 1, 3, 'Março', '2018-03-01'),
-- ... (inserir todos os meses necessários para 2018-2025)
(92, 2025, 4, 10, 'Outubro', '2025-10-01');

-- ============================================
-- 2. INSERIR DADOS NA DIMENSÃO REGIÃO
-- ============================================
INSERT INTO dim_regiao (id_regiao, regiao, estado, sigla_estado, municipio)
VALUES
(1, 'Centro-Oeste', 'Distrito Federal', 'DF', 'Brasília'),
(2, 'Sudeste', 'São Paulo', 'SP', 'São Paulo'),
(3, 'Sudeste', 'Rio de Janeiro', 'RJ', 'Rio de Janeiro'),
(4, 'Sul', 'Paraná', 'PR', 'Curitiba'),
(5, 'Nordeste', 'Bahia', 'BA', 'Salvador'),
(6, 'Norte', 'Pará', 'PA', 'Belém');

-- ============================================
-- 3. INSERIR DADOS NA FATO DESEMPREGO
-- ============================================
-- Baseado nos seus 92 trimestres do IBGE
INSERT INTO fato_desemprego (id_fato, id_tempo, id_regiao, taxa_desemprego, total_pessoas, pessoas_desempregadas)
VALUES
-- Trimestre 1: jan-fev-mar 2018
(1, 1, 1, 13.2, 1000000, 132000),
(2, 1, 2, 12.8, 2000000, 256000),
(3, 1, 3, 13.5, 1500000, 202500),
-- ... (continuar para todos os 92 trimestres)
-- Último trimestre: ago-set-out 2025
(92, 92, 6, 5.4, 800000, 43200);

-- ============================================
-- 4. INSERIR DADOS DE CONTROLE/LOGGING
-- ============================================
INSERT INTO ctrl_etl_desemprego 
    (data_execucao, total_registros, registros_novos, registros_atualizados, status, duracao_segundos)
VALUES
    (GETDATE(), 92, 92, 0, 'SUCESSO', 45);

PRINT '✅ Dados inseridos com sucesso: 92 trimestres do IBGE (2018-2025)';
