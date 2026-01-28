⚙️ Configuração do Power BI — Conexão, Atualização e Publicação

Este documento descreve como o dashboard foi configurado no Power BI Desktop, conectado ao Data Warehouse no SQL Server e preparado para atualização automática.

---

## 🔌 Fonte de Dados

Origem dos dados:

- Tipo: SQL Server
- Banco: Data Warehouse de Desemprego (IBGE)
- Tabelas utilizadas:
  - fato_desemprego
  - dim_tempo
  - dim_regiao

Tipo de conexão:

- ✅ Import (dados em memória para alta performance)

---

## 🔗 Conectando ao SQL Server

Passos no Power BI Desktop:

1. Obter Dados → SQL Server
2. Informar:
   - Servidor: `NOME_DO_SERVIDOR`
   - Banco: `NOME_DO_BANCO`
3. Modo: Importar
4. Selecionar tabelas dimensionais e fato
5. Carregar dados

Relacionamentos são criados manualmente conforme o modelo estrela.

---

## 🔄 Atualização dos Dados (Refresh)

### 🔹 Atualização Local

No Power BI Desktop:

- Botão **Atualizar**
- Reexecuta consultas no SQL Server
- Recarrega dados do DW

Usado durante desenvolvimento e testes.

---

### 🔹 Atualização no Power BI Service

Após publicação:

- Dataset hospedado na nuvem
- Atualização automática configurável

Requisitos:

- Gateway instalado se banco estiver local
- Credenciais configuradas

---

## 🌐 Gateway de Dados (On-Premises)

Necessário quando:

- SQL Server está em máquina local
- Ou em rede corporativa

Passos:

1. Instalar On-Premises Data Gateway
2. Registrar no Power BI Service
3. Associar dataset ao gateway
4. Configurar credenciais do SQL Server

Permite:

- Atualização automática
- Acesso seguro ao banco local

---

## ⏱️ Agendamento de Atualização

Configuração recomendada:

- Frequência: 1 vez por dia
- Horário: fora do horário comercial

Justificativa:

- Dados trimestrais não exigem refresh frequente
- Evita consumo desnecessário de recursos

---

## ⚡ Boas Práticas de Performance

Aplicadas neste projeto:

- Modelo estrela (dimensões + fato)
- Uso de chaves inteiras (IDs)
- Evitar colunas calculadas desnecessárias
- Medidas DAX em vez de colunas sempre que possível

Resultado:

- Dashboards rápidos
- Filtros instantâneos
- Boa experiência de navegação

---

## 🔐 Segurança e Acesso

Possibilidades futuras:

- Row Level Security (RLS) por região
- Controle de acesso por usuário
- Publicação em workspace dedicado

Neste projeto:

- Dados públicos do IBGE
- Sem restrições de acesso

---

## 📤 Publicação do Dashboard

Passos:

1. Arquivo `.pbix` finalizado
2. Publicar → Workspace no Power BI Service
3. Compartilhar com usuários ou gerar link

Permite:

- Acesso via navegador
- Compartilhamento para recrutadores

---

## 🧪 Validação Pós-Publicação

Checklist:

- Dados atualizando corretamente
- Relacionamentos ativos
- KPIs calculados corretamente
- Filtros funcionando
- Performance adequada

---

Status: ✅ Dashboard pronto para uso profissional e publicação
