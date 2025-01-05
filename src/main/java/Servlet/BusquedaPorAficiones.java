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
@WebServlet(name = "BusquedaPorAficiones", urlPatterns = {"/BusquedaPorAficionesXXX"})
public class BusquedaPorAficiones extends HttpServlet {

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
            out.println("<title>Servlet BusquedaPorAficiones</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BusquedaPorAficiones at " + request.getContextPath() + "</h1>");
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
        
        String[] aficiones = request.getParameterValues("aficiones");
        HttpSession session = request.getSession(false);
        
        for (String aficion : aficiones) {
            System.out.println(aficion);
        }
            
        if(aficiones != null){
            
            Connection connection = DatabaseConnection.getConnection();
        
            if (connection != null){
                ArrayList<Integer> idAficiones = new ArrayList<>();
                
                String sql1;
                for(String aficion : aficiones){
                    sql1 = "select * from aficion where aficion = '" + aficion + "'";
                    
                    try {
                    
                        Statement stmt1 = connection.createStatement();
                        ResultSet rs1 = stmt1.executeQuery(sql1);
                    
                        while(rs1.next()){
                            idAficiones.add(rs1.getInt("idAficion"));
                        }
                    } 
                    catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                
                ArrayList<String> correosUsuarios = new ArrayList<>();
                ArrayList<String> nombresUsuarios = new ArrayList<>();
                ArrayList<String> sexosUsuarios = new ArrayList<>();
                ArrayList<String> edadesUsuarios = new ArrayList<>();
                ArrayList<String> ciudadesUsuarios = new ArrayList<>();
                ArrayList<String> fotosUsuarios = new ArrayList<>();
                
                for(int id : idAficiones){
                    String sql2 = "select distinct(emailUsuario) from usuario_aficion where idAficionUsuario = " + id +" and emailUsuario != '" + session.getAttribute("correo") + "'";
                    
                    try {
                    
                        Statement stmt2 = connection.createStatement();
                        ResultSet rs2 = stmt2.executeQuery(sql2);
                    
                        while(rs2.next()){
                            String result = rs2.getString("emailUsuario");
                            
                            boolean encontrado = false;
                            for(int i=0; i<correosUsuarios.size(); i++){
                                if(correosUsuarios.get(i).equals(result)){
                                    encontrado = true;
                                }
                            }
                            
                            if(!encontrado){
                                try {
                                    String sql3 = "select * from usuario where email = '" + result + "'";
                                    Statement stmt3 = connection.createStatement();
                                    ResultSet rs3 = stmt3.executeQuery(sql3);
                    
                                    while(rs3.next()){
                                        correosUsuarios.add(result);
                                        nombresUsuarios.add(rs3.getString("nombre"));
                                        sexosUsuarios.add(rs3.getString("genero"));
                                        edadesUsuarios.add(rs3.getString("edad"));
                                        ciudadesUsuarios.add(rs3.getString("ciudad"));
                                        fotosUsuarios.add(rs3.getString("foto"));
                                    }
                                } 
                                catch (SQLException ex) {
                                    ex.printStackTrace();
                                }
                            }
                            
                            request.setAttribute("correos", correosUsuarios);
                            request.setAttribute("nombres", nombresUsuarios);
                            request.setAttribute("sexos", sexosUsuarios);
                            request.setAttribute("edades", edadesUsuarios);
                            request.setAttribute("ciudades", ciudadesUsuarios);
                            request.setAttribute("fotos", fotosUsuarios);
                        }
                    } 
                    catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                
                request.setAttribute("correos", correosUsuarios);
            }
            else {
                System.out.println("No se pudo conectar a la base de datos.");
            }   
            
            request.getRequestDispatcher("ResultadoBusquedaPorAficiones.jsp").forward(request, response);
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
    }// </editor-fold>

}
