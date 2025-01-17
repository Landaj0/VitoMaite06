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
@WebServlet(name = "ModificarPerfilServlet", urlPatterns = {"/ModificarPerfilServletXXX"})
public class ModificarPerfilServlet extends HttpServlet {

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
            out.println("<title>Servlet ModificarPerfilServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarPerfilServlet at " + request.getContextPath() + "</h1>");
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

        String foto = request.getParameter("foto");
        String ciudad = request.getParameter("ciudad");
        String edad = request.getParameter("edad");

        System.out.println(foto);

        Connection connection = DatabaseConnection.getConnection();

        if (connection != null) {

            HttpSession sesion = request.getSession(false);
            String correo = (String) sesion.getAttribute("correo");
            String nombre = "";
            String nuevaCiudad = "";
            String nuevaEdad = "";
            String genero = "";
            String nuevaFoto = "";

            try {
                
                if(foto.length() > 0){
                    String sql1 = "update usuario set foto = '" + foto + "' where email = '" + correo + "'";
                    Statement stmt1 = connection.createStatement();
                    int x = stmt1.executeUpdate(sql1);
                }
                
                if(ciudad.length() > 0){
                    String sql2 = "update usuario set ciudad = '" + ciudad + "' where email = '" + correo + "'";
                    Statement stmt2 = connection.createStatement();
                    int y = stmt2.executeUpdate(sql2);
                }
                
                if(edad.length() > 0){
                    String sql3 = "update usuario set edad = " + edad + " where email = '" + correo + "'";
                    Statement stmt3 = connection.createStatement();
                    int z = stmt3.executeUpdate(sql3);
                }
                
                String sql = "Select * from usuario where email = '" + correo + "'";

                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                
                while (rs.next()) {
                    nombre = rs.getString("nombre");
                    nuevaCiudad = rs.getString("ciudad");
                    nuevaEdad = rs.getString("edad");
                    genero = rs.getString("genero");
                    nuevaFoto = rs.getString("foto");
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("miCiudad", nuevaCiudad);
                    session.setAttribute("fotoPerfil", nuevaFoto);
                    session.setAttribute("miEdad", nuevaEdad);
                }
            } 
            catch (SQLException ex) {
                ex.printStackTrace();
            }

            request.setAttribute("nombre", nombre);
            request.setAttribute("email", correo);
            request.setAttribute("ciudad", nuevaCiudad);
            request.setAttribute("edad", nuevaEdad);
            request.setAttribute("genero", genero);
            request.setAttribute("foto", nuevaFoto);
        } else {
            System.out.println("No se pudo conectar a la base de datos.");
        }

        request.getRequestDispatcher("miPerfil.jsp").forward(request, response);

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
