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
@WebServlet(name = "DarLikeServlet", urlPatterns = {"/DarLikeServlet"})
public class DarLikeServlet extends HttpServlet {

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
            out.println("<title>Servlet DarLikeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DarLikeServlet at " + request.getContextPath() + "</h1>");
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
        Connection connection = DatabaseConnection.getConnection();
        
        if (connection != null){
            try{
                HttpSession session = request.getSession(false);

                String idUsuario = (String) request.getParameter("id");

                String sql = "select idUsuarioDestino from likes where idUsuarioOrigen = '" + session.getAttribute("correo") + "'";
                  
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                    
                boolean encontrado = false;
                while(rs.next()){
                    if(rs.getString("idUsuarioDestino").equals(idUsuario)){
                        String destino = rs.getString("idUsuarioDestino");
                        encontrado = true;
                    }
                }  
                
                if(encontrado){
                    try{
                        String sql2 = "delete from likes where idUsuarioOrigen = '"+ session.getAttribute("correo") +"' and idUsuarioDestino = '"+ idUsuario +"'";
                        
                        Statement stmt2 = connection.createStatement();
                        int x = stmt2.executeUpdate(sql2);
                    }
                    catch(SQLException e){
                        System.out.println("Hola1");
                        System.out.println("Error al realizar la consulta a la base de datos.");
                    }
                }
                else{
                    try{
                        String sql2 = "insert into likes(idUsuarioOrigen, idUsuarioDestino) values('"+session.getAttribute("correo")+"', '"+idUsuario+"')";
                        
                        Statement stmt2 = connection.createStatement();
                        int x = stmt2.executeUpdate(sql2);
                    }
                    catch(SQLException e){
                        System.out.println("Hola2");
                        System.out.println("Error al realizar la consulta a la base de datos.");
                    }  
                }
                
            }  
            catch (SQLException e) {
                System.out.println("Hola3");
                System.out.println("Error al realizar la consulta a la base de datos.");
            }
        } else {
            System.out.println("No se pudo conectar a la base de datos.");
        }
        
        request.getRequestDispatcher("BusquedaLogueado.jsp").forward(request, response);
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
