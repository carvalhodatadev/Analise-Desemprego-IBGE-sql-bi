✅ Estratégia de Qualidade de Dados
🎯 Objetivo

Garantir que os dados carregados no Data Warehouse sejam completos, corretos, consistentes e confiáveis para análise e tomada de decisão.

🧪 Dimensões de Qualidade Avaliadas
✔ Completude

Verificações:

Nenhum campo-chave pode ser nulo:

id_tempo

taxa_desemprego

Validação:

Comparação entre número de registros esperados e carregados
→ Esperado: 92 registros por carga

✔ Consistência

Regras:

Taxa de desemprego deve estar entre 0 e 100

Trimestre deve seguir padrão válido (T1 a T4)

Implementação:

CHECK constraints no banco

Validações no SSIS antes da carga

✔ Conformidade

Padrões aplicados:

Formato de datas padronizado

Padronização de nomes de região

Tipos de dados coerentes com o modelo

Validação automática via:

Data Conversion no SSIS

Tipagem no SQL Server

✔ Unicidade

Regra:

Não pode existir duplicidade para o mesmo:

Trimestre

Região

Solução:

Chave composta lógica

Controle de duplicidade no ETL

🧾 Monitoramento Contínuo

Acompanhamento via:

Tabela ctrl_etl_desemprego

Queries de validação pós-carga

Alertas em caso de falha

Indicadores:

Volume carregado

Sucesso ou erro

Data da última carga

🔁 Validação Pós-Carga

Consultas executadas após ETL:

Contagem total de registros

Verificação de valores fora de faixa

Conferência de datas

Exemplo:

SELECT COUNT(*) FROM fato_desemprego;


Resultado esperado:

92 registros por carga

🚨 Tratamento de Anomalias

Quando identificado problema:

Carga é invalidada

Registro de erro no controle ETL

Dados não são disponibilizados para BI

Processo pode ser reexecutado

Isso garante:

Zero impacto em análises

Integridade histórica preservada

📈 Benefícios para o Negócio

Confiança nos indicadores

Redução de retrabalho

Base sólida para decisões

Credibilidade do dashboard

✅ Status

✔ Regras automatizadas
✔ Validação pré e pós-carga
✔ Auditoria operacional
✔ Pipeline confiável
