🏗️ Arquitetura do Projeto — Pipeline de Dados IBGE Desemprego
🎯 Objetivo da Arquitetura

Garantir um fluxo de dados confiável, auditável e escalável, desde a fonte original até a visualização final no Power BI, seguindo boas práticas de Engenharia de Dados e BI.

🔄 Visão Geral do Pipeline
Fonte (Excel IBGE)
        │
        ▼
02_staging (Transformação / Tidy Data)
        │
        ▼
03_etl_ssis (Carga Automatizada)
        │
        ▼
05_data_warehouse (Modelo Estrela)
        │
        ▼
06_data_quality (Validação e Auditoria)
        │
        ▼
07_power_bi (Análises e Dashboards)

🧱 Camadas da Arquitetura
🟦 1. Fonte de Dados — Excel IBGE

Dados brutos em formato horizontal

1 linha × 92 colunas (trimestres)

Fonte oficial: IBGE

📁 Pasta: 01_raw_data/

🟨 2. Staging Area — Preparação dos Dados

Responsável por:

Transposição dos dados (horizontal → vertical)

Padronização de colunas

Validação de tipos

Exportação em CSV (tidy data)

📁 Pasta: 02_staging/

🟧 3. ETL Automatizado — SSIS

Processo responsável por:

Leitura do CSV de staging

Validações adicionais

Carga incremental no Data Warehouse

Registro de auditoria

Componentes:

Control Flow → Orquestração

Data Flow → Transformações e carga

📁 Pasta: 03_etl_ssis/

🟥 4. Data Warehouse — Modelo Dimensional

Modelo adotado: ⭐ Star Schema

🧠 Tabela Fato

fato_desemprego

Métrica: taxa_desemprego

🧩 Dimensões

dim_tempo

dim_regiao (quando aplicável)

Benefícios:

Alta performance analítica

Suporte a drill-down

Simplicidade para BI

📁 Pasta: 05_data_warehouse/

🟩 5. Data Quality — Validação e Auditoria

Camada responsável por:

Conferência de contagem de registros

Checagem de valores nulos

Regras de domínio (0% a 100%)

Confirmação de carga bem-sucedida

Resultados:

Confirmação de 92 registros

Logs de execução

📁 Pasta: 06_data_quality/

🟪 6. Visualização — Power BI

Responsável por:

Modelo semântico

KPIs

Tendências temporais

Navegação entre páginas

Recursos:

Filtros interativos

KPIs com metas

Análise temporal

📁 Pasta: 07_power_bi/

🔐 Governança e Confiabilidade

A arquitetura garante:

✅ Rastreabilidade completa

✅ Auditoria de cargas

✅ Reprocessamento seguro

✅ Separação clara de camadas

✅ Facilidade de manutenção

📈 Escalabilidade Futura

Esta arquitetura permite:

Inclusão de novas regiões

Inclusão de novos indicadores

Migração para banco em nuvem (Azure SQL / Synapse)

Automatização via pipelines (Azure Data Factory)

🏆 Padrões Profissionais Aplicados

Arquitetura em camadas

Separação de responsabilidades

Modelo dimensional

Pipeline auditável

Documentação completa
