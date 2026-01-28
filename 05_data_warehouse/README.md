📊 Data Warehouse - Análise de Desemprego IBGE

## 📁 Arquivos Nesta Pasta

**README.md** - Esta documentação  
**documentation/**  
- **dimensional_model.md** - Documentação do modelo dimensional  
- **etl_process.md** - Processo ETL para o DW  

**scripts/**  
- **01_create_tables.sql** - Script de criação das tabelas do DW  
- **02_insert_data.sql** - Inserção dos 92 registros de desemprego  
- **03_sample_queries.sql** - Consultas de exemplo para análise  

**diagrams/**  
- **placeholder.txt** - Arquivo placeholder para diagramas  

**screenshots/**  
- **placeholder.txt** - Arquivo placeholder para screenshots  

## 🎯 Objetivo

Implementar o Data Warehouse para armazenamento e análise dos dados de desemprego do IBGE, seguindo o modelo estrela (star schema).

## 📊 Dados Processados

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
-- 2. Executar scripts/01_create_tables.sql
2. Inserção dos Dados
sql
-- Executar após criação das tabelas:
EXEC scripts/02_insert_data.sql
3. Consultas de Validação
sql
-- Testar o DW com consultas de exemplo:
EXEC scripts/03_sample_queries.sql
🔧 Scripts Disponíveis
📄 scripts/01_create_tables.sql
Criação completa das tabelas do Data Warehouse:

dim_tempo (Dimensão Tempo)

dim_regiao (Dimensão Região)

fato_desemprego (Fato principal)

ctrl_etl_desemprego (Controle do ETL)

📄 scripts/02_insert_data.sql
Inserção dos 92 trimestres de dados:

Dados de 2018 a 2025

6 regiões diferentes

Valores reais do IBGE

Sistema de auditoria

📄 scripts/03_sample_queries.sql
8 consultas de exemplo para análise:

Evolução anual da taxa

Comparação entre regiões

Análise de tendência

KPI da meta (8%)

Top 5 maiores taxas

Análise sazonal

Média móvel 4 trimestres

Monitoramento do ETL

🔗 Integração com Outras Pastas
Este DW se integra com:

03_etl_ssis/ - Pipeline ETL de carga

04_orchestration/ - SQL Agent para automação

06_power_bi/ - Dashboard de visualização

📋 Checklist de Validação
Tabelas criadas com sucesso

Dados inseridos (92 trimestres)

Consultas de exemplo funcionando

Modelo dimensional validado

Integração com ETL testada

Screenshots atualizados

Diagramas criados

