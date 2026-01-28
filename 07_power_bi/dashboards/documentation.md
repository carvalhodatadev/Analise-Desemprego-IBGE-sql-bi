# 📊 Documentação do Dashboard — Análise de Desemprego (IBGE)

Este documento descreve a estrutura, objetivos e formas de uso do dashboard de desemprego desenvolvido em Power BI a partir do Data Warehouse dimensional do projeto.

O foco é permitir que qualquer usuário compreenda rapidamente **o que está sendo analisado e como interagir com os dados**.

---

## 🎯 Objetivo do Dashboard

- Monitorar a evolução da taxa de desemprego ao longo do tempo
- Comparar desempenho frente à meta econômica de 8%
- Identificar tendências de melhora ou piora
- Permitir análises rápidas por período e região

---

## 🧭 Estrutura do Dashboard

O relatório está organizado em seções visuais complementares:

---

### 🖥️ 1. Visão Geral (Página Principal)

Componentes:

- KPI — Taxa Atual de Desemprego
- KPI — Status da Meta (≤ 8%)
- KPI — Tendência Trimestral
- Gráfico de linha com evolução histórica
- Filtros globais de período e região

Objetivo:  
Fornecer uma leitura rápida do cenário econômico atual.

---

### 📈 2. Evolução Temporal

Componentes:

- Gráfico de linha por trimestre
- Comparação entre anos
- Destaque de picos e mínimos históricos

Objetivo:  
Analisar ciclos econômicos e impactos sazonais.

---

### 🚦 3. KPIs de Desempenho

Componentes:

- Semáforo de meta (Verde / Amarelo / Vermelho)
- Variação percentual vs. trimestre anterior
- Indicador de tendência

Objetivo:  
Avaliar se o desemprego está dentro do patamar desejado e a direção da tendência.

---

### 🎛️ 4. Filtros Interativos

Filtros disponíveis:

- Ano
- Trimestre
- Região

Características:

- Afetam todos os gráficos simultaneamente
- Permitem análise detalhada de cenários específicos

Objetivo:  
Exploração interativa e análise dirigida pelo usuário.

---

## 🧑‍💼 Público-Alvo

Este dashboard pode ser utilizado por:

- Analistas de dados
- Gestores públicos
- Estudantes de economia
- Profissionais de planejamento econômico

O design prioriza:

- Clareza visual
- Leitura rápida de indicadores
- Facilidade de navegação

---

## 🔄 Atualização dos Dados

Fonte:

- SQL Server — Data Warehouse dimensional

Processo:

1. Dados são atualizados no DW via ETL (SSIS)
2. Power BI consome as tabelas fato e dimensão
3. Atualização pode ser:
   - Manual no Power BI Desktop
   - Automática via Gateway (ambiente corporativo)

---

## ⚠️ Observações Importantes

- As análises refletem exclusivamente dados do IBGE
- Eventuais revisões históricas devem ser tratadas no ETL
- O modelo está preparado para expansão futura por:
  - Novas regiões
  - Novos indicadores econômicos

---

## 📌 Próximos Melhoramentos (Roadmap)

- Inclusão de média móvel de 4 trimestres
- Comparação com indicadores de inflação e juros
- Página específica para análise regional
- Alertas automáticos por variação abrupta

---

Status: ✅ Dashboard documentado e validado para uso analítico
