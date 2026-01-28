-- Consulta 1: Taxa de desemprego por estado
SELECT r.estado, AVG(f.taxa_desemprego) as media_desemprego
FROM fato_desemprego f
JOIN dim_regiao r ON f.id_regiao = r.id_regiao
GROUP BY r.estado;

-- Consulta 2: Evolução trimestral
-- ...
