# 🛠️ 02 - Área de Staging

## 📌 Objetivo
Preparar e limpar os dados brutos para o processo de ETL.

## 🔧 Processo Realizado
1. **Importação**: Dados do CSV para tabela SQL
2. **Limpeza**: Remoção de nulos e inconsistências
3. **Transformação**: Transposição de colunas para linhas (de horizontal para vertical)
4. **Padronização**: Formatação de datas e valores

## 📊 Estrutura dos Dados Após Staging
Os dados agora estão no formato "tidy data" (dados organizados), ideal para análise:

| trimestre | taxa_desemprego | data_processamento |
|-----------|-----------------|--------------------|
| 2018 T1   | 13.2            | 2025-01-28         |
| 2018 T2   | 12.6            | 2025-01-28         |
| 2018 T3   | 12.0            | 2025-01-28         |
| ...       | ...             | ...                |

## 🖼️ Evidências Visuais do Processo

### 1. Query SQL de Transformação
![Query de Transformação](query_transformacao.png)
*Código SQL usado para transpor os dados de formato horizontal para vertical*

### 2. Resultado da Tabela de Staging
![Tabela de Staging](tabela_staging.png)
*Visualização da tabela após transformação no SQL Server*

### 3. Validação dos Dados
![Validação](validacao_staging.png)
*Verificação de qualidade e consistência dos dados transformados*

## ⚙️ Tecnologias Utilizadas
- **SQL Server**: Para armazenamento e transformação
- **T-SQL**: Linguagem de transformação dos dados
- **SQL Server Management Studio**: Interface de gerenciamento

## 📝 Notas Técnicas
- Dados transformados de 1 linha × 30 colunas para 29 linhas × 3 colunas
- Cada linha representa um trimestre específico
- Adicionada coluna de metadados (data_processamento)
- Valores convertidos para formato decimal apropriado
- Codificação padrão: UTF-8

## 📁 Arquivos Nesta Pasta
- `README.md` - Esta documentação
- `query_transformacao.sql` - Script SQL completo da transformação
- `query_transformacao.png` - Print da query no SSMS
- `tabela_staging.png` - Print da tabela resultante
- `validacao_staging.png` - Print da validação dos dados

## 🔗 Fluxo de Dados
- 01_data_raw/ → Transformação SQL → 02_staging/ → Pronto para ETL
