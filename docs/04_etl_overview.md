🔄 Visão Geral do Processo ETL (SSIS)
🎯 Objetivo

Descrever o pipeline de ETL responsável por extrair, transformar e carregar os dados de desemprego do IBGE no Data Warehouse, garantindo qualidade, rastreabilidade e performance.

📥 Fonte de Dados

Origem:

Arquivo CSV gerado na etapa de Staging

Estrutura em formato tidy data

Campos principais:

Trimestre

Localidade

Taxa de Desemprego

⚙️ Ferramenta Utilizada

SQL Server Integration Services (SSIS)

Motivos da escolha:

Integração nativa com SQL Server

Controle de fluxo e dados

Facilidade de auditoria

Preparado para orquestração via SQL Agent

🧩 Estrutura do Pacote SSIS

O pacote é dividido em dois níveis principais:

🔷 Control Flow

Responsável pela orquestração:

Verificação de pré-condições

Execução do Data Flow

Registro de status na tabela de controle

Tratamento de erros

Tarefas:

Execute SQL Task (pré-validações)

Data Flow Task (carga principal)

Execute SQL Task (logging de sucesso ou erro)

🔷 Data Flow

Responsável pela movimentação e transformação dos dados:

Etapas:

Source

Leitura do CSV da staging area

Transformações

Conversão de tipos de dados

Padronização de trimestre

Lookup para dim_tempo

Lookup para dim_regiao

Destino

Inserção na tabela fato_desemprego

🧾 Auditoria e Monitoramento

Toda execução do ETL é registrada na tabela:

ctrl_etl_desemprego

Campos monitorados:

Data da execução

Status (SUCESSO / ERRO)

Total de registros inseridos

Benefícios:

Rastreabilidade completa

Suporte a troubleshooting

Base para métricas operacionais

🛡️ Tratamento de Erros

Estratégias adotadas:

Redirecionamento de linhas inválidas

Rollback em caso de falha crítica

Registro de erro no controle ETL

Isso garante:

Integridade dos dados

Não contaminação do DW

Reprocessamento seguro

⚡ Performance

O processo foi otimizado através de:

Cargas em lote (bulk insert)

Índices na tabela fato

Lookups em modo Full Cache

Tempo médio de execução:

Inferior a 1 segundo para 92 registros

🔗 Integração com o Pipeline

Este processo se conecta com:

02_staging/ → geração do CSV

04_orchestration/ → agendamento via SQL Agent

06_data_quality/ → validações pós-carga

07_power_bi/ → consumo analítico

✅ Status

✔ ETL funcional
✔ Carga validada
✔ Auditoria ativa
✔ Pronto para produção
