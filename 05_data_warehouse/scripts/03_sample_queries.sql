-- 03_sample_queries.sql
-- Consultas de exemplo para análise do Data Warehouse

-- ============================================
-- CONSULTA 1: TAXA MÉDIA POR ANO
-- ============================================
SELECT 
    t.ano,
    ROUND(AVG(f.taxa_desemprego), 2) AS taxa_media_anual,
    COUNT(DISTINCT t.trimestre) AS trimestres_analisados
FROM fato_desemprego f
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
GROUP BY t.ano
ORDER BY t.ano;

-- ============================================
-- CONSULTA 2: EVOLUÇÃO TRIMESTRAL
-- ============================================
SELECT 
    CONCAT('Trimestre ', t.trimestre, '/', t.ano) AS periodo,
    t.ano,
    t.trimestre,
    f.taxa_desemprego,
    LAG(f.taxa_desemprego) OVER (ORDER BY t.ano, t.trimestre) AS taxa_trimestre_anterior,
    ROUND(f.taxa_desemprego - LAG(f.taxa_desemprego) OVER (ORDER BY t.ano, t.trimestre), 2) AS variacao
FROM fato_desemprego f
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
WHERE t.ano IN (2020, 2021, 2022, 2023, 2024, 2025)
ORDER BY t.ano, t.trimestre;

-- ============================================
-- CONSULTA 3: COMPARAÇÃO ENTRE REGIÕES
-- ============================================
SELECT 
    r.regiao,
    r.estado,
    ROUND(AVG(f.taxa_desemprego), 2) AS taxa_media_2024,
    ROUND(MIN(f.taxa_desemprego), 2) AS taxa_minima,
    ROUND(MAX(f.taxa_desemprego), 2) AS taxa_maxima
FROM fato_desemprego f
INNER JOIN dim_regiao r ON f.id_regiao = r.id_regiao
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
WHERE t.ano = 2024
GROUP BY r.regiao, r.estado
ORDER BY taxa_media_2024 DESC;

-- ============================================
-- CONSULTA 4: KPI - META DE DESEMPREGO (8%)
-- ============================================
SELECT 
    t.ano,
    ROUND(AVG(f.taxa_desemprego), 2) AS taxa_media,
    CASE 
        WHEN AVG(f.taxa_desemprego) <= 8 THEN '✅ ABAIXO DA META'
        WHEN AVG(f.taxa_desemprego) <= 12 THEN '⚠️ ATENÇÃO'
        ELSE '❌ ACIMA DA META'
    END AS status_meta
FROM fato_desemprego f
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
GROUP BY t.ano
ORDER BY t.ano;

-- ============================================
-- CONSULTA 5: TOP 5 TRIMESTRES COM MAIOR DESEMPREGO
-- ============================================
SELECT TOP 5
    CONCAT(t.mes, '/', t.ano) AS periodo,
    t.trimestre,
    f.taxa_desemprego,
    r.regiao,
    r.estado
FROM fato_desemprego f
INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
INNER JOIN dim_regiao r ON f.id_regiao = r.id_regiao
ORDER BY f.taxa_desemprego DESC;

-- ============================================
-- CONSULTA 6: TENDÊNCIA TEMPORAL (ÚLTIMOS 10 TRIMESTRES)
-- ============================================
SELECT 
    CONCAT('T', ROW_NUMBER() OVER (ORDER BY t.ano DESC, t.trimestre DESC)) AS trimestre_seq,
    CONCAT(t.ano, '-T', t.trimestre) AS periodo,
    f.taxa_desemprego,
    CASE 
        WHEN f.taxa_desemprego < LAG(f.taxa_desemprego) OVER (ORDER BY t.ano, t.trimestre) 
        THEN '📉 Queda'
        WHEN f.taxa_desemprego > LAG(f.taxa_desemprego) OVER (ORDER BY t.ano, t.trimestre)
        THEN '📈 Alta'
        ELSE '➡️ Estável'
    END AS tendencia
FROM (
    SELECT TOP 10 *
    FROM fato_desemprego f
    INNER JOIN dim_tempo t ON f.id_tempo = t.id_tempo
    ORDER BY t.ano DESC, t.trimestre DESC
) f
ORDER BY f.id_tempo DESC;

PRINT '✅ Consultas de exemplo executadas com sucesso!';
