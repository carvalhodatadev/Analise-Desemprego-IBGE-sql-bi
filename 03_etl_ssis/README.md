🛠️ 03 - ETL com SSIS (SQL Server Integration Services)
📌 Objetivo
Implementar o processo automatizado de Extração, Transformação e Carga (ETL) para transferir os dados transformados da área de staging para o data warehouse.

🔧 Processo Realizado
Extração: Leitura do arquivo CSV transformado (formato tidy)

Transformação: Conversão de tipos de dados e derivação de colunas

Carga: Inserção dos dados nas tabelas do SQL Server

Processamento: Execução de stored procedures para processamento adicional

📊 Fluxo do Pacote SSIS
1. Control Flow
https://raw.githubusercontent.com/carvalhodatadev/Analise-Desemprego-IBGE-sql-bi/main/03_etl_ssis/screenshots/01_control_flow.png
Orquestração das tarefas do pacote: extração, transformação e carga

2. Data Flow
https://raw.githubusercontent.com/carvalhodatadev/Analise-Desemprego-IBGE-sql-bi/main/03_etl_ssis/screenshots/02_data_flow.png
Detalhamento das transformações aplicadas aos dados durante o ETL

3. Resultados da Execução
https://raw.githubusercontent.com/carvalhodatadev/Analise-Desemprego-IBGE-sql-bi/main/03_etl_ssis/screenshots/03_execution_results.png
*Análise dos dados após processamento - 92 registros em stage e DW*

4. Confirmação de Sucesso
https://raw.githubusercontent.com/carvalhodatadev/Analise-Desemprego-IBGE-sql-bi/main/03_etl_ssis/screenshots/04_success_confirmation.png
*Confirmação de ETL completo com sucesso - 92 registros processados*

⚙️ Configurações das Conexões
Flat File Connection Manager:

Nome: DadosDesemprego_CSV

Caminho: C:\Projetoportfolio\DadosBrutos\Dadosdesemprego.csv

Delimitador: Ponto e vírgula (;)

Codificação: UTF-8

OLE DB Connection Manager:

Nome: SQL_Server_Local

Provedor: OLE DB Provider for SQL Server

Servidor: localhost

Banco: ProjetoDesemprego

Autenticação: Windows

📋 Transformações Aplicadas
Conversão de Dados: Taxa de string para decimal (10,2)

Colunas Derivadas:

Ano: Extraído dos últimos 4 caracteres do trimestre

Mês Inicial: Extraído dos 3 primeiros caracteres

Data do Trimestre: Convertida para formato DATE

📊 Resultados Obtidos
✅ 92 registros processados na staging

✅ 92 registros carregados no data warehouse

✅ 0 duplicatas encontradas

✅ 100% de sucesso no processamento

⏱️ Última execução: 31/12/2025 10:46:48

📁 Arquivos Nesta Pasta
README.md - Esta documentação

screenshots/01_control_flow.png - Print do Control Flow

screenshots/02_data_flow.png - Print do Data Flow

screenshots/03_execution_results.png - Print dos resultados da execução

screenshots/04_success_confirmation.png - Print da confirmação de sucesso

documentation/ssis_configuration.md - Configurações detalhadas do SSIS

🔗 Próxima Etapa
03_etl_ssis/ → 04_orchestration/ (Agendamento com SQL Server Agent)

Status: ✅ Pacote SSIS completo e funcional - Pronto para automação
