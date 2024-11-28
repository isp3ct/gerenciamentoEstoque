package produto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {

    // Método para estabelecer conexão com o banco de dados
    private Connection connect() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/controledeestoque?useSSL=false&serverTimezone=UTC"; // Nome do banco de dados
        String user = "root"; // Usuário do MySQL
        String password = "root"; // Senha do MySQL

        try {
            // Certifique-se de que o driver JDBC está carregado
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Erro ao carregar o driver JDBC do MySQL", e);
        }

        return DriverManager.getConnection(url, user, password);
    }

    // Método para testar a conexão com o banco de dados
    public void testarConexao() {
        String url = "jdbc:mysql://localhost:3306/mercado?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "root";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            if (conn != null) {
                System.out.println("Conexão bem-sucedida com o banco de dados!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro na conexão com o banco de dados: " + e.getMessage());
        }
    }

    // Método para obter a lista de produtos
    public List<Produto> getProdutos() {
        List<Produto> produtos = new ArrayList<>();
        String sql = "SELECT * FROM produtos";
        try (Connection conn = connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                produtos.add(new Produto(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getDouble("preco")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro ao buscar produtos: " + e.getMessage());
        }
        return produtos;
    }

    // Método para inserir um novo produto
    public void insertProduto(Produto produto) {
        String sql = "INSERT INTO produtos (nome, preco) VALUES (?, ?)";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, produto.getNome());
            pstmt.setDouble(2, produto.getPreco());
            pstmt.executeUpdate();
            System.out.println("Produto inserido com sucesso!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro ao inserir produto: " + e.getMessage());
        }
    }

    // Método para atualizar um produto existente
    public void updateProduto(Produto produto) {
        String sql = "UPDATE produtos SET nome = ?, preco = ? WHERE id = ?";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, produto.getNome());
            pstmt.setDouble(2, produto.getPreco());
            pstmt.setInt(3, produto.getId());
            pstmt.executeUpdate();
            System.out.println("Produto atualizado com sucesso!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro ao atualizar produto: " + e.getMessage());
        }
    }

    // Método para deletar um produto pelo ID
    public void deleteProduto(int id) {
        String sql = "DELETE FROM produtos WHERE id = ?";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            System.out.println("Produto excluído com sucesso!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro ao excluir produto: " + e.getMessage());
        }
    }

    // Método para buscar um produto pelo ID
    public Produto getProdutoById(int id) {
        Produto produto = null;
        String sql = "SELECT * FROM produtos WHERE id = ?";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    produto = new Produto(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getDouble("preco")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erro ao buscar produto: " + e.getMessage());
        }
        return produto;
    }

    public static void main(String[] args) {
        ProdutoDAO dao = new ProdutoDAO();
        dao.testarConexao();
    }
}
