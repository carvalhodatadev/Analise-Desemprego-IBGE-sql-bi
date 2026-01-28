# 📊 Power BI — Dashboard de Análise de Desemprego (IBGE)

Este módulo representa a **camada final de visualização e análise** do projeto, utilizando Power BI conectado ao Data Warehouse dimensional construído nas etapas anteriores.

Aqui os dados são transformados em **insights visuais, KPIs e análises interativas** para apoio à tomada de decisão.

---

## 📸 Visão Geral do Dashboard

### 🖥️ Dashboard Completo
![Dashboard Completo](screenshots/01_dashboard_completo.PNG)

---

### 📈 Evolução Temporal do Desemprego
![Evolução Temporal](screenshots/02_evolucao_temporal.PNG)

---

### 🚦 KPIs Principais
![KPIs](screenshots/03_kpis_principais.PNG)


---

## 🎯 Objetivo do Dashboard

- Monitorar a **taxa de desemprego ao longo do tempo**
- Identificar **tendências econômicas**
- Avaliar desempenho frente à **meta de 8%**
- Permitir **análise interativa por período e região**

---

## 📊 KPIs Implementados

- ✅ Taxa Atual de Desemprego  
- ✅ Meta Econômica (≤ 8%)  
- ✅ Tendência Trimestral (↑ / ↓)  
- ✅ Variação vs. Trimestre Anterior  
- ✅ Ranking Regional  

---

## 🧠 Modelo de Dados

O dashboard consome dados diretamente do **Data Warehouse dimensional**, utilizando arquitetura **modelo estrela (star schema)** para garantir:

- Alta performance
- Simplicidade analítica
- Facilidade de expansão

Tabelas utilizadas:

- **Fato:** `fato_desemprego`  
- **Dimensões:** `dim_tempo`, `dim_regiao`

📄 Detalhes técnicos em: `data_models/star_schema_diagram.md`

---

## 🧮 Medidas DAX

As métricas e KPIs são calculadas com **DAX**, incluindo:

- Taxa Média de Desemprego  
- Variação Trimestral (%)  
- Indicador de Meta (Semáforo)  
- Média Móvel  

📄 Código documentado em: `data_models/dax_measures.md`

---

## ⚙️ Configuração Técnica

- Fonte de dados: SQL Server (Data Warehouse)
- Modo: Import ou DirectQuery (dependendo do ambiente)
- Atualização: Manual ou via Gateway
- Modelagem: Star Schema

📄 Guia completo em: `documentation/power_bi_setup.md`

---

## 📁 Arquivos Nesta Pasta

### 📄 README.md  
Esta documentação geral do módulo de visualização em Power BI.

---

### 📂 dashboards/

- **dashboard_desemprego.pbix**  
  Arquivo do Power BI contendo todas as páginas, visuais, KPIs e medidas do projeto.  
  *(Se >100MB, manter apenas localmente e disponibilizar prints em screenshots/)*

- **documentation.md**  
  Guia de navegação do dashboard, explicando cada página, gráfico e filtro disponível.

---

### 📂 data_models/

- **star_schema_diagram.md**  
  Diagrama e explicação do modelo estrela utilizado no Power BI, alinhado ao Data Warehouse.

- **dax_measures.md**  
  Documentação completa das medidas DAX utilizadas nos KPIs, tendências e rankings.

---

### 📂 documentation/

- **power_bi_setup.md**  
  Instruções técnicas para conexão com o SQL Server, atualização de dados e configuração do modelo.

---

### 📂 screenshots/

- **01_dashboard_completo.PNG**  
  Visão geral do dashboard com todas as seções principais.

- **02_evolucao_temporal.PNG**  
  Gráfico de evolução do desemprego ao longo dos trimestres.

- **03_kpis_principais.PNG**  
  Cartões de KPI com taxa atual, meta e tendência.


## 🔗 Integração com o Projeto Completo

- `01_data_raw/` → Dados brutos em Excel (IBGE)  
- `02_staging/` → Padronização e tidy data  
- `03_etl_ssis/` → ETL com SSIS  
- `04_orchestration/` → SQL Agent  
- `05_data_warehouse/` → Modelo dimensional  
- `06_power_bi/` → Dashboards e KPIs  

---

## 🏁 Conclusão

Este dashboard representa a camada final de um pipeline completo de dados, transformando informações econômicas em **inteligência visual acessível, interativa e orientada a decisões**.

Projeto desenvolvido com foco em **boas práticas de BI, modelagem dimensional e engenharia de dados**.

**Status:** ✅ Dashboard operacional e integrado ao Data Warehouse

