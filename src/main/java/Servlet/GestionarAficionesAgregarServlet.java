/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.DatabaseConnection;

/**
 *
 * @author Yeray
 */
@WebServlet(name = "GestionarAficionesAgregarServlet", urlPatterns = {"/GestionarAficionesAgregarServlet"})
public class GestionarAficionesAgregarServlet extends HttpServlet {

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
            out.println("<title>Servlet GestionarAficionesAgregarServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GestionarAficionesAgregarServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String correo = (String) session.getAttribute("correo");
        
        Connection connection = DatabaseConnection.getConnection();

        if (connection != null) {
            String sql = "select aficion from aficion where aficion not in (select aficion from usuario_aficion inner join aficion on usuario_aficion.idAficionUsuario = aficion.idAficion where emailUsuario = '" + correo + "')";
            
            try{
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                
                ArrayList<String> aficionesUsuario = new ArrayList<>();
                aficionesUsuario.add("Agregar");
                
                while(rs.next()){
                    aficionesUsuario.add(rs.getString("aficion"));
                }
                
                request.setAttribute("VerAficiones", aficionesUsuario);
                
            }
            catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        else {
            System.out.println("No se pudo conectar a la base de datos.");
        }
        
        request.getRequestDispatcher("gestionarAficiones.jsp").forward(request, response);
        
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
        String[] aficionesSeleccionadas = request.getParameterValues("aficionesSeleccionadas");
        
        HttpSession session = request.getSession();
        String correo = (String)session.getAttribute("correo");
        
        Connection connection = DatabaseConnection.getConnection();

        if (connection != null) {
            try {
                Statement stmt = connection.createStatement();
                for(int i = 0; i<aficionesSeleccionadas.length; i++){
                    String sql = "insert into usuario_aficion values ('" + correo + "', (select idAficion from aficion where aficion = '" + aficionesSeleccionadas[i] + "'))";
                    int x = stmt.executeUpdate(sql);
                }
                
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error al realizar la consulta a la base de datos.");
            }
        } else {
            System.out.println("No se pudo conectar a la base de datos.");
        }
        
        request.setAttribute("VerAficiones", null);
        request.getRequestDispatcher("gestionarAficiones.jsp").forward(request, response);
        
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
    }// </editor-fold>

}
