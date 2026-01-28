# 🧮 Medidas DAX — Dashboard de Desemprego (IBGE)

Este documento contém as principais **medidas DAX utilizadas no dashboard**, responsáveis pelos KPIs, tendências e análises temporais.

As medidas assumem modelo em estrela com:

- Fato: `fato_desemprego`
- Dimensões: `dim_tempo`, `dim_regiao`

Campo base:
- `fato_desemprego[taxa_desemprego]`

---

## 📊 Medida Base — Taxa Média de Desemprego

```DAX
Taxa Média Desemprego :=
AVERAGE ( fato_desemprego[taxa_desemprego] )
----
Utilizada em:

Gráficos de linha

Cartões de KPI

Comparações temporais

🎯 KPI — Meta de Desemprego (8%)
🔢 Valor da Meta
Meta Desemprego := 8

🚦 Status da Meta (Semáforo)
Status Meta :=
VAR TaxaAtual = [Taxa Média Desemprego]
RETURN
SWITCH (
    TRUE (),
    TaxaAtual <= 8, "Dentro da Meta",
    TaxaAtual <= 10, "Atenção",
    "Fora da Meta"
)


Utilizado para:

Cores condicionais

Indicador visual de desempenho

📈 Tendência Trimestral
🔼 Variação vs Trimestre Anterior
Variação Trimestral :=
VAR Atual =
    [Taxa Média Desemprego]

VAR Anterior =
    CALCULATE (
        [Taxa Média Desemprego],
        DATEADD ( dim_tempo[data], -1, QUARTER )
    )

RETURN
Atual - Anterior

🔁 Indicador de Tendência
Tendência :=
VAR Var = [Variação Trimestral]
RETURN
SWITCH (
    TRUE (),
    Var < 0, "Melhora",
    Var > 0, "Piora",
    "Estável"
)

📉 Média Móvel (4 Trimestres)
Média Móvel 4T :=
AVERAGEX (
    DATESINPERIOD (
        dim_tempo[data],
        MAX ( dim_tempo[data] ),
        -4,
        QUARTER
    ),
    [Taxa Média Desemprego]
)


Utilizada para:

Suavizar volatilidade

Análise de tendência estrutural

🥇 Ranking Regional
Ranking Região :=
RANKX (
    ALL ( dim_regiao[regiao] ),
    [Taxa Média Desemprego],
    ,
    DESC,
    DENSE
)


Permite:

Benchmark entre regiões

Destaque de piores e melhores desempenhos

🚨 Alerta de Variação Abrupta
Alerta Variação :=
VAR Var = ABS ( [Variação Trimestral] )
RETURN
IF ( Var >= 1, "Alerta", "Normal" )


Pode ser usado para:

Destaque visual

Filtros de eventos críticos

⚙️ Boas Práticas Aplicadas

Uso de medidas reutilizáveis

Separação entre cálculo e visual

Time Intelligence com DATEADD e DATESINPERIOD

Variáveis (VAR) para legibilidade e performance

🔄 Expansões Futuras

Este conjunto de medidas pode ser expandido para:

Comparação Ano vs Ano (YoY)

Correlação com inflação e juros

Índices compostos de atividade econômica
