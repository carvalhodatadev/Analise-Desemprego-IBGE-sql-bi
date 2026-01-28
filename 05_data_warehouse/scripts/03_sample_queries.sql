-- 03_sample_queries.sql
-- Consultas de exemplo para análise do Data Warehouse
-- Baseado no seu projeto real de desemprego

USE DW_DB;  -- Substitua pelo nome do seu banco de dados
GO

PRINT '============================================';
PRINT '🔍 CONSULTAS DE EXEMPLO - DATA WAREHOUSE';
PRINT '============================================';

-- ============================================
-- CONSULTA 1: EVOLUÇÃO ANUAL DA TAXA DE DESEMPREGO
-- ============================================
PRINT '1. Evolução anual da taxa de desemprego...';

SELECT 
    t.ano,
    ROUND(AVG(f.taxa_desemprego), 2) AS taxa_media_anual,
    ROUND(MIN(f.taxa_desemprego), 2) AS taxa_minima_anual,
    ROUND(MAX(f.taxa_desemprego), 2) AS taxa_maxima_anual,
    COUNT(DISTINCT t.trimestre) AS trimestres_analisados
FROM fato_desemprego f
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
GROUP BY t.ano
ORDER BY t.ano;

-- ============================================
-- CONSULTA 2: COMPARAÇÃO ENTRE REGIÕES (2024)
-- ============================================
PRINT '2. Comparação entre regiões (ano: 2024)...';

SELECT 
    r.regiao,
    r.estado,
    ROUND(AVG(f.taxa_desemprego), 2) AS taxa_media_2024,
    ROUND(MIN(f.taxa_desemprego), 2) AS taxa_minima,
    ROUND(MAX(f.taxa_desemprego), 2) AS taxa_maxima,
    ROUND(AVG(f.taxa_participacao), 2) AS taxa_participacao_media
FROM fato_desemprego f
INNER JOIN dim_regiao r ON f.id_regiao = r.id_regiao
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
WHERE t.ano = 2024
GROUP BY r.regiao, r.estado
ORDER BY taxa_media_2024 DESC;

-- ============================================
-- CONSULTA 3: ANÁLISE DE TENDÊNCIA (ÚLTIMOS 10 TRIMESTRES)
-- ============================================
PRINT '3. Análise de tendência - últimos 10 trimestres...';

WITH UltimosTrimestres AS (
    SELECT TOP 10
        f.id_fato,
        f.taxa_desemprego,
        t.ano,
        t.trimestre,
        t.mes,
        LAG(f.taxa_desemprego) OVER (ORDER BY t.ano, t.trimestre, t.mes) AS taxa_anterior
    FROM fato_desemprego f
    INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    WHERE r.id_regiao = 1  -- DF como exemplo
    ORDER BY t.ano DESC, t.trimestre DESC, t.mes DESC
)
SELECT 
    CONCAT('T', ROW_NUMBER() OVER (ORDER BY ano, trimestre)) AS trimestre_seq,
    CONCAT(ano, '-T', trimestre, ' (', 
           CASE mes 
               WHEN 1 THEN 'Jan' WHEN 2 THEN 'Fev' WHEN 3 THEN 'Mar'
               WHEN 4 THEN 'Abr' WHEN 5 THEN 'Mai' WHEN 6 THEN 'Jun'
               WHEN 7 THEN 'Jul' WHEN 8 THEN 'Ago' WHEN 9 THEN 'Set'
               WHEN 10 THEN 'Out' WHEN 11 THEN 'Nov' WHEN 12 THEN 'Dez'
           END, ')') AS periodo,
    taxa_desemprego,
    CASE 
        WHEN taxa_anterior IS NULL THEN 'N/A'
        ELSE FORMAT(taxa_desemprego - taxa_anterior, 'N2')
    END AS variacao,
    CASE 
        WHEN taxa_desemprego < taxa_anterior THEN '📉 Melhora'
        WHEN taxa_desemprego > taxa_anterior THEN '📈 Piora'
        ELSE '➡️ Estável'
    END AS tendencia
FROM UltimosTrimestres
ORDER BY ano, trimestre, mes;

-- ============================================
-- CONSULTA 4: KPI - STATUS DA META (8%)
-- ============================================
PRINT '4. KPI - Status da meta de desemprego (8%)...';

