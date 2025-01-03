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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yeray
 */
@WebServlet(name = "BusquedaNoLogueadoServlet", urlPatterns = {"/BusquedaNoLogueadoServlet"})
public class BusquedaNoLogueadoServlet extends HttpServlet {

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
            out.println("<title>Servlet BusquedaNoLogueadoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BusquedaNoLogueadoServlet at " + request.getContextPath() + "</h1>");
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
        String sexo = request.getParameter("sexo");  //Integer.parseInt(request.getParameter("edadMin"));
        String edadMin = request.getParameter("edadMin");
        String edadMax = request.getParameter("edadMax");
        String ciudad = request.getParameter("ciudad");
        HttpSession session = request.getSession(false);
        
        System.out.println(edadMin);
            
        if(sexo != null && edadMin != null && edadMax != null && ciudad != null && Integer.parseInt(edadMin) < Integer.parseInt(edadMax)){
            
            Connection connection = DatabaseConnection.getConnection();
        
            if (connection != null){
                
                String sql = "select * from usuario where genero = '" + sexo + "' and edad >= " + edadMin + " and edad <= " + edadMax + " and ciudad = '" + ciudad + "' and email != '" + session.getAttribute("correo") + "'";
            
                System.out.println(sexo);
                System.out.println(edadMin);
                System.out.println(edadMax);
                System.out.println(ciudad);
                
                
                if(sexo.equals("Ambos")){
                    sql = "select * from usuario where edad >= " + edadMin + " and edad <= " + edadMax + " and ciudad = '" + ciudad + "' and email != '" + session.getAttribute("correo") + "'";
                }
                
                try {
                    
                    Statement stmt = connection.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    
                    ArrayList<String> correoResultado = new ArrayList<>();
                    ArrayList<String> nombreResultado = new ArrayList<>();
                    ArrayList<String> sexoResultado = new ArrayList<>();
                    ArrayList<Integer> edadResultado = new ArrayList<>();
                    ArrayList<String> ciudadResultado = new ArrayList<>();
                    ArrayList<String> fotoResultado = new ArrayList<>();
                    
                    while(rs.next()){
                        correoResultado.add(rs.getString("email"));
                        nombreResultado.add(rs.getString("nombre"));
                        sexoResultado.add(rs.getString("genero"));
                        edadResultado.add(rs.getInt("edad"));
                        ciudadResultado.add(rs.getString("ciudad"));
                        fotoResultado.add(rs.getString("foto"));   
                    }
                    
                    request.setAttribute("correos", correoResultado);
                    request.setAttribute("nombres", nombreResultado);
                    request.setAttribute("sexos", sexoResultado);
                    request.setAttribute("edades", edadResultado);
                    request.setAttribute("ciudades", ciudadResultado);
                    request.setAttribute("fotos", fotoResultado);
                    
                    
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            else {
                System.out.println("No se pudo conectar a la base de datos.");
            }   
            
            request.getRequestDispatcher("ResultadoBusquedaNoLogueado.jsp").forward(request, response);
        }
        
        System.out.println("Error");
        request.getRequestDispatcher("BusquedaNoLogueado.jsp").forward(request, response);
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
