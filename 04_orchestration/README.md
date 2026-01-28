# ⏰ 04 - Orchestration (Orquestração Básica)

## 📌 Objetivo
Configurar a execução automática diária do pacote SSIS através do SQL Server Agent para manter os dados atualizados.

## 🔧 Configuração Realizada
1. **Job do SQL Agent**: Criado para executar o pacote SSIS diariamente
2. **Agendamento**: Programado para rodar às 08:00 todos os dias
3. **Integração**: Conectado ao pacote SSIS existente na pasta `03_etl_ssis`

## ⚙️ Configuração Técnica
- **Nome do Job**: `ETL_Desemprego_Diario`
- **Horário**: 08:00 diariamente
- **Pacote SSIS**: `Package.dtsx`
- **Caminho**: `C:\Users\Gazera\source\repos\ETLdesemprego\ETLdesemprego\Package.dtsx`

## 📋 Script de Criação do Job

```sql
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
