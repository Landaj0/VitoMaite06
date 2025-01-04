<%-- 
    Document   : masInfo
    Created on : 3 ene 2025, 18:52:31
    Author     : diazn
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="utils.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mas información</title>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2g8VwDziiyQXmv7gzzUA1QGNwgO-3NSI&callback=initMap" async defer></script>
        <link rel="stylesheet" href="Styles.css">
    </head>
    <body>
        <header class="header-masInfo">
            <a href="#" class="logo">
                <img src="Img/logoCorazon.png" width="50" height="50" alt="Logo VitoMaite">
                <link rel="stylesheet" type="text/css" href="Styles.css" >
                <p class="logoTexto">VitoMaite</p>
            </a>
            <nav>
                <a href="miPerfil.jsp">Ver mi perfil</a>
                <a href="BusquedaLogueado.jsp">Busqueda General</a>
                <a href="BusquedaPorAficiones.jsp">Busqueda por Aficiones</a>
                <a href="VerMisLikes.jsp">Ver mis Likes</a>
                <a href="Recomendaciones.jsp">Compatibles</a>
                <a href="index.jsp">Log out</a>
            </nav>
            <%!
                private Connection con;
                private Statement st;
                private ResultSet rs;
                private String nombre, ciudad, genero, foto;
                private int edad;
                private double latitud,longitud;

                public void jspInit(){
                con=DatabaseConnection.getConnection();
                }

                %>
        </header>
        <%
                if (request.getParameter("error") != null) {
        %>

        <h2> <%= request.getParameter("error")%> </h2>
        <%
            }
        %>
        <main>
            
        </main>
         <a href="ResultadoBusquedaLogueado.jsp">Volver </a><p>
    </body>
</html>
