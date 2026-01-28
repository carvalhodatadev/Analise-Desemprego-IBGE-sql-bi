# 📝 Configuração do SQL Server Agent - Notas Técnicas Detalhadas

## 🎯 Visão Geral da Automação
Este documento detalha a configuração técnica do SQL Server Agent para automação do pipeline ETL de dados de desemprego do IBGE. A implementação atual fornece uma base sólida para execução automatizada, com possibilidade de expansão para funcionalidades mais avançadas.

## ⚙️ Especificações Técnicas Completas

### 🔧 Job: `ETL_Desemprego_Diario`
| Parâmetro | Valor | Descrição Técnica |
|-----------|-------|-------------------|
| **Nome** | `ETL_Desemprego_Diario` | Identificador único no SQL Agent |
| **GUID** | `$(gerado automaticamente)` | Identificador único global |
| **Categoria** | `[Uncategorized (Local)]` | Grupo organizacional |
| **Habilitado** | `1` (TRUE) | Status de ativação |
| **Descrição** | `ETL automático para dados de desemprego` | Documentação interna |
| **Proprietário** | `sa` | Conta proprietária do job |
| **Data Criação** | `$(data de criação)` | Timestamp de criação |
| **Versão** | `1.0` | Versão da configuração |

### ⏰ Agendamento: `Diario_08h`
| Configuração | Valor | Explicação Técnica |
|--------------|-------|-------------------|
| **Tipo** | `4` (Freq_type) | Diário |
| **Intervalo** | `1` (Freq_interval) | Todos os dias |
| **Subdia Tipo** | `1` (Freq_subday_type) | Na hora especificada |
| **Subdia Intervalo** | `0` | Sem repetição intra-dia |
| **Hora Início** | `080000` (08:00:00) | Formato HHMMSS |
| **Hora Fim** | `235959` (23:59:59) | Janela de execução |
| **Data Início** | `20250101` (01/01/2025) | Data inicial |
| **Data Fim** | `99991231` (31/12/9999) | Data final (praticamente indefinido) |

### 🔄 Step: `Executar_Pacote_SSIS`
| Parâmetro | Valor | Significado |
|-----------|-------|-------------|
| **ID do Step** | `1` | Ordem de execução |
| **Nome** | `Executar_Pacote_SSIS` | Identificador do step |
| **Subsistema** | `SSIS` | Tipo de execução |
| **Comando** | `/FILE "C:\Users\Gazera\source\repos\ETLdesemprego\ETLdesemprego\Package.dtsx" /CHECKPOINTING OFF /REPORTING E` | Comando de execução do pacote |
| **Código de Sucesso** | `0` | Código de retorno esperado |
| **Tentativas** | `3` | Número de retries |
| **Intervalo** | `10` | Minutos entre tentativas |
| **Flags** | `0` | Opções adicionais |

## 🛠️ Script de Criação Comentado

