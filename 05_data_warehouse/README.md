📊 Data Warehouse - Análise de Desemprego IBGE
📸 Evidências Visuais do Projeto
🔄 Processo ETL no SSIS — Control Flow

🔄 Processo ETL no SSIS — Data Flow

📐 Diagrama do Modelo Estrela (SQL Server)

🎯 Objetivo do Data Warehouse

Construir o cérebro analítico do projeto — um Data Warehouse dimensional profissional que transforma os 92 trimestres de dados brutos do IBGE em insights estratégicos através de um modelo estrela otimizado para análise.

🏗️ Arquitetura do Modelo Estrela

⭐ MODELO ESTRELA — OTIMIZADO PARA ANÁLISE ⭐

        DIM_TEMPO
            ▲
            │
     FATO_DESEMPREGO


Tabela Fato: fato_desemprego — métricas por trimestre

Dimensão: dim_tempo — hierarquia temporal (Ano, Trimestre)

📁 Arquivos Nesta Pasta
📄 Documentação

README.md — Esta documentação

documentation/dimensional_model.md — Modelo dimensional

documentation/etl_process.md — Processo ETL

📜 Scripts SQL

scripts/01_create_tables.sql — Criação das tabelas

scripts/02_insert_data.sql — Carga dos 92 trimestres

scripts/03_sample_queries.sql — Consultas analíticas

📊 Recursos Visuais

diagrams/diagrama_sql.PNG — Diagrama do DW

screenshots/01_control_flow.PNG — Control Flow SSIS

screenshots/02_data_flow.PNG — Data Flow SSIS

🚀 Impacto do Data Warehouse
❌ Antes

92 colunas horizontais (Excel)

Análise limitada

Sem auditoria

Processo manual

✅ Depois

Modelo dimensional

Histórico desde 2018

KPIs com meta de 8%

Integração com Power BI

Auditoria automática

📈 Dados Transformados
Métrica	Valor	Significado
Período Analisado	92 trimestres	2018–2025
Taxa Mínima	5.4%	Recorde histórico
Taxa Máxima	14.9%	Pico da pandemia
Região	Brasil	Dados nacionais
Total de Registros	92	1 por trimestre
Performance	<1s	Queries otimizadas
🔥 Destaques Técnicos
⚡ Performance — Índice Clusterizado
CREATE CLUSTERED INDEX IX_FATO_TEMPO 
ON fato_desemprego(id_tempo);

✅ Qualidade — Constraint de Validação
ALTER TABLE fato_desemprego
ADD CONSTRAINT CK_TAXA_RANGE 
CHECK (taxa_desemprego BETWEEN 0 AND 100);

🧾 Auditoria — Logging ETL
INSERT INTO ctrl_etl_desemprego (status, total_registros)
VALUES ('SUCESSO', 92);

📊 KPIs Implementados

Meta ≤ 8% (semáforo automático)

Tendência trimestral

Análise sazonal

Evolução anual

🛠️ Como Executar
1️⃣ Criar Estrutura

Executar:

scripts/01_create_tables.sql

2️⃣ Carregar Dados

Executar:

scripts/02_insert_data.sql

3️⃣ Validar

Executar:

scripts/03_sample_queries.sql

🔗 Integração com o Projeto (Pipeline Completo)

- `01_data_raw/` → Dados brutos do IBGE em Excel (fonte original)
- `02_staging/` → Limpeza e padronização (tidy data em CSV)
- `03_etl_ssis/` → Pipeline de carga para o DW
- `04_orchestration/` → Agendamento com SQL Agent
- `05_data_warehouse/` → Modelo dimensional e queries
- `06_power_bi/` → Dashboards e KPIs

🏁 Próxima Etapa

➡️ 06_power_bi/
Dashboard interativo com KPIs, tendências e comparativos regionais.

Status: ✅ Data Warehouse 100% operacional
🚀 Pronto para consumo analítico no Power BI

⚠️ SE AINDA NÃO APARECER A IMAGEM

Confere se os nomes estão idênticos (maiúsculo/minúsculo conta no GitHub):

screenshots/01_control_flow.PNG
screenshots/02_data_flow.PNG
diagrams/diagrama_sql.PNG


Se tiver .png minúsculo e no README .PNG, não aparece.

Se quiser, já te entrego o próximo README da pasta 06_power_bi no mesmo padrão visual de portfólio top de vaga PJ 💼🔥
