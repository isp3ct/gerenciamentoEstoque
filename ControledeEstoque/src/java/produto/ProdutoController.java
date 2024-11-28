package produto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ProdutoController")

public class ProdutoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProdutoDAO produtoDAO;

    public ProdutoController() {
        this.produtoDAO = new ProdutoDAO();
    }

    @Override

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");

    if ("edit".equals(action)) {
        int id = Integer.parseInt(request.getParameter("id"));
        Produto produto = produtoDAO.getProdutoById(id);
        if (produto != null) {
            request.setAttribute("produto", produto);
            request.getRequestDispatcher("editarProduto.jsp").forward(request, response);
        } else {
            response.sendRedirect("produtos.jsp");
        }
    } else if ("delete".equals(action)) {
        int id = Integer.parseInt(request.getParameter("id"));
        produtoDAO.deleteProduto(id);
        response.sendRedirect("ProdutoController?action=listar");
    } else if ("listar".equals(action)) {
        // Chamar o método para buscar a lista de produtos
        List<Produto> produtos = produtoDAO.getProdutos();

        // Adicionar a lista de produtos como atributo da requisição
        request.setAttribute("produtos", produtos);

        // Encaminhar para a página JSP
        request.getRequestDispatcher("produtos.jsp").forward(request, response);
    }
}





    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            String nome = request.getParameter("nome");
            double preco = Double.parseDouble(request.getParameter("preco"));
            Produto produto = new Produto(0, nome, preco);
            produtoDAO.insertProduto(produto);
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            double preco = Double.parseDouble(request.getParameter("preco"));
            Produto produto = new Produto(id, nome, preco);
            produtoDAO.updateProduto(produto);
        }

        response.sendRedirect("produtos.jsp");
    }
}
