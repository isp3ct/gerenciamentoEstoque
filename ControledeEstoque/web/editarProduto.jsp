<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="produto.Produto" %>
<%
    Produto produto = (Produto) request.getAttribute("produto");
    if (produto == null) {
        response.sendRedirect("produtos.jsp"); // Redirecionar caso o produto seja nulo
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Produto</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"], input[type="number"] {
            padding: 10px;
            font-size: 16px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 12px;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007bff;
            display: block;
            text-align: center;
            margin-top: 20px;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Editar Produto</h1>
        <form action="ProdutoController" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= produto.getId() %>">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="<%= produto.getNome() %>" required>
            
            <label for="preco">Preço:</label>
            <input type="number" step="0.01" id="preco" name="preco" value="<%= produto.getPreco() %>" required>
            
            <button type="submit"><i class="fas fa-save"></i> Atualizar Produto</button>
        </form>
        <a href="produtos.jsp"><i class="fas fa-arrow-left"></i> Voltar para a lista de produtos</a>
    </div>
</body>
</html>