📊 Visão Geral do Power BI — Dashboard de Desemprego
🎯 Objetivo

Apresentar os dados do Data Warehouse em dashboards interativos, permitindo:

Análise temporal do desemprego

Comparações regionais

Monitoramento de KPIs

Tomada de decisão baseada em dados confiáveis

🧩 Estrutura do Dashboard
📌 Páginas

Capa animada

Introdução visual do projeto

Overview do dataset

Página 1 — Análise Temporal Completa

Evolução trimestral e anual do desemprego

Médias móveis e tendências

Página 2 — KPIs Principais

Meta de desemprego ≤ 8% (semaforização automática)

Top 5 piores trimestres

Ranking regional

Página 3 — Análise Detalhada por Região

Drill-down interativo

Comparação de regiões

Análise sazonal

Página de Referência

Documentação do modelo

Métricas DAX utilizadas

Links para ETL e DW

📐 Modelo de Dados

Modelo estrela:

Tabela Fato: fato_desemprego

Dimensões: dim_tempo, dim_regiao

Relacionamentos:

Chaves primárias → estrangeiras

Suporte a filtros e drill-down

📁 Arquivo de referência: data_models/star_schema_diagram.md

🖼️ Evidências Visuais

📸 Prints do Dashboard:

screenshots/01_dashboard_completo.PNG — Visão geral do dashboard

screenshots/02_evolucao_temporal.PNG — Gráfico de tendência temporal

screenshots/03_kpis_principais.PNG — KPIs e metas

screenshots/04_filtros_interativos.PNG — Interatividade e filtros

screenshots/diagrama_bi.PNG — Diagrama do modelo Power BI

⚡ Funcionalidades Implementadas

Filtros interativos por trimestre e região

KPI com cores semafóricas (verde, amarelo, vermelho)

Drill-down temporal e regional

Gráficos de linha, barra, área e cartão

Integração com dados do Data Warehouse em tempo real

🔗 Integração com o Projeto

Recebe dados do Data Warehouse (05_data_warehouse)

Consome métricas validadas pela camada Data Quality (06_data_quality)

Dashboards e arquivos PBIX ficam em: 06_power_bi/dashboards/

✅ Status

Dashboard completo

Interatividade total

KPIs funcionando

Pronto para apresentações e demonstrações
