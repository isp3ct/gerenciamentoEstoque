<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="produto.Produto" %>
<%@ page import="produto.ProdutoDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Produtos</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        h2 {
            color: #007bff;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        button, .actions a {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 16px;
            margin: 5px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        button:hover, .actions a:hover {
            background-color: #218838;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"], input[type="number"] {
            padding: 10px;
            font-size: 16px;
            width: calc(100% - 22px);
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
        }

        .actions a {
            margin-right: 10px;
            padding: 8px;
            display: inline-block;
        }

        .actions a.edit {
            background-color: #007bff;
        }

        .actions a.edit:hover {
            background-color: #0056b3;
        }

        .actions a.delete {
            background-color: #dc3545;
        }

        .actions a.delete:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h1>Gerenciamento de Estoque</h1>

    <div class="container">
        <!-- Botão para exibir a lista de produtos -->
        <form action="ProdutoController" method="GET" style="display:inline;">
            <input type="hidden" name="action" value="listar">
            <button type="submit"><i class="fas fa-list"></i> Exibir Lista de Produtos</button>
        </form>

        <!-- Botão para ir diretamente para a página de edição -->
        <form action="ProdutoController" method="GET" style="display:inline;">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="0"> <!-- ID fictício para testar -->
            <button type="submit"><i class="fas fa-edit"></i> Editar Produto</button>
        </form>

        <!-- Formulário para adicionar produtos -->
        <h2>Adicionar Novo Produto</h2>
        <form action="ProdutoController" method="POST">
            <input type="hidden" name="action" value="insert">
            Nome: <input type="text" name="nome" required>
            Preço: <input type="number" step="0.01" name="preco" required>
            <button type="submit"><i class="fas fa-plus"></i> Adicionar Produto</button>
        </form>

        <!-- Lista de produtos -->
        <h2>Lista de Produtos</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
            <%
                // Recuperar a lista de produtos enviada pelo controlador
                List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                if (produtos != null) {
                    for (Produto produto : produtos) {
            %>
            <tr>
                <td><%= produto.getId() %></td>
                <td><%= produto.getNome() %></td>
                <td>R$ <%= produto.getPreco() %></td>
                <td class="actions">
                    <a href="ProdutoController?action=edit&id=<%= produto.getId() %>" class="edit"><i class="fas fa-edit"></i> Editar</a>
                    <a href="ProdutoController?action=delete&id=<%= produto.getId() %>" class="delete"><i class="fas fa-trash-alt"></i> Excluir</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">Nenhum produto encontrado</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
