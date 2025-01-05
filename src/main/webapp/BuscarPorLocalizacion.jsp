<%-- 
    Document   : masInfo
    Created on : 3 ene 2025, 18:52:31
    Author     : diazn
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
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
            </h1><p>
                <%!
                private Connection con;
                private Statement st, st2;
                private ResultSet rs, rs2;
                private String nombre;
                private int edad;
                private double latitud,longitud, latitudUsuAct, longitudUsuAct;
                private List<Double> listaLatitudes = new ArrayList<>();
                private List<Double> listaLongitudes = new ArrayList<>();


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
            <div class="busquedaLocalizacion">
                    <div id="map"></div> <br>

            <%
                String idUsuario = (String) session.getAttribute("correo");
                System.out.println("El usuario actual:" + idUsuario);
                if(idUsuario != null && !idUsuario.trim().isEmpty()){

                    try {
                        st = con.createStatement();
                      
                        String sql="SELECT * FROM usuario WHERE email = '" + idUsuario + "'";
                        rs = st.executeQuery(sql);
                        if (rs.next()) {
                            latitudUsuAct= rs.getDouble("latitud");
                            longitudUsuAct=rs.getDouble("longitud");
                        } else {
            %>
                            <p>No se encontró ningún usuario con este ID.</p>
            <%
                        }
                        listaLatitudes.clear();
                        listaLongitudes.clear();
                        st2  = con.createStatement();
                        
                        String sql2 = "SELECT * FROM usuario WHERE email != '" + idUsuario + "'";
                        rs2 = st2.executeQuery(sql2);
                        while(rs2.next()) {
                            latitud = rs2.getDouble("latitud");
                            listaLatitudes.add(latitud);
                            longitud = rs2.getDouble("longitud");
                            listaLongitudes.add(longitud);
                            nombre = rs2.getString("nombre");
                            edad = rs2.getInt("edad");
                        }
            %>
                            <script>
                                var latitudUsuAct = <%=latitudUsuAct%>;
                                var longitudUsuAct = <%=longitudUsuAct%>;
                                var otrasLatitudes = <%= listaLatitudes.toString() %>;
                                var otrasLongitudes = <%= listaLongitudes.toString() %>;
                                function initMap() {
                                    const center = {lat: latitudUsuAct, lng: longitudUsuAct};
                                    const map = new google.maps.Map(document.getElementById("map"), {
                                        zoom: 12,
                                        center: center,
                                    });
                                    var marker = new google.maps.Marker({
                                        position: center,
                                        map: map,
                                        icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
                                        title: "Mi ubicación",
                                    });

                                    for (let i = 0; i < otrasLatitudes.length; i++) {
                                        const markerPosition = { 
                                            lat: parseFloat(otrasLatitudes[i]), 
                                            lng: parseFloat(otrasLongitudes[i]) 
                                        };
                                        new google.maps.Marker({
                                            position: markerPosition,
                                            map: map,
                                            icon: "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
                                            title: "Otro usuario", // Aquí podrías incluir más información como el nombre
                                        });
        }
                                    }
                            </script>
            <%
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    }
                } else {
            %>
                <p>ID de usuario no especificado.</p>
            <%
                }
            %>
            <button onclick="history.back()">Volver</button>
            </div>
            
    </body>
</html>
