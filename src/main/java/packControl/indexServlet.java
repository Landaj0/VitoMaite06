/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package packControl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USUARIO
 */
@WebServlet(name = "indexServlet", urlPatterns = {"/indexServlet"})
public class indexServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet indexServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet indexServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        System.out.println("El correo introducido es: " + correo);
        System.out.println("La contraseña introducida es: " + contrasena);

        Connection connection = DatabaseConnection.getConnection();

        if (connection != null) {
            try {
                String sql = "SELECT * FROM usuario WHERE email = '" + correo + "' AND contraseña = '" + contrasena + "'";

                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                System.out.println(rs);

                if (rs.next()) {
                    System.out.println("El usuario existe");

                    HttpSession session = request.getSession();
                    session.setAttribute("correo", correo);
                    request.setAttribute("saludo", "Hola " + rs.getString("nombre"));
                    request.setAttribute("fotoPerfil", rs.getString("foto"));
                    
                    request.getRequestDispatcher("BusquedaLogueado.jsp").forward(request, response); 
                    
                } else {
                    System.out.println("Usuario o contraseña INCORRECTO");
                    
                    response.sendRedirect("index.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error al realizar la consulta a la base de datos.");
            }
        } else {
            System.out.println("No se pudo conectar a la base de datos.");
        }

        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold

}
