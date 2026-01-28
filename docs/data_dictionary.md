📘 Dicionário de Dados — Data Warehouse de Desemprego (IBGE)
🎯 Objetivo

Documentar todas as tabelas, colunas, tipos e regras de negócio do Data Warehouse, garantindo entendimento claro para analistas, cientistas de dados e engenheiros.

⭐ Modelo Dimensional (Star Schema)

O Data Warehouse é composto por:

1 Tabela Fato

Dimensões de suporte para análise temporal e geográfica

🧠 Tabela Fato — fato_desemprego

Contém as métricas principais do projeto.

Coluna	Tipo de Dado	Descrição	Regra / Observação
id_fato	INT (PK)	Identificador único do registro	Chave surrogate
id_tempo	INT (FK)	Chave para a dimensão tempo	Obrigatório
id_regiao	INT (FK)	Chave para a dimensão região (se aplicável)	Obrigatório
taxa_desemprego	DECIMAL	Taxa de desemprego percentual	Entre 0 e 100
data_carga	DATETIME	Data e hora da carga no DW	Preenchido no ETL

📌 Grão da tabela:
1 registro por trimestre e região.

🧩 Dimensão Tempo — dim_tempo

Permite análises por período.

Coluna	Tipo de Dado	Descrição
id_tempo	INT (PK)	Chave surrogate do tempo
ano	INT	Ano (ex: 2023)
trimestre	INT	Trimestre (1 a 4)
ano_trimestre	VARCHAR	Formato: 2023 T1
data_inicio	DATE	Data inicial do trimestre
data_fim	DATE	Data final do trimestre

Hierarquias no BI:

Ano → Trimestre

🧩 Dimensão Região — dim_regiao

Representa a localidade analisada.

Coluna	Tipo de Dado	Descrição
id_regiao	INT (PK)	Chave surrogate da região
nome_regiao	VARCHAR	Nome da região / país

Exemplo:

Brasil
(ou futuramente: Norte, Nordeste, Sudeste, Sul, Centro-Oeste)

🧾 Tabela de Controle — ctrl_etl_desemprego

Responsável por auditoria do processo ETL.

Coluna	Tipo de Dado	Descrição
id_execucao	INT (PK)	Identificador da execução
data_execucao	DATETIME	Data e hora da execução
status	VARCHAR	SUCESSO / ERRO
total_registros	INT	Quantidade de registros carregados

Uso:

Monitorar falhas

Validar cargas

Auditoria histórica

✅ Regras de Qualidade Implementadas

taxa_desemprego deve estar entre 0 e 100

id_tempo e id_regiao não podem ser nulos

Contagem esperada por carga: 92 registros

🔍 Utilização no Power BI

As tabelas são usadas para:

KPIs de desemprego

Análise de tendência temporal

Comparações entre períodos

Cálculo de médias móveis

Avaliação de metas
