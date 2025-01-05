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
                <a href="MiPerfilServlet">Ver mi perfil</a>
                <a href="BusquedaLogueado.jsp">Busqueda General</a>
                <a href="BusquedaPorAficiones.jsp">Busqueda por Aficiones</a>
                <a href="VerMisLikes.jsp">Ver mis Likes</a>
                <a href="Recomendaciones.jsp">Compatibles</a>
                <a href="index.jsp">Log out</a>
            </nav>
            </h1><p>
                <%!
                private Connection con;
                private Statement st, st2, st3;
                private ResultSet rs, rs2, rs3, rs4;
                private String nombre, genero, ciudad, foto;
                private int edad;
                private double latitud,longitud;
                private List<String> listaAficiones = new ArrayList<>();


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
            <div class="content-detallesUsu">
            <h1>Detalles del Usuario</h1>
            <%
                String idUsuario = (String) request.getAttribute("idUsuario");
                if(idUsuario != null && !idUsuario.trim().isEmpty()){

                    try {
                    
                        st = con.createStatement();
                      
                        String sql="SELECT * FROM usuario WHERE email = '" + idUsuario + "'";
                        
                        rs = st.executeQuery(sql);
                        if (rs.next()) {
                            nombre = rs.getString("nombre");
                            genero = rs.getString("genero");
                            edad = rs.getInt("edad");
                            ciudad = rs.getString("ciudad"); 
                            latitud= rs.getDouble("latitud");
                            longitud=rs.getDouble("longitud");
                            foto = rs.getString("foto");
                                                        
            %>
                            <p> <img src="Img/<%=foto%>" height="50" width="50"> <br> Nombre: <%=nombre%> <br> Genero: <%=genero%> <br> Edad: <%=edad%> <br> Ciudad: <%=ciudad%> <br>
            
            <%
                        } else {
            %>
                            <p>No se encontró ningún usuario con este ID.</p>
            <%
                        }
                        listaAficiones.clear();
                        st2 = con.createStatement();
                        String sql2 = "SELECT * FROM usuario_aficion inner join aficion on idAficionUsuario = idAficion WHERE emailUsuario = '" + idUsuario + "'";
                        
                        rs2 = st2.executeQuery(sql2);
                        while(rs2.next()) {
                            String aficion = rs2.getString("aficion");
                            listaAficiones.add(aficion);
                        }
            %>
                            <h2>Aficiones:</h2>
                            <ul>
            <% 
                        if (listaAficiones != null && !listaAficiones.isEmpty()) {
                            for (String aficion : listaAficiones) {
            %>
                                <li><%= aficion %></li>
            <% 
                            }
                        } else {
            %>
                            <p>No tiene aficiones registradas.</p>
            <% 
                        }   
            %>
                            </ul>
                            <br>
                            <h2>Localización:</h2>
                            <br>
                            <div id="map"></div> <br>
                            
            <%
                        rs3 = st.executeQuery(sql);
                        if (rs3.next()) {
                            latitud= rs3.getDouble("latitud");
                            longitud=rs3.getDouble("longitud");
            %>
                            <script>
                                var latitud = <%=latitud%>;
                                var longitud = <%=longitud%>;

                                function initMap() {
                                    // Crear un objeto LatLng para las coordenadas
                                    var location = { lat: latitud, lng: longitud };

                                    // Crear el mapa centrado en la ubicación
                                    var map = new google.maps.Map(document.getElementById("map"), {
                                        zoom: 12,  // Nivel de zoom
                                        center: location,  // Coordenadas para centrar
                                    });

                                    // Agregar un marcador en la ubicación
                                    var marker = new google.maps.Marker({
                                        position: location,
                                        map: map,
                                        title: "Ubicación del usuario",
                                    });
                                }
                            </script>
            <%
                        } else {
            %>
                            <p>No se encontró ningún usuario con este ID.</p>
            <%
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    }
                } else {
            %>
                <p>ID de usuario no especificado.</p>
            <%
                }
            %>
            <div class="cambioPagina-container">
                <a href="BusquedaLogueado.jsp" class="btn-cambioBusqueda marginDerecho">Volver</a>
                <a href="DarLikeServlet?id=<%= idUsuario %>" class="btn-cambioBusqueda marginIzquierdo" id="btn-cambioBusqueda"><% 
                    String query = "select idUsuarioDestino from likes where idUsuarioOrigen = '" + session.getAttribute("correo") + "'";
                    
                    System.out.println(session.getAttribute("correo"));
                    
                    st3 = con.createStatement();
                    rs4 = st3.executeQuery(query);
                    
                    boolean encontrado = false;
                    while(rs4.next()){
                        if(rs4.getString("idUsuarioDestino").equals(idUsuario)){
                            encontrado = true;
                        }
                    }
                    
                    if(encontrado){%>
                    Quitar Like
                    <%}
                    else{%>
                    Dar Like
                    <%}
                    %></a>
            </div>
            </div>
            
    </body>
</html>