```sql
-- =============================================
-- CONFIGURAÇÃO COMPLETA DO SQL AGENT JOB
-- COM COMENTÁRIOS TÉCNICOS DETALHADOS
-- =============================================

USE [msdb];
GO

-- 📌 1. CRIAÇÃO DO JOB PRINCIPAL
-- sp_add_job: Cria a definição básica do job
EXEC dbo.sp_add_job
    @job_name = N'ETL_Desemprego_Diario',          -- Nome do job (até 128 caracteres)
    @enabled = 1,                                  -- 1=Habilitado, 0=Desabilitado
    @description = N'ETL automático para dados de desemprego do IBGE',
    @category_name = N'[Uncategorized (Local)]',   -- Categoria para organização
    @owner_login_name = N'sa';                     -- Login proprietário do job

-- 📌 2. CONFIGURAÇÃO DO STEP DE EXECUÇÃO
-- sp_add_jobstep: Adiciona uma etapa de execução ao job
EXEC sp_add_jobstep
    @job_name = N'ETL_Desemprego_Diario',
    @step_name = N'Executar_Pacote_SSIS',          -- Nome descritivo do step
    @step_id = 1,                                  -- Ordem de execução (1=primeiro)
    @cmdexec_success_code = 0,                     -- Código de retorno para sucesso
    @subsystem = N'SSIS',                          -- Tipo: SSIS, TSQL, PowerShell, etc.
    @command = N'/FILE "C:\Users\Gazera\source\repos\ETLdesemprego\ETLdesemprego\Package.dtsx" /CHECKPOINTING OFF /REPORTING E',
    @retry_attempts = 3,                           -- Tentativas em caso de falha
    @retry_interval = 10,                          -- Minutos entre tentativas
    @os_run_priority = 0,                          -- Prioridade do processo (0=normal)
    @flags = 0;                                    -- Flags adicionais

-- 📌 3. CRIAÇÃO DO SCHEDULE
-- sp_add_schedule: Define o agendamento de execução
EXEC sp_add_schedule
    @schedule_name = N'Diario_08h',
    @enabled = 1,
    @freq_type = 4,        -- 4=Diário, 8=Semanal, 16=Mensal, 32=Mensal relativo
    @freq_interval = 1,    -- Intervalo: 1=Todos os dias
    @freq_subday_type = 1, -- 1=Na hora especificada, 4=Minutos, 8=Horas
    @freq_subday_interval = 0,
    @freq_relative_interval = 0,
    @freq_recurrence_factor = 0,
    @active_start_date = 20250101, -- Data inicial (YYYYMMDD)
    @active_end_date = 99991231,   -- Data final
    @active_start_time = 80000,    -- Hora início (HHMMSS)
    @active_end_time = 235959;     -- Hora fim

-- 📌 4. ASSOCIAÇÃO DO SCHEDULE AO JOB
-- sp_attach_schedule: Vincula o agendamento ao job
EXEC sp_attach_schedule
    @job_name = N'ETL_Desemprego_Diario',
    @schedule_name = N'Diario_08h';

-- 📌 5. ATIVAÇÃO DO JOB NO SERVIDOR
-- sp_add_jobserver: Torna o job visível e executável no servidor
EXEC sp_add_jobserver
    @job_name = N'ETL_Desemprego_Diario',
    @server_name = N'(local)';  -- Servidor local
📊 Monitoramento Avançado
🔍 Tabelas do Sistema Monitoradas
sql
-- 👁️ Tabelas principais do SQL Agent:
-- msdb.dbo.sysjobs        → Jobs configurados
-- msdb.dbo.sysjobsteps    → Steps dos jobs
-- msdb.dbo.sysjobschedules → Schedules configurados
-- msdb.dbo.sysjobhistory  → Histórico de execução
-- msdb.dbo.sysjobactivity → Atividade atual
📈 Consultas de Monitoramento Detalhadas
sql
-- 1. VISÃO GERAL DOS JOBS
SELECT 
    sj.job_id AS [ID],
    sj.name AS [Nome do Job],
    CASE sj.enabled 
        WHEN 1 THEN '✅ ATIVO' 
        ELSE '❌ INATIVO' 
    END AS [Status],
    sj.description AS [Descrição],
    sj.date_created AS [Data Criação],
    sj.date_modified AS [Última Modificação],
    sj.version_number AS [Versão]
FROM msdb.dbo.sysjobs sj
WHERE sj.name LIKE '%ETL_Desemprego%'
ORDER BY sj.date_created DESC;

-- 2. DETALHES DOS STEPS
SELECT 
    sjs.step_id AS [Nº Step],
    sjs.step_name AS [Nome do Step],
    CASE sjs.subsystem
        WHEN 'SSIS' THEN '📦 SSIS Package'
        WHEN 'TSQL' THEN '💾 T-SQL Script'
        WHEN 'PowerShell' THEN '⚡ PowerShell'
        ELSE sjs.subsystem
    END AS [Tipo],
    sjs.command AS [Comando],
    sjs.retry_attempts AS [Tentativas],
    sjs.retry_interval AS [Intervalo (min)]
FROM msdb.dbo.sysjobsteps sjs
JOIN msdb.dbo.sysjobs sj ON sjs.job_id = sj.job_id
WHERE sj.name = 'ETL_Desemprego_Diario'
ORDER BY sjs.step_id;

-- 3. HISTÓRICO DETALHADO DE EXECUÇÃO
SELECT TOP 20
    CONVERT(DATETIME, 
            CONVERT(CHAR(8), h.run_date, 112) + ' ' + 
            STUFF(STUFF(RIGHT('000000' + CONVERT(VARCHAR(6), h.run_time), 6), 5, 0, ':'), 3, 0, ':')
    ) AS [Data/Hora Execução],
    CASE h.run_status
        WHEN 0 THEN '❌ FALHA'
        WHEN 1 THEN '✅ SUCESSO'
        WHEN 2 THEN '🔄 REPETIR'
        WHEN 3 THEN '⏹️ CANCELADO'
        ELSE '❓ DESCONHECIDO'
    END AS [Status],
    DATEDIFF(SECOND, 
            CONVERT(DATETIME, 
                    CONVERT(CHAR(8), h.run_date, 112) + ' ' + 
                    STUFF(STUFF(RIGHT('000000' + CONVERT(VARCHAR(6), h.run_time), 6), 5, 0, ':'), 3, 0, ':')
            ),
            CONVERT(DATETIME, 
                    CONVERT(CHAR(8), h.run_date, 112) + ' ' + 
                    STUFF(STUFF(RIGHT('000000' + CONVERT(VARCHAR(6), h.run_duration), 6), 5, 0, ':'), 3, 0, ':')
            )
    ) AS [Duração (seg)],
    h.message AS [Mensagem de Log]
FROM msdb.dbo.sysjobhistory h
JOIN msdb.dbo.sysjobs j ON h.job_id = j.job_id
WHERE j.name = 'ETL_Desemprego_Diario'
    AND h.step_id = 0  -- Apenas logs do job completo
ORDER BY h.run_date DESC, h.run_time DESC;
🔧 Troubleshooting e Manutenção
🚨 Problemas Comuns e Soluções
1. Job Não Executa
Sintoma: Job aparece como "aguardando" mas nunca executa.
Possíveis causas e soluções:

sql
-- Verificar se o SQL Agent está rodando
EXEC xp_servicecontrol 'querystate', 'SQLSERVERAGENT';

-- Verificar status do schedule
SELECT * FROM msdb.dbo.sysschedules 
WHERE name = 'Diario_08h';

-- Forçar execução manual para teste
EXEC msdb.dbo.sp_start_job N'ETL_Desemprego_Diario';
2. Falha na Execução do Pacote
Sintoma: Job falha com erro no step SSIS.
Solução passo a passo:

Testar pacote manualmente no SSIS

Verificar permissões no caminho do arquivo .dtsx

Verificar conexões no pacote

Checar espaço em disco

3. Agendamento Ignorado
Solução:

sql
-- Reativar schedule
EXEC msdb.dbo.sp_update_schedule
    @name = 'Diario_08h',
    @enabled = 1;

-- Verificar conflitos de horário
SELECT 
    j.name AS JobName,
    s.name AS ScheduleName,
    s.active_start_time AS Horario
FROM msdb.dbo.sysjobs j
JOIN msdb.dbo.sysjobschedules js ON j.job_id = js.job_id
JOIN msdb.dbo.sysschedules s ON js.schedule_id = s.schedule_id
WHERE s.active_start_time BETWEEN 70000 AND 90000;
🚀 Roadmap de Melhorias
📋 Fase 1: Básica (ATUAL)
✅ Job com único step SSIS

✅ Agendamento diário simples

✅ Retry básico (3 tentativas)

📋 Fase 2: Intermediária (PLANEJADA)
🔄 Notificações por e-mail (Database Mail)

📊 Logging em tabelas customizadas

🔍 Monitoramento via PowerShell

⚡ Steps adicionais (backup, limpeza)

📋 Fase 3: Avançada (FUTURO)
🤖 Self-healing (correção automática de problemas)

📈 Dashboard Power BI de monitoramento

🔗 Integração com Slack/Teams

📱 Alertas via SMS/WhatsApp

🔒 Considerações de Segurança
👤 Contas e Permissões
Conta	Função	Permissões Recomendadas
SQL Agent Service Account	Execução dos jobs	sysadmin ou permissões específicas
Proxy Account	Execução de steps específicos	Credenciais limitadas por subsistema
Operadores	Recebimento de notificações	Apenas leitura em logs
🔐 Boas Práticas Implementadas
Job habilitado apenas quando necessário

Logs mantidos por 30 dias (configuração padrão)

Backup regular dos scripts de configuração

Versionamento da configuração no GitHub

📚 Referências Técnicas
Documentação Oficial Microsoft
SQL Server Agent Documentation

sp_add_job (Transact-SQL)

SQL Server Agent Best Practices

Artigos Técnicos Recomendados
Troubleshooting SQL Server Agent Jobs

Advanced SQL Agent Scheduling

Monitoring SQL Agent with PowerShell

📊 Métricas e KPIs
📈 Métricas Coletadas
Métrica	Valor Atual	Meta	Status
Tempo de Execução	~45 segundos	< 60 segundos	✅
Taxa de Sucesso	100%	> 99%	✅
Disponibilidade	100%	> 99.9%	✅
Tempo de Resolução	-	< 30 minutos	-
📋 Checklist de Saúde do Job
Job habilitado

Schedule ativo

Caminho do pacote válido

Permissões configuradas

Notificações configuradas

Logging customizado

Backup da configuração

📅 Última Revisão: $(28/01/2026)
👨‍💻 Responsável Técnico: carvalhodatadev
🔖 Versão do Documento: 2.0
🏷️ Status: Em Produção - Estável

💡 Nota para Manutenção: Esta configuração serve como base para ambientes de desenvolvimento e teste. Para produção, recomenda-se implementar as melhorias da Fase 2.
