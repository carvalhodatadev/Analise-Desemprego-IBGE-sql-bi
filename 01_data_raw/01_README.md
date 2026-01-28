# 📊 01 - Dados Brutos (Raw Data)

## 📌 Objetivo
Armazenar os dados originais do IBGE antes de qualquer processamento.

## 📁 Conteúdo
Dados brutos do IBGE utilizados como fonte para o processo de ETL.

Metadados das variáveis

Documentação da fonte

Evidências visuais do processo de coleta

## 📸 Evidências Visuais do Processo

**Seleção de Dados no Site do IBGE**  
![Seleção de Dados no Site do IBGE](fonte_ibge_selecao.png)  
*Tela mostrando a seleção de trimestres (2018-2025) no sistema do IBGE*

**Página Oficial do IBGE**  
![Página Oficial do IBGE](fonte_ibge_pagina.png)  
*Página oficial do IBGE mostrando a fonte confiável dos dados*

**Dados Originais no Excel**  
![Dados Originais no Excel](dados_excel_brutos.png)  
*Visualização dos dados brutos no Excel - Taxa de desemprego do Brasil por trimestre (2018 T1 a 2025 T1)*

## 📊 Metadados da Fonte
**Fonte:** IBGE - PNAD Contínua  
**Período:** 2018 T1 a 2025 T1  
**Variável:** Taxa de desemprego  
**Frequência:** Trimestral  
**Unidade:** Percentual (%)  
**Link oficial:** https://sidra.ibge.gov.br/tabela/4099

## ⚠️ Observações Técnicas
- Dados mantidos no formato original (transposição horizontal)
- Nenhuma transformação aplicada nesta etapa
- Preservação da integridade da fonte
- Estrutura: 1 linha (Brasil) × 92 colunas (trimestres de 2018-2025)

## 🔗 Links Úteis
- [IBGE - PNAD Contínua](https://www.ibge.gov.br/estatisticas/sociais/trabalho/9173-pesquisa-nacional-por-amostra-de-domicilios-continua-trimestral.html)
- [SIDRA IBGE - Tabela 4099](https://sidra.ibge.gov.br/tabela/4099)
- [Documentação Metodológica](https://biblioteca.ibge.gov.br/index.php/biblioteca-catalogo?view=detalhes&id=2101660)

## 📁 Arquivos Nesta Pasta
- `README.md` - Esta documentação
- `METADADOS.md` - Documentação técnica detalhada
- `dados_exemplo.csv` - Exemplo da estrutura dos dados
- `fonte_ibge_selecao.png` - Print da seleção no site do IBGE
- `fonte_ibge_pagina.png` - Print da página inicial do IBGE
- `dados_excel_brutos.png` - Print dos dados no Excel
