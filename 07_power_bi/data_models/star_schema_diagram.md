⭐ Modelo Estrela — Power BI (Star Schema)

Este documento descreve o modelo de dados utilizado no Power BI, baseado em arquitetura **modelo estrela (star schema)**, alinhado ao Data Warehouse do projeto.

Esse tipo de modelagem é padrão em ambientes analíticos por oferecer:

- Alta performance
- Simplicidade de consulta
- Facilidade de criação de medidas DAX

---

## 🧠 Visão Geral do Modelo

Estrutura lógica:

       dim_tempo
           ▲
           │
dim_regiao ── fato_desemprego ── (outras dimensões futuras)


Centro do modelo:

- **fato_desemprego** → contém as métricas numéricas (taxa de desemprego)

Dimensões:

- **dim_tempo** → permite análises por ano, trimestre e data
- **dim_regiao** → permite segmentação geográfica

---

## 📦 Tabela Fato — fato_desemprego

Granularidade:  
👉 **1 registro por região por trimestre**

Principais campos:

- `id_tempo`
- `id_regiao`
- `taxa_desemprego`

Função:

- Armazenar métricas quantitativas
- Ser o ponto central dos relacionamentos

---

## 🧩 Dimensão Tempo — dim_tempo

Função:

Permitir análises temporais em diferentes níveis:

- Ano
- Trimestre
- Data

Campos típicos:

- `id_tempo`
- `data`
- `ano`
- `trimestre`
- `ano_trimestre`

Essa dimensão é essencial para:

- Time Intelligence em DAX
- Comparações período a período

---

## 🧩 Dimensão Região — dim_regiao

Função:

Permitir análise e comparação entre localidades.

Campos típicos:

- `id_regiao`
- `regiao`
- `sigla`

Possibilita:

- Rankings regionais
- Filtros geográficos
- Comparações estruturais

---

## 🔗 Relacionamentos no Power BI

Configuração:

- `fato_desemprego[id_tempo]` → `dim_tempo[id_tempo]`
- `fato_desemprego[id_regiao]` → `dim_regiao[id_regiao]`

Características:

- Cardinalidade: Muitos para Um (*:1)
- Direção de filtro: Dimensão → Fato
- Sem relacionamentos entre dimensões

Isso garante:

- Consultas eficientes
- Cálculos DAX previsíveis
- Evita ambiguidade de filtros

---

## ⚡ Benefícios do Modelo Estrela

Comparado a modelos flat ou snowflake:

- ✅ Menos complexidade de relacionamento
- ✅ Melhor desempenho em agregações
- ✅ DAX mais simples e legível
- ✅ Escalabilidade para novas dimensões

---

## 🔄 Alinhamento com o Data Warehouse

O modelo do Power BI reflete diretamente:

- Tabelas do SQL Server
- Chaves substitutas (IDs)
- Estrutura dimensional do DW

Isso permite:

- Reutilização de lógica analítica
- Facilidade de manutenção
- Confiabilidade nos indicadores

---

## 📈 Possíveis Expansões do Modelo

O modelo está preparado para inclusão de:

- Dimensão Faixa Etária
- Dimensão Escolaridade
- Dimensão Setor Econômico
- Indicadores adicionais (subemprego, informalidade)

Bastando:

- Adicionar nova dimensão no DW
- Relacionar ao fato
- Atualizar modelo no Power BI

---

Status: ✅ Modelo dimensional validado e otimizado para BI
