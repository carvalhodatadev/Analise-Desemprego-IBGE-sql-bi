# 📊 Modelo Dimensional do Data Warehouse

## 🏗️ Esquema em Estrela Simplificado

### Tabelas Principais:

#### 1. **dim_tempo** (Dimensão de Tempo)
id_tempo	ano	trimestre	mes_inicial	data_trimestre
202301	2023	2023 T1	Jan	2023-01-01
202302	2023	2023 T2	Abr	2023-04-01


#### 2. **dim_localidade** (Dimensão de Local)
id_localidade	pais	regiao	uf	municipio
1	Brasil	Sudeste	SP	São Paulo
2	Brasil	Nordeste	BA	Salvador


#### 3. **fato_desemprego** (Tabela de Fatos)
id_fato	id_tempo	id_localidade	taxa_desemprego	data_carga
1	202301	1	8.5	2024-01-15
2	202302	1	8.2	2024-01-15


## 🔗 Relacionamentos
dim_tempo (1) ---- (M) fato_desemprego (M) ---- (1) dim_localidade



## 📋 Explicação das Chaves

- **PK** (Primary Key): Identificador único de cada linha
- **FK** (Foreign Key): Liga uma tabela a outra
- **Surrogate Key**: Número gerado automaticamente (ex: id_fato)

## 💡 Por que este modelo?

1. **Organizado**: Separa dados por tipo (tempo, local, fatos)
2. **Rápido**: Consultas são mais eficientes
3. **Flexível**: Fácil adicionar novas informações
4. **Padrão**: Usado em todo mundo para data warehouses

## 🔍 Exemplo de Consulta

```sql
-- Mostra desemprego por trimestre e região
SELECT 
    t.trimestre,
    l.regiao,
    f.taxa_desemprego
FROM fato_desemprego f
JOIN dim_tempo t ON f.id_tempo = t.id_tempo
JOIN dim_localidade l ON f.id_localidade = l.id_localidade
ORDER BY t.trimestre, l.regiao;
