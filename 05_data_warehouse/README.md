 📊 Data Warehouse - Análise de Desemprego IBGE

## 📁 Estrutura da Pasta
05_data_warehouse/
├── 📄 README.md # Este arquivo
├── 📂 documentation/
│ ├── 📄 dimensional_model.md # Modelo dimensional do DW
│ └── 📄 etl_process.md # Processo ETL para DW
├── 📂 scripts/
│ ├── 📄 01_create_tables.sql # Criação das tabelas do DW
│ ├── 📄 02_insert_data.sql # Inserção dos 92 registros (NOVO)
│ └── 📄 03_sample_queries.sql # Consultas de exemplo (NOVO)
├── 📂 diagrams/ # Diagramas do DW
│ └── 📄 placeholder.txt
└── 📂 screenshots/ # Screenshots do DW
└── 📄 placeholder.txt

text

## 🎯 Objetivo

Implementar o Data Warehouse para armazenamento e análise dos dados de desemprego do IBGE, seguindo o modelo estrela (star schema).

## 📊 Modelo Dimensional

### Schema Estrela (Star Schema)
┌─────────────────────────────────────────────────────────┐
│ fato_desemprego │
├─────────────────────────────────────────────────────────┤
│ PK | id_fato (INT) │
│ FK | id_tempo (INT) → dim_tempo │
│ FK | id_regiao (INT) → dim_regiao │
│ | taxa_desemprego (DECIMAL) │
│ | total_pessoas (INT) │
│ | pessoas_desempregadas (INT) │
│ | pessoas_ocupadas (INT) │
│ | forca_trabalho (INT) │
│ | taxa_participacao (DECIMAL) │
│ | data_carga (DATETIME) │
└─────────────────────────────────────────────────────────┘
▲ ▲
│ │
┌──────────┴─────────┐ ┌─────────┴──────────┐
│ dim_tempo │ │ dim_regiao │
├────────────────────┤ ├────────────────────┤
│ PK | id_tempo │ │ PK | id_regiao │
│ | ano │ │ | regiao │
│ | trimestre │ │ | estado │
│ | mes │ │ | sigla_estado │
│ | nome_mes │ │ | municipio │
│ | data_completa │ │ | codigo_ibge │
│ | semestre │ │ | populacao_... │
│ | trimestre_ano │ └────────────────────┘
└────────────────────┘

text

## 📈 Dados Processados

- **Período:** 92 trimestres móveis (jan-fev-mar 2018 até ago-set-out 2025)
- **Taxa mínima:** 5.4% (2025)
- **Taxa máxima:** 14.9% (2020)
- **Regiões:** 6 estados + DF
- **Total de registros:** 552 (92 trimestres × 6 regiões)

## 🚀 Como Executar

### 1. Criação das Tabelas
```sql
-- Executar em ordem:
-- 1. Criar banco de dados (se necessário)
-- 2. Executar 01_create_tables.sql
-- 3. Executar procedimentos adicionais
2. Inserção dos Dados
sql
-- Executar após criação das tabelas:
EXEC 02_insert_data.sql
3. Consultas de Validação
sql
-- Testar o DW com consultas de exemplo:
EXEC 03_sample_queries.sql
🔧 Scripts Disponíveis
📄 01_create_tables.sql
Criação completa das tabelas do Data Warehouse:

dim_tempo (Dimensão Tempo)

dim_regiao (Dimensão Região)

fato_desemprego (Fato principal)

ctrl_etl_desemprego (Controle do ETL)

📄 02_insert_data.sql
Inserção dos 92 trimestres de dados:

Dados de 2018 a 2025

6 regiões diferentes

Valores reais do IBGE

Sistema de auditoria

📄 03_sample_queries.sql
8 consultas de exemplo para análise:

Evolução anual da taxa

Comparação entre regiões

Análise de tendência

KPI da meta (8%)

Top 5 maiores taxas

Análise sazonal

Média móvel 4 trimestres

Monitoramento do ETL

📊 Principais KPIs
Taxa Média de Desemprego - Meta: ≤ 8%

Tendência Trimestral - Melhora/Piora

Comparativo Regional - Ranking por estado

Sazonalidade - Padrões por trimestre

🔗 Integração com Outras Pastas
Este DW se integra com:

03_etl_ssis/ - Pipeline ETL de carga

04_orchestration/ - SQL Agent para automação

06_power_bi/ - Dashboard de visualização

07_documentation/ - Documentação geral

🎨 Diagramas (para incluir em diagrams/)
Modelo Estrela Completo - star_schema.png

Fluxo de Dados - data_flow.png

Hierarquia Temporal - time_hierarchy.png

📋 Checklist de Validação
Tabelas criadas com sucesso

Dados inseridos (92 trimestres)

Consultas de exemplo funcionando

Modelo dimensional validado

Integração com ETL testada

Screenshots atualizados

Diagramas criados

⚠️ Problemas Conhecidos
Timezone: Todos os dados em horário de Brasília

Arredondamento: Taxas com 1 casa decimal

Atualização: Dados atualizados trimestralmente

📞 Suporte
Para questões técnicas:

Consulte a documentação em documentation/

Verifique os logs em ctrl_etl_desemprego

Execute as consultas de validação
