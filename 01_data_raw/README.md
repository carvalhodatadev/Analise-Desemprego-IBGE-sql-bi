# 📊 01 - Dados Brutos (Raw Data)

## 📌 Objetivo
Armazenar os dados originais do IBGE antes de qualquer processamento.

## 📁 Conteúdo
- Dados brutos do IBGE utilizados como fonte para o processo de ETL.
- Metadados das variáveis
- Documentação da fonte
- Evidências visuais do processo de coleta

## 📸 Evidências Visuais do Processo

### 1. Seleção de Dados no Site do IBGE
![Seleção de dados no IBGE](fonte_ibge_site_selecao.png)
*Tela mostrando a seleção de trimestres (2018-2022) no sistema do IBGE*

### 2. Dados Originais no Excel
![Dados no Excel](dados_excel_brutos.png)
*Visualização dos dados brutos no Excel - Taxa de desemprego do Brasil por trimestre (2018 T1 a 2022 T2)*

## 📊 Metadados da Fonte
**Fonte:** IBGE - PNAD Contínua  
**Período:** 2018 T1 a 2022 T2  
**Variável:** Taxa de desemprego  
**Frequência:** Trimestral  
**Unidade:** Percentual (%)  
**Link oficial:** [https://sidra.ibge.gov.br/tabela/4099](https://sidra.ibge.gov.br/tabela/4099)

## ⚠️ Observações Técnicas
- Dados mantidos no formato original (transposição horizontal)
- Nenhuma transformação aplicada nesta etapa
- Preservação da integridade da fonte
- Estrutura: 1 linha (Brasil) × 18 colunas (trimestres)

## 🔗 Links Úteis
- [IBGE - PNAD Contínua](https://www.ibge.gov.br/estatisticas/sociais/trabalho/9171-pesquisa-nacional-por-amostra-de-domicilios-continua-mensal.html)
- [SIDRA IBGE - Tabela 4099](https://sidra.ibge.gov.br/tabela/4099)
- [Documentação Metodológica](https://biblioteca.ibge.gov.br/visualizacao/livros/liv101738.pdf)

## 📁 Arquivos Nesta Pasta
- `README.md` - Esta documentação
- `METADADOS.md` - Documentação técnica detalhada
- `dados_exemplo.csv` - Exemplo da estrutura dos dados
- `fonte_ibge_site_selecao.png` - Print da seleção no site do IBGE
- `dados_excel_brutos.png` - Print dos dados no Excel

---

*Última atualização: $(date +%d/%m/%Y)*
