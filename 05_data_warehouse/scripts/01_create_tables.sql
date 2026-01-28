-- =============================================
-- SCRIPT: Criar Tabelas do Data Warehouse
-- PROJETO: Análise de Desemprego IBGE
-- AUTOR: carvalhodatadev
-- =============================================

-- Banco de dados do Data Warehouse
USE DW_DB;
GO

-- 📊 1. TABELA DIM_TEMPO (Tempo)
PRINT 'Criando tabela dim_tempo...';
CREATE TABLE dim_tempo (
    id_tempo INT PRIMARY KEY,
    ano INT NOT NULL,
    trimestre VARCHAR(20) NOT NULL,
    mes_inicial VARCHAR(20),
    data_trimestre DATE
);
PRINT '✅ Tabela dim_tempo criada!';
GO

-- 🌍 2. TABELA DIM_LOCALIDADE (Local)
PRINT 'Criando tabela dim_localidade...';
CREATE TABLE dim_localidade (
    id_localidade INT PRIMARY KEY,
    pais VARCHAR(100) DEFAULT 'Brasil',
    regiao VARCHAR(50),
    uf VARCHAR(2),
    municipio VARCHAR(100)
);
PRINT '✅ Tabela dim_localidade criada!';
GO

-- 📈 3. TABELA FATO_DESEMPREGO (Dados principais)
PRINT 'Criando tabela fato_desemprego...';
CREATE TABLE fato_desemprego (
    id_fato BIGINT IDENTITY(1,1) PRIMARY KEY,
    id_tempo INT NOT NULL,
    id_localidade INT NOT NULL,
    taxa_desemprego DECIMAL(10,2) NOT NULL,
    data_carga DATETIME DEFAULT GETDATE(),
    
    -- Chaves estrangeiras
    FOREIGN KEY (id_tempo) REFERENCES dim_tempo(id_tempo),
    FOREIGN KEY (id_localidade) REFERENCES dim_localidade(id_localidade)
);
PRINT '✅ Tabela fato_desemprego criada!';
GO

-- =============================================
-- MENSAGEM FINAL
-- =============================================
PRINT '=======================================';
PRINT '✅ TODAS AS TABELAS FORAM CRIADAS!';
PRINT '   • dim_tempo');
PRINT '   • dim_localidade');
PRINT '   • fato_desemprego');
PRINT '=======================================';
GO
