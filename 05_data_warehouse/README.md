# 🏗️ 05 - Data Warehouse (Armazém de Dados)

## 📌 Objetivo
Armazenar os dados de desemprego de forma organizada e otimizada para análise, permitindo consultas rápidas e relatórios detalhados.

## 🏛️ O que é um Data Warehouse?
Um data warehouse é um banco de dados especializado para análise de dados. Ele armazena informações históricas de forma organizada, facilitando a criação de relatórios e dashboards.

## 📊 Nosso Modelo de Dados

### 📋 Tabelas principais:
1. **dim_tempo** - Informações sobre tempo (ano, trimestre, mês)
2. **dim_localidade** - Informações sobre localidades (país, região)
3. **fato_desemprego** - Dados principais sobre desemprego (taxas, variações)

### 🔗 Como as tabelas se conectam:
- `fato_desemprego` tem ligação com `dim_tempo` (quando ocorreu)
- `fato_desemprego` tem ligação com `dim_localidade` (onde ocorreu)

## 🔧 O que foi implementado

### ✅ Etapas concluídas:
1. **Modelagem**: Criamos o design das tabelas
2. **Criação**: Implementamos as tabelas no SQL Server
3. **Carga**: Desenvolvemos o processo para carregar dados
4. **Análise**: Criamos consultas úteis para análise

### 📈 Benefícios:
- **Organização**: Dados estruturados de forma lógica
- **Performance**: Consultas mais rápidas
- **Análise**: Facilita criação de relatórios
- **Histórico**: Mantém histórico dos dados

## 📁 O que você encontrará nesta pasta

### 📄 **documentation/**
Explicações detalhadas sobre o modelo de dados e como tudo funciona.

### 📄 **scripts/**
Códigos SQL para criar tabelas, carregar dados e fazer consultas.

### 📄 **diagrams/**
Imagens que mostram como as tabelas se relacionam (se disponíveis).

### 📄 **screenshots/**
Fotos mostrando os dados no data warehouse (se disponíveis).

## 🚀 Como usar

### Para desenvolvedores:
1. Veja os scripts em `scripts/` para entender a estrutura
2. Consulte a documentação em `documentation/` para detalhes
3. Use as consultas de exemplo para análise

### Para analistas:
1. Os dados estão organizados para facilitar análise
2. Use as views criadas para relatórios
3. Consulte as métricas pré-calculadas

## 📊 Resultados alcançados

- ✅ **92 trimestres** de dados organizados (2018-2025)
- ✅ **Dados limpos** e validados
- ✅ **Consultas otimizadas** para análise rápida
- ✅ **Estrutura preparada** para crescimento

## 🔗 Ligações com outras pastas

### ⬅️ Recebe dados de:
- **04_orchestration**: Dados processados automaticamente
- **03_etl_ssis**: Dados transformados e limpos

### ➡️ Fornece dados para:
- **Power BI** (próxima etapa): Para criação de dashboards
- **Relatórios**: Para análise e tomada de decisão

## 👨‍💻 Status do projeto

**Nível:** ✅ **Completo e funcional**  
**Última atualização:** $(data atual)  
**Próximo passo:** Criar dashboard no Power BI  

---

> 💡 **Dica para iniciantes:** Data warehouse parece complicado, mas é basicamente uma forma organizada de guardar dados para análise. Pense como uma biblioteca bem organizada, onde você encontra qualquer livro rapidamente!

**Próxima etapa:** [06_power_bi/](../06_power_bi) - Dashboard e visualização
