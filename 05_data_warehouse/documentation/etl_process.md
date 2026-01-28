# 🔄 Processo ETL para o Data Warehouse

## 📋 Fluxo de Carga
1. Dados chegam da staging
2. São transformados no formato dimensional
3. São inseridos nas tabelas do DW
4. São validados

## ⏱️ Frequência
- Atualização diária
- Horário: 08:00
- Automatizado via SQL Agent
