📘 Documentação do Projeto — Análise de Desemprego IBGE

Esta pasta contém toda a documentação técnica e analítica do projeto de engenharia de dados e BI baseado em dados de desemprego do IBGE, cobrindo desde a arquitetura até as perguntas de negócio respondidas pelos dashboards.

O objetivo desta documentação é demonstrar boas práticas profissionais, facilitar manutenção futura e tornar o projeto totalmente compreensível para recrutadores, professores e equipes técnicas.

📁 O que Tem Nesta Pasta
docs/
├── README.md                     # Este arquivo (índice da documentação)
├── architecture.md               # Arquitetura geral do pipeline de dados
├── data_dictionary.md            # Dicionário de dados (tabelas e colunas)
├── etl_overview.md               # Visão geral do processo ETL (SSIS)
├── data_quality_strategy.md      # Estratégia de qualidade e validação dos dados
├── power_bi_overview.md          # Visão geral do modelo e dashboards no Power BI
└── business_questions.md         # Perguntas de negócio respondidas pelo projeto

🏗️ Visão Geral da Arquitetura

Fluxo completo do projeto:

Excel (IBGE)
   ↓
Staging Area
   ↓
ETL - SSIS (Control Flow + Data Flow)
   ↓
Data Warehouse (Modelo Estrela)
   ↓
Data Quality & Auditoria
   ↓
Power BI (Dashboards e KPIs)


Cada uma dessas etapas está detalhada nos arquivos desta pasta.

🎯 Objetivos da Documentação

✅ Explicar a arquitetura de ponta a ponta

✅ Descrever tabelas, colunas e métricas

✅ Justificar decisões técnicas

✅ Demonstrar controle de qualidade de dados

✅ Conectar dados a perguntas de negócio reais

✅ Facilitar evolução futura do projeto

🧠 Público-Alvo

Esta documentação é voltada para:

Recrutadores de áreas de Dados e BI

Professores e avaliadores acadêmicos

Analistas e engenheiros de dados

Você mesmo no futuro 😅 (manutenção e upgrades)

🚀 Como Navegar

Ordem sugerida de leitura:

📄 architecture.md — Entenda o pipeline completo

📄 etl_overview.md — Veja como os dados são processados

📄 data_dictionary.md — Consulte estrutura das tabelas

📄 data_quality_strategy.md — Validações e auditoria

📄 power_bi_overview.md — Como os dados viram insights

📄 business_questions.md — O valor analítico do projeto

📌 Observação Importante

Todos os dados utilizados são dados públicos do IBGE, tratados exclusivamente para fins educacionais e de demonstração de habilidades em:

Engenharia de Dados

Modelagem Dimensional

ETL com SSIS

SQL Analítico

Business Intelligence com Power BI

🏁 Status da Documentação

📘 Documentação em desenvolvimento contínuo
🔄 Pode ser expandida com novas métricas, dimensões e análises
