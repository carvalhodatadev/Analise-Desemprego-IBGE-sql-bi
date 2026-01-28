/* ============================================
   DATA QUALITY CHECKS - PROJETO DESEMPREGO IBGE
   ============================================ */

-- 1. Verificar valores nulos
SELECT *
FROM fato_desemprego
WHERE id_tempo IS NULL
   OR taxa_desemprego IS NULL;


-- 2. Validar faixa da taxa de desemprego
SELECT *
FROM fato_desemprego
WHERE taxa_desemprego < 0
   OR taxa_desemprego > 100;


-- 3. Contagem total de registros (esperado: 92)
SELECT COUNT(*) AS total_registros
FROM fato_desemprego;


-- 4. Verificar integridade referencial
SELECT f.*
FROM fato_desemprego f
LEFT JOIN dim_tempo d
    ON f.id_tempo = d.id_tempo
WHERE d.id_tempo IS NULL;


-- 5. Verificar duplicidades por período
SELECT id_tempo, COUNT(*) AS total
FROM fato_desemprego
GROUP BY id_tempo
HAVING COUNT(*) > 1;