SELECT 
    t.ano,
    ROUND(AVG(f.taxa_desemprego), 2) AS taxa_media,
    CASE 
        WHEN AVG(f.taxa_desemprego) <= 8.0 THEN '✅ ABAIXO DA META'
        WHEN AVG(f.taxa_desemprego) <= 10.0 THEN '⚠️ ATENÇÃO'
        ELSE '❌ ACIMA DA META'
    END AS status_meta,
    CASE 
        WHEN AVG(f.taxa_desemprego) <= 8.0 THEN 'VERDE'
        WHEN AVG(f.taxa_desemprego) <= 10.0 THEN 'AMARELO'
        ELSE 'VERMELHO'
    END AS cor_semaforo
FROM fato_desemprego f
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
GROUP BY t.ano
ORDER BY t.ano;

-- ============================================
-- CONSULTA 5: TOP 5 MAIORES TAXAS DE DESEMPREGO
-- ============================================
PRINT '5. Top 5 maiores taxas de desemprego...';

SELECT TOP 5
    CONCAT(t.ano, ' - T', t.trimestre) AS periodo,
    r.regiao,
    r.estado,
    f.taxa_desemprego,
    FORMAT(f.pessoas_desempregadas, 'N0') AS desempregados,
    FORMAT(f.total_pessoas, 'N0') AS populacao_ativa
FROM fato_desemprego f
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
INNER JOIN dim_regiao r ON f.id_regiao = r.id_regiao
ORDER BY f.taxa_desemprego DESC;

-- ============================================
-- CONSULTA 6: ANÁLISE SAZONAL POR TRIMESTRE
-- ============================================
PRINT '6. Análise sazonal por trimestre...';

SELECT 
    t.trimestre,
    AVG(CASE WHEN t.ano = 2018 THEN f.taxa_desemprego END) AS [2018],
    AVG(CASE WHEN t.ano = 2019 THEN f.taxa_desemprego END) AS [2019],
    AVG(CASE WHEN t.ano = 2020 THEN f.taxa_desemprego END) AS [2020],
    AVG(CASE WHEN t.ano = 2021 THEN f.taxa_desemprego END) AS [2021],
    AVG(CASE WHEN t.ano = 2022 THEN f.taxa_desemprego END) AS [2022],
    AVG(CASE WHEN t.ano = 2023 THEN f.taxa_desemprego END) AS [2023],
    AVG(CASE WHEN t.ano = 2024 THEN f.taxa_desemprego END) AS [2024],
    AVG(CASE WHEN t.ano = 2025 THEN f.taxa_desemprego END) AS [2025]
FROM fato_desemprego f
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
GROUP BY t.trimestre
ORDER BY t.trimestre;

-- ============================================
-- CONSULTA 7: MÉDIA MÓVEL DE 4 TRIMESTRES
-- ============================================
PRINT '7. Média móvel de 4 trimestres...';

WITH DadosComMediaMovel AS (
    SELECT 
        t.ano,
        t.trimestre,
        f.taxa_desemprego,
        AVG(f.taxa_desemprego) OVER (
            ORDER BY t.ano, t.trimestre 
            ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
        ) AS media_movel_4_trimestres
    FROM fato_desemprego f
    INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    WHERE r.id_regiao = 1  -- DF como exemplo
)
SELECT 
    CONCAT(ano, '-T', trimestre) AS periodo,
    ROUND(taxa_desemprego, 2) AS taxa_trimestral,
    ROUND(media_movel_4_trimestres, 2) AS media_movel,
    ROUND(taxa_desemprego - media_movel_4_trimestres, 2) AS diferenca
FROM DadosComMediaMovel
WHERE ano >= 2020
ORDER BY ano, trimestre;

-- ============================================
-- CONSULTA 8: MONITORAMENTO DO ETL
-- ============================================
PRINT '8. Monitoramento do ETL - últimas execuções...';

SELECT TOP 10
    data_execucao,
    total_registros,
    registros_novos,
    registros_atualizados,
    status,
    duracao_segundos,
    CASE 
        WHEN duracao_segundos < 30 THEN 'RÁPIDO'
        WHEN duracao_segundos < 60 THEN 'NORMAL'
        ELSE 'LENTO'
    END AS performance
FROM ctrl_etl_desemprego
ORDER BY data_execucao DESC;

PRINT '============================================';
PRINT '✅ TODAS AS CONSULTAS EXECUTADAS COM SUCESSO!';
PRINT '============================================';
