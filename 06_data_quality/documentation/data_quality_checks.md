# 🧪 Regras de Data Quality — Projeto Desemprego IBGE

Este documento descreve as regras de validação aplicadas aos dados antes da liberação para consumo analítico no Power BI.

As validações garantem integridade, consistência e confiabilidade das informações.

---

## 🎯 Objetivo das Validações

Garantir que:

- Todos os períodos estejam presentes
- Não existam valores fora de faixa
- Não haja registros duplicados
- As relações entre tabelas sejam válidas

Somente após aprovação os dados seguem para análise.

---

## ✅ Regras de Qualidade Aplicadas

### 1. Verificação de Valores Nulos

Campos obrigatórios:

- id_tempo
- taxa_desemprego

Nenhum registro pode conter valores nulos nesses campos.

---

### 2. Validação de Faixa de Valores

Regra:

- taxa_desemprego deve estar entre 0 e 100

Implementação:

- Constraint no banco de dados
- Validação adicional via consulta SQL

---

### 3. Quantidade Esperada de Registros

Regra:

- Deve existir exatamente 92 registros (1 por trimestre)

Validação:

- Contagem após carga
- Comparação com volume esperado

---

### 4. Integridade Referencial

Regra:

- Todo id_tempo da fato deve existir na dimensão dim_tempo

Validação:

- LEFT JOIN para identificar chaves órfãs

---

### 5. Detecção de Duplicidades

Regra:

- Não pode haver mais de um registro por período

Validação:

- Agrupamento por id_tempo com HAVING COUNT(*) > 1

---

## 🧩 Integração com o ETL

As validações podem ser:

- Executadas após o Data Flow
- Integradas como tarefas de verificação no Control Flow
- Registradas em tabelas de auditoria

Em caso de falha:

- Processo pode ser interrompido
- Status registrado como ERRO

---

## 📌 Benefícios para o Negócio

- Confiança nos KPIs apresentados
- Redução de retrabalho
- Base confiável para tomada de decisão
- Rastreabilidade de problemas

---

Status: ✅ Regras de Data Quality documentadas
