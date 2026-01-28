# 📋 Metadados Técnicos - Dados Brutos

## 📅 Informações da Fonte
- **Organização:** IBGE (Instituto Brasileiro de Geografia e Estatística)
- **Pesquisa:** PNAD Contínua (Pesquisa Nacional por Amostra de Domicílios)
- **Tabela:** 4099 - Taxa de desocupação, por sexo e grupo de idade
- **Indicador:** Taxa de desemprego (pessoas de 14 anos ou mais)
- **Período de referência:** 2018 T1 a 2025 T1
- **Data de extração:** [29/12/2025]
- **Formato original:** CSV/Excel com transposição horizontal

## 📊 Estrutura dos Dados Originais
A extração resultou em uma tabela com estrutura horizontal:

| Código | Brasil | 2018 T1 | 2018 T2 | ... | 2024 T4 | 2025 T1 |
|--------|--------|---------|---------|-----|---------|---------|
| 0      | Brasil | 13.2    | 12.6    | ... | [dado]  | [dado]  |

## 🔍 Detalhes das Variáveis
- **Código:** 0 (representa o agregado Brasil)
- **Brasil:** Identificador geográfico
- **Trimestres:** Colunas de 2018 T1 a 2025 T1 (29 períodos)
- **Valores:** Taxa de desemprego em percentual (formato brasileiro: vírgula decimal)

## ⚙️ Informações Técnicas
- **Codificação do arquivo:** UTF-8
- **Separador decimal:** Vírgula (,) - padrão brasileiro
- **Separador de colunas:** Ponto e vírgula (;) no CSV
- **Total de observações:** 1 (Brasil agregado)
- **Total de variáveis:** 30 (código + região + 29 trimestres)

## 📈 Contexto dos Dados
- **Definição da taxa:** (Pessoas desocupadas / Pessoas na força de trabalho) × 100
- **Força de trabalho:** Pessoas de 14 anos ou mais que estão ocupadas ou desocupadas
- **Abrangência geográfica:** Brasil
- **Periodicidade:** Trimestral
- **Ajuste sazonal:** Não aplicado (dados originais)

## 📝 Notas Adicionais
1. Dados extraídos via interface web do SIDRA IBGE
2. Formato requer transformação para estrutura vertical (tidy data)
3. Valores ausentes: Períodos futuros (2024 T2 em diante) podem não estar disponíveis
4. A série histórica pode sofrer revisões pelo IBGE
5. Dados até 2023 são históricos, 2024-2025 são projeções ou dados preliminares

## 🔗 Referências
1. IBGE. PNAD Contínua: Notas técnicas. 2023.
2. IBGE. Sistema IBGE de Recuperação Automática - SIDRA.
3. Documentação metodológica da PNAD Contínua.
