📊 Data Warehouse - Análise de Desemprego IBGE
📁 Arquivos Nesta Pasta
README.md - Esta documentação
documentation/

dimensional_model.md - Documentação do modelo dimensional

etl_process.md - Processo ETL para o DW

scripts/

01_create_tables.sql - Script de criação das tabelas do DW

02_insert_data.sql - Inserção dos 92 registros de desemprego

03_sample_queries.sql - Consultas de exemplo para análise

diagrams/

diagrama_sql.PNG - Diagrama do modelo de dados

screenshots/

01_control_flow.PNG - Control Flow do SSIS

02_data_flow.PNG - Data Flow do SSIS

🎯 OBJETIVO DO DATA WAREHOUSE
Construir o cérebro analítico do projeto - um Data Warehouse dimensional profissional que transforma os 92 trimestres de dados brutos do IBGE em insights estratégicos através de um modelo estrela otimizado para análise.

📸 EVIDÊNCIAS VISUAIS
🔄 Processo ETL no SSIS
Control Flow (Orquestração)
https://screenshots/01_control_flow.PNG
Fluxo de controle do pacote SSIS: Origem de Arquivo Simples → Coluna Derivada → Conversão de Dados → Destino OLE DB

Data Flow (Pipeline de Dados)
https://screenshots/02_data_flow.PNG
Fluxo de dados do SSIS: Processo completo do CSV para staging e ETL

📐 Modelo de Dados
Diagrama do Modelo Estrela
https://diagrams/diagrama_sql.PNG
Modelo dimensional com FATO_Desemprego, DIM_Tempo e DIM_Regiao

🏗️ ARQUITETURA DO MODELO ESTRELA
text
⭐ MODELO ESTRELA - OTIMIZADO PARA ANÁLISE ⭐

    [FATO_DESEMPREGO] 
         ▲          
         │          
    [DIM_TEMPO]    

📊 92 FATOS = 92 trimestres (dados nacionais do Brasil)
Tabela Fato: fato_desemprego - Métricas de desemprego por período
Dimensão: dim_tempo - Dimensão temporal com hierarquias

🚀 IMPACTO DO DATA WAREHOUSE
✅ ANTES:
92 colunas horizontais (formato transposto)

Análise limitada ao Excel

Sem histórico ou auditoria

Processamento manual

✅ DEPOIS:
Modelo dimensional para análise temporal

Histórico completo desde 2018

KPIs em tempo real com meta de 8%

Integração total com Power BI e SSAS

Auditoria completa de todas as transformações

📈 DADOS TRANSFORMADOS
Período Analisado: 92 trimestres (jan/2018 a out/2025)
Taxa Mínima: 5.4% (Recorde histórico - 2025)
Taxa Máxima: 14.9% (Pico da pandemia - 2020)
Total de Registros: 92 (Um por trimestre)
Performance: <1s por consulta (Otimizado com índices)

🔥 DESTAQUES TÉCNICOS
sql
-- PERFORMANCE: Índices clusterizados
CREATE CLUSTERED INDEX IX_FATO_TEMPO 
ON fato_desemprego(id_tempo);

-- QUALIDADE: Constraints de validação
ALTER TABLE fato_desemprego
ADD CONSTRAINT CK_TAXA_RANGE 
CHECK (taxa_desemprego BETWEEN 0 AND 100);
KPIs IMPLEMENTADOS:

Meta de Desemprego ≤ 8% (semaforização automática)

Tendência Trimestral (melhora/piora)

Análise Sazonal (padrões por trimestre)

Evolução Anual (comparativo ano a ano)

🛠️ COMO EXECUTAR
CRIAR TABELAS: scripts/01_create_tables.sql

INSERIR DADOS: scripts/02_insert_data.sql

VALIDAR: scripts/03_sample_queries.sql

📋 CHECKLIST DE EXCELÊNCIA
Modelo Estrela implementado

92 trimestres carregados

Índices otimizados para queries

Sistema de auditoria em tempo real

KPIs configurados com semáforo

Integração completa com pipeline ETL

Diagramas técnicos em diagrams/

Screenshots em screenshots/

🏁 PRÓXIMA ETAPA
➡️ 06_power_bi/ - Dashboard interativo em Power BI
🎨 Gráficos de tendência, KPIs, visualizações

Este Data Warehouse transforma dados brutos do IBGE em inteligência estratégica para decisões econômicas. Cada um dos 92 registros representa um trimestre de análise! 🚀

Status: ✅ DATA WAREHOUSE 100% OPERACIONAL
Próxima etapa: 06_power_bi/ → Dashboard de Visualização
