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
```json
{
  "Nome": "DadosDesemprego_CSV",
  "Caminho": "C:\\Projetoportfolio\\DadosBrutos\\Dadosdesemprego.csv",
  "Tipo": "Delimitado",
  "Delimitador": ";",
  "Codificação": "UTF-8",
  "Linhas de cabeçalho": 1,
  "Formato de texto qualificado": "\""
}
