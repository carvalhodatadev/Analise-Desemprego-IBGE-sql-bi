# Configurações do SSIS

## 📋 Especificações Técnicas

### 🔧 Versões Utilizadas
- **SQL Server**: 2019 Developer Edition
- **SSIS (SQL Server Integration Services)**: Versão 15.0
- **Visual Studio**: 2019 (SSDT - SQL Server Data Tools)

### 📊 Configurações do Projeto SSIS
- **Projeto**: ProjetoDesempregoETL.dtsx
- **Tipo de implantação**: Project Deployment Model
- **Servidor SSIS**: localhost
- **Catálogo SSIS**: SSISDB

### 🔗 Connection Managers

#### 1. Flat File Connection Manager

{
  "Nome": "DadosDesemprego_CSV",
  "Caminho": "C:\\Projetoportfolio\\DadosBrutos\\Dadosdesemprego.csv",
  "Tipo": "Delimitado",
  "Delimitador": ";",
  "Codificação": "UTF-8",
  "Linhas de cabeçalho": 1,
  "Formato de texto qualificado": "\""
}
{
  "Nome": "SQL_Server_Local",
  "Provedor": "Native OLE DB\\SQL Server Native Client 11.0",
  "Servidor": "localhost",
  "Banco de dados": "ProjetoDesemprego",
  "Autenticação": "Windows Authentication"
}
⚙️ Configurações de Execução
DelayValidation: True (para todas as conexões)

RetainSameConnection: False

TransactionOption: Supported

🔄 Variáveis de Pacote
Nome	Tipo	Valor	Descrição
User::FilePath	String	C:\Projetoportfolio\DadosBrutos\Dadosdesemprego.csv	Caminho do arquivo CSV
User::RowCount	Int32	0	Contador de linhas processadas
User::ProcessDate	DateTime	(data atual)	Data do processamento
🛡️ Tratamento de Erros
MaximumErrorCount: 0 (continua após erros)

FailPackageOnFailure: False

Logging Level: Basic (registra início/fim de tarefas)

📈 Configurações de Desempenho
DefaultBufferMaxRows: 10000

DefaultBufferSize: 10485760 (10 MB)

EngineThreads: 5

BLOBTempStoragePath: (padrão do sistema)

BufferTempStoragePath: (padrão do sistema)

📝 Logging Configuration
ProviderType: SSIS log provider for SQL Server

Connection: SQL_Server_Local

Tabela de log: [dbo].[SSIS_Log]

Eventos logados: OnError, OnWarning, OnTaskFailed, OnPostExecute

🔧 Configurações de Deploy
sql
-- Script para criação do catálogo
CREATE CATALOG SSISDB;
GO

-- Script para deploy do projeto
DECLARE @ProjectBinary varbinary(max)
SELECT @ProjectBinary = [content] FROM OPENROWSET(BULK 'C:\Projetoportfolio\ProjetoDesempregoETL.ispac', SINGLE_BLOB) AS BinaryData

EXEC [SSISDB].[catalog].[deploy_project] 
    @folder_name = 'ProjetoDesemprego',
    @project_name = 'ETL_Desemprego',
    @Project_Binary = @ProjectBinary
GO
🚨 Troubleshooting
Erro de conexão: Verificar se o SQL Server está rodando

Erro de arquivo: Verificar permissões na pasta C:\Projetoportfolio\

Erro de memória: Aumentar DefaultBufferSize

Timeout: Aumentar ConnectionTimeout nas conexões

📚 Referências
Microsoft Docs: SQL Server Integration Services

SSIS Catalog Best Practices

Performance Tuning SSIS

Última atualização: $(28/01/2026)
Versão do documento: 1.0
Autor: carvalhodatadev
