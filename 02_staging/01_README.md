# 🔄 02 - Staging Area (Área de Preparação)

## 📌 Objetivo
Preparar e transformar os dados brutos para o formato adequado (tidy data) antes do carregamento no data warehouse.

## 🔧 Processo Realizado
1. **Extrair** dados do formato original (horizontal) do Excel
2. **Transformar** para formato vertical (tidy data)
3. **Limpar** e validar os dados
4. **Exportar** para CSV formatado

## 📊 Transformação dos Dados

### Dados Brutos (Formato Original)
![Dados Brutos no Excel](04_dados_excel_brutos1.PNG)
*Formato original: 1 linha (Brasil) × 92 colunas (trimestres)*

### Dados Transformados (Tidy Data)
![Dados Transformados](05_dados_trasformados.PNG)
*Formato tidy: 92 linhas × 3 colunas (Trimestre, Localidade, Taxa)*

### Análise dos Resultados
![Análise de 92 Linhas](06_analise_92_linhas.PNG)
*Confirmação: 92 registros processados corretamente*

## ⚙️ Técnicas de Transformação
1. **Transposição de Dados**: De horizontal para vertical
2. **Separação de Colunas**: Extração de ano e mês do trimestre
3. **Formatação**: Conversão de tipos de dados
4. **Validação**: Verificação de integridade e completude

## 📋 Estrutura Final dos Dados
| Trimestre | Localidade | Taxa |
|-----------|------------|------|
| 2018 T1   | Brasil     | 12.7 |
| 2018 T2   | Brasil     | 12.4 |
| ...       | ...        | ...  |
| 2025 T1   | Brasil     | 8.5  |

## 📊 Resultados Obtidos
- ✅ **100% dos dados** transformados com sucesso
- ✅ **0 dados perdidos** durante a transformação
- ✅ **Formato padronizado** (tidy data) para processamento
- ✅ **92 registros** no arquivo final `dados_desemprego_staging.csv`

## 📁 Arquivos Nesta Pasta
- `README.md` - Esta documentação
- `02_transformacao_excel.md` - Guia detalhado da transformação
- `03_dados_desemprego_staging.csv` - Dados no formato tidy (92 registros)
- `04_dados_excel_brutos1.PNG` - Captura dos dados brutos no Excel
- `05_dados_trasformados.PNG` - Captura dos dados após transformação
- `06_analise_92_linhas.PNG` - Confirmação dos 92 registros processados

## 🔗 Próxima Etapa
02_staging/ → 03_etl_ssis/ (ETL para Data Warehouse)

**Status:** ✅ Dados transformados e prontos para ETL
