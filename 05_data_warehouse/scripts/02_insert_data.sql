-- Inserção de dados nas tabelas do Data Warehouse
-- Dimensão Tempo
INSERT INTO dim_tempo (id_tempo, ano, trimestre, mes, nome_mes) VALUES (...)

-- Dimensão Região  
INSERT INTO dim_regiao (id_regiao, regiao, estado, sigla_estado, municipio) VALUES (...)

-- Fato Desemprego
INSERT INTO fato_desemprego (id_fato, id_tempo, id_regiao, taxa_desemprego, ...) VALUES (...)
