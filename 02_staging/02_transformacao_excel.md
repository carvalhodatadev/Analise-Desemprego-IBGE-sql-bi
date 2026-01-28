# 📊 Tutorial: Transposição de Dados no Excel

## 🎯 Objetivo
Converter dados do IBGE do formato horizontal (1×92) para formato vertical/tidy (92×2) usando o Excel.

## 📋 Passo a Passo

### 1. Abrir os Dados Originais
- Abra o arquivo CSV original do IBGE
- Os dados estarão no formato: 1 linha × 92 colunas
- Cada coluna representa um trimestre móvel

### 2. Selecionar os Dados
- Selecione as 92 colunas de dados (todos os trimestres)
- Copie os dados (Ctrl+C)

### 3. Realizar a Transposição
- Vá para uma nova planilha
- Clique com botão direito na célula A1
- Selecione "Colar Especial"
- Marque a opção "Transpor"
- Clique em OK

### 4. Formatar os Dados
- Ajuste os cabeçalhos:
  - Coluna A: "Trimestre"
  - Coluna B: "Taxa_Desemprego"
- Formate os números com 1 casa decimal

### 5. Salvar no Formato Correto
- Salve como CSV (UTF-8)
- Delimitador: Vírgula
- Qualificador de texto: Aspas duplas

## ⚠️ Dicas Importantes
- Mantenha sempre backup dos dados originais
- Verifique se todos os 92 trimestres foram convertidos
- Valide o formato: "mmm-mmm-mmm AAAA" (ex: "dez-jan-fev 2023")
- Confirme que não há valores nulos

## ✅ Validação Final
- Total de linhas: 92
- Formato consistente das datas
- Valores numéricos válidos (entre 5-15%)
- Sem duplicatas ou gaps temporais
