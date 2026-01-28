sql
-- Script para criação do job do SQL Server Agent
-- Arquivo: 01_create_sql_agent_job.sql
-- Autor: carvalhodatadev
-- Data: $(28/01/2026)

USE msdb;
GO

-- 1. Criar o job
EXEC dbo.sp_add_job
    @job_name = N'ETL_Desemprego_Diario',
    @enabled = 1,
    @description = N'ETL automático para dados de desemprego - Execução diária às 08:00';

-- 2. Adicionar step para executar o pacote SSIS
EXEC sp_add_jobstep
    @job_name = N'ETL_Desemprego_Diario',
    @step_name = N'Executar_Pacote_SSIS',
    @subsystem = N'SSIS',
    @command = N'/FILE "C:\Users\Gazera\source\repos\ETLdesemprego\ETLdesemprego\Package.dtsx" /CHECKPOINTING OFF',
    @retry_attempts = 2,
    @retry_interval = 5;

-- 3. Criar agendamento diário às 08:00
EXEC sp_add_schedule
    @schedule_name = N'Diario_08h',
    @freq_type = 4, -- Diário
    @freq_interval = 1,
    @active_start_time = 080000; -- 08:00:00

-- 4. Associar agendamento ao job
EXEC sp_attach_schedule
    @job_name = N'ETL_Desemprego_Diario',
    @schedule_name = N'Diario_08h';

-- 5. Adicionar job ao servidor
EXEC sp_add_jobserver
    @job_name = N'ETL_Desemprego_Diario';

-- Mensagem de confirmação
PRINT '✅ Job ETL_Desemprego_Diario criado com sucesso!';
PRINT '📅 Agendado para execução diária às 08:00';
GO
