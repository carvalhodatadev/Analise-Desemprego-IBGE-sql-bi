📊 Data Warehouse - Análise de Desemprego IBGE
📐 Diagrama do Modelo de Dados
https://../05_data_warehouse/diagrams/diagrama_sql.png

🔄 Processo ETL — Evidências no SSIS
⚙️ 01 — Control Flow (Orquestração)
https://../05_data_warehouse/screenshots/01_control_flow.PNG

🔁 02 — Data Flow (Pipeline de Dados)
https://../05_data_warehouse/screenshots/02_data_flow.PNG

🎯 OBJETIVO DO DATA WAREHOUSE
Construir o cérebro analítico do projeto — um Data Warehouse dimensional profissional que transforma os 92 trimestres de dados brutos do IBGE em insights estratégicos através de um modelo estrela otimizado para análise.

🏗️ ARQUITETURA DO MODELO
text
⭐ MODELO ESTRELA - OTIMIZADO PARA ANÁLISE ⭐
🧠 Tabela Fato
fato_desemprego — Métricas de desemprego por período e região

🧩 Dimensões
dim_tempo — Dimensão temporal com hierarquias
dim_regiao — Dimensão geográfica com 6 regiões

📁 Arquivos Nesta Pasta
README.md — Esta documentação

documentation/dimensional_model.md — Documentação do modelo dimensional

documentation/etl_process.md — Processo ETL para o DW

📜 Scripts
scripts/01_create_tables.sql — Script de criação das tabelas do DW

scripts/02_insert_data.sql — Inserção dos 92 registros de desemprego

scripts/03_sample_queries.sql — Consultas de exemplo para análise

📊 Recursos Visuais
📐 Diagramas
diagrams/diagrama_sql.png

📸 Screenshots
screenshots/01_control_flow.PNG

screenshots/02_data_flow.PNG

🚀 IMPACTO DO DATA WAREHOUSE
❌ ANTES
92 colunas horizontais (formato transposto)

Análise limitada ao Excel

Sem histórico ou auditoria

Processamento manual

✅ DEPOIS
Modelo dimensional para análise temporal e regional

Histórico completo desde 2018

KPIs em tempo real com meta de 8%

Integração total com Power BI e SSAS

Auditoria completa de todas as transformações

📈 DADOS TRANSFORMADOS
Período Analisado: 92 trimestres (jan/2018 a out/2025)
Taxa Mínima: 5.4% (Recorde histórico - 2025)
Taxa Máxima: 14.9% (Pico da pandemia - 2020)
Regiões: 6 estados + DF (Cobertura nacional)
Total de Registros: 552 (92 trimestres × 6 regiões)
Performance: <1s por consulta (Otimizado com índices)

🔥 DESTAQUES TÉCNICOS
🏆 ENGENHARIA DE DADOS PROFISSIONAL
sql
-- ⚡ PERFORMANCE — Índices clusterizados nas chaves de fatos
CREATE CLUSTERED INDEX IX_FATO_TEMPO_REGIAO 
ON fato_desemprego(id_tempo, id_regiao);

-- ✅ QUALIDADE — Constraints de validação
ALTER TABLE fato_desemprego 
ADD CONSTRAINT CK_TAXA_RANGE 
CHECK (taxa_desemprego BETWEEN 0 AND 100);

-- 🧾 AUDITORIA — Logging automático
INSERT INTO ctrl_etl_desemprego (status, total_registros) 
VALUES ('SUCESSO', 92);
📊 KPIs IMPLEMENTADOS
Meta de Desemprego ≤ 8% (semaforização automática)

Tendência Trimestral (melhora/piora)

Ranking Regional (benchmark entre estados)

Análise Sazonal (padrões por trimestre)

🛠️ COMO EXECUTAR — 3 PASSOS
Executar scripts/01_create_tables.sql

Executar scripts/02_insert_data.sql

Executar scripts/03_sample_queries.sql

🏁 PRÓXIMA ETAPA
➡️ 06_power_bi/ — Construção do dashboard interativo
🎨 KPIs, gráficos de tendência e mapas

🚀 Conclusão
Este Data Warehouse transforma dados brutos do IBGE em inteligência estratégica para decisões econômicas. Cada um dos 552 registros representa uma oportunidade de insight! 🚀

Status: ✅ DATA WAREHOUSE 100% OPERACIONAL
Próxima etapa: 06_power_bi/ → Dashboard de Visualização
