# Configuração do Pacote SSIS

## Conexões Configuradas

### 1. Fonte de Arquivo Simples
- **Nome**: DadosDesemprego_CSV
- **Caminho**: C:\Projetoportfolio\DadosBrutos\Dadosdesemprego.csv
- **Formato**: Delimitado
- **Delimitador**: Ponto e vírgula (;)
- **Codificação**: UTF-8 (65001)
- **Colunas**:
  - Trimestre: string [DT_WSTR]
  - Taxa: string [DT_WSTR]

### 2. Destino OLE DB
- **Nome**: SQL_Server_Local
- **Provedor**: OLE DB Provider for SQL Server
- **Servidor**: localhost
- **Banco de dados**: ProjetoDesemprego
- **Autenticação**: Windows Authentication

## Transformações

### Data Conversion
- **Coluna**: Taxa
- **Tipo de entrada**: DT_WSTR
- **Tipo de saída**: DT_NUMERIC
- **Precisão**: 10
- **Escala**: 2

### Derived Column
- **Ano**: (DT_I4)RIGHT(Trimestre, 4)
- **Mes_Inicial**: (DT_WSTR,3)LEFT(Trimestre, 3)
- **Data_Trimestre**: (DT_DBDATE)((DT_WSTR,2)RIGHT(Trimestre, 4) + "-" + 
  CASE LEFT(Trimestre, 3)
    WHEN 'jan' THEN '01'
    WHEN 'fev' THEN '02'
    WHEN 'mar' THEN '03'
    WHEN 'abr' THEN '04'
    WHEN 'mai' THEN '05'
    WHEN 'jun' THEN '06'
    WHEN 'jul' THEN '07'
    WHEN 'ago' THEN '08'
    WHEN 'set' THEN '09'
    WHEN 'out' THEN '10'
    WHEN 'nov' THEN '11'
    WHEN 'dez' THEN '12'
  END + "-01")

## Tarefas do Control Flow
1. **Fluxo de Dados**: csv para stage e etl
2. **Executar Tarefa SQL**: Processar procedure DW
