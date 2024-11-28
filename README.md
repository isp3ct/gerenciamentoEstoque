
# Controle de Estoque

Este repositório contém o script SQL para criar e popular um banco de dados simples, representando um sistema de **Gerenciamento de Estoque** inspirado nos modelos de sistemas TOTVS. O objetivo é simular um controle básico de produtos corporativos.

---

## 📂 Estrutura do Banco de Dados

O banco de dados utiliza o sistema **MySQL** e contém uma tabela chamada `produtos`. Esta tabela armazena as seguintes informações sobre os produtos:

### Tabela: `produtos`

| Coluna      | Tipo         | Descrição                                 |
|-------------|--------------|-------------------------------------------|
| `id`        | INT          | Identificador único do produto (PK).     |
| `nome`      | VARCHAR(100) | Nome descritivo do produto.               |
| `preco`     | DECIMAL(10,2)| Preço do produto em formato decimal.      |

---

## 📜 Script de Criação e População do Banco de Dados

### Passo 1: Criação do Banco de Dados e da Tabela

```sql
CREATE DATABASE IF NOT EXISTS Controledeestoque;

USE Controledeestoque;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    preco DECIMAL(10, 2) NOT NULL
);
```

### Passo 2: Inserção de Dados

```sql
INSERT INTO produtos (nome, preco) VALUES 
    ('Produto A - Estoque Base', 120.50),
    ('Produto B - Equipamento de Escritório', 450.00),
    ('Produto C - Licença de Software', 1500.00),
    ('Produto D - Serviço de Suporte Técnico', 800.00),
    ('Produto E - Insumo Operacional', 75.30);
```

---

## 📊 Dados de Exemplo

Após executar o script, os seguintes dados estarão disponíveis na tabela `produtos`:

| ID  | Nome                                      | Preço    |
|-----|-------------------------------------------|----------|
| 1   | Produto A - Estoque Base                  | 120.50   |
| 2   | Produto B - Equipamento de Escritório     | 450.00   |
| 3   | Produto C - Licença de Software           | 1500.00  |
| 4   | Produto D - Serviço de Suporte Técnico    | 800.00   |
| 5   | Produto E - Insumo Operacional            | 75.30    |
|-----|-------------------------------------------|----------|

---

## 🛠️ Como Usar

### Pré-requisitos

1. **MySQL** instalado no ambiente.
2. Ferramenta para executar scripts SQL, como:
   - **MySQL Workbench**
   - **DBeaver**
   - **phpMyAdmin**
   - Terminal MySQL.

### Passos para Configuração

1. Clone este repositório para o seu ambiente local:
   ```bash
   git clone https://github.com/isp3ct/controledeestoque.git
   ```

2. Navegue até a pasta do projeto:
   ```bash
   cd controledeestoque
   ```

3. Execute o script SQL (`controledeestoque.sql`) no MySQL para criar e popular o banco de dados.

4. Acesse o banco de dados `Controledeestoque` e verifique os dados:
   ```sql
   SELECT * FROM produtos;
   ```

---

## ✅ Funcionalidades Planejadas

1. **Movimentação de Estoque:**
   - Registre entradas e saídas de produtos no estoque.
2. **Integração com Fornecedores:**
   - Criação de tabela para rastrear fornecedores dos produtos.
3. **Histórico de Preços:**
   - Adicionar funcionalidades para rastrear alterações de preços.
4. **APIs RESTful:**
   - Criar endpoints para integração com sistemas externos.

---

## 🚀 Próximos Passos

1. **Customização:**
   - Adicionar suporte para categorias de produtos.
2. **Interface de Gerenciamento:**
   - Criar um front-end para facilitar a administração do estoque.
3. **Relatórios:**
   - Desenvolver relatórios sobre movimentação e status de estoque.

---
