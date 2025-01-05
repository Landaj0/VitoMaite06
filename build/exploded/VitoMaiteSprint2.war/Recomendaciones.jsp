<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="utils.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<html>
    <head>
        <title>Resultados busqueda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/Styles.css">
    </head>
    <body>
        <header class="header-resultNoLogueado">
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
                <a href="index.jsp">Log out</a>
            </nav>
        </header>

        <div class="content-resultNoLogueado">
            <%
                ArrayList<String> correosResultado = new ArrayList<>();
                ArrayList<String> nombresResultado = new ArrayList<>();
                ArrayList<String> edadesResultado = new ArrayList<>();
                ArrayList<String> fotosResultado = new ArrayList<>();
                ArrayList<String> sexosResultado = new ArrayList<>();
                ArrayList<String> ciudadesResultado = new ArrayList<>();
                ArrayList<Boolean> matchesResultado = new ArrayList<>();
                Connection connection = DatabaseConnection.getConnection();

                if (connection != null) {

                    String correo = (String) session.getAttribute("correo");

                    try {
                        String sql = "Select * from usuario where email != '" + correo + "'";

                        Statement stmt = connection.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int i = 0;
                            
                            String miCiudad = (String) session.getAttribute("miCiudad");
                            Integer miEdad = (Integer) session.getAttribute("miEdad");
                            String miGenero = (String) session.getAttribute("miGenero");
                            Integer diferenciaEdad = miEdad-rs.getInt("edad");
                            
                            if (rs.getString("ciudad").equals(miCiudad)){
                                i += 30;
                            }else{
                                i += 10;
                            }
                            
                            if (rs.getString("genero").equals(miGenero)){
                                i += 10;
                            }else{
                                i += 40;
                            }
                            
                            if (diferenciaEdad < 2 && diferenciaEdad > 2){
                                i += 50;
                            }else if (diferenciaEdad < 5 && diferenciaEdad > 5){
                                i += 35;
                            } else if (diferenciaEdad < 8 && diferenciaEdad > 8){
                                i += 25;
                            } else if (diferenciaEdad < 11 && diferenciaEdad > 11){
                                i += 15;
                            } else if (diferenciaEdad < 15 && diferenciaEdad > 15){
                                i += 5;
                            }
                            
                            if (i>50){
                                correosResultado.add(rs.getString("email"));
                                nombresResultado.add(rs.getString("nombre"));
                                fotosResultado.add(rs.getString("foto"));
                                sexosResultado.add(rs.getString("genero"));
                                edadesResultado.add(rs.getString("edad"));
                                ciudadesResultado.add(rs.getString("ciudad"));
                            }
                        }

                    } catch (SQLException ex) {
                        System.out.println("Error");
                    }
                }for (int i = 0; i < nombresResultado.size(); i++) {
                    %>
            <div class="content-resultNoLogueado--hijo" id="hijo-1">
                <div class="informacionPersona-container">
                    <div class="informacionPersona-foto">
                        <img id="hijo<%= i + 1%>-foto" src="Img/<%= fotosResultado.get(i)%>" alt="foto de perfil">
                    </div>

                    <div class="informacionPersona-datos">
                        <div class="datos-container">
                            <div id="hijo<%= i + 1%>-nombre"><%= nombresResultado.get(i)%></div>
                            <div id="hijo<%= i + 1%>-sexo"><%= sexosResultado.get(i)%></div>
                            <div id="hijo<%= i + 1%>-edad"><%= edadesResultado.get(i)%></div>
                            <div id="hijo<%= i + 1%>-ciudad"><%= ciudadesResultado.get(i)%></div>
                            <a href="MasInfo?id=<%= correosResultado.get(i) %>" id=<%= correosResultado.get(i) %>>Ver detalles</a>
                        </div>
                    </div>
                </div>
            </div>
            <%   }
            %>
    </body>
</html>