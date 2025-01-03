<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="packControl.DatabaseConnection"%>
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
                <a href="miPerfil.jsp">Ver mi perfil</a>
                <a href="BusquedaLogueado.jsp">Busqueda General</a>
                <a href="BusquedaPorAficiones.jsp">Busqueda por Aficiones</a>
                <a href="VerMisLikes.jsp">Ver mis Likes</a>
                <a href="index.jsp">Log out</a>
            </nav>
        </header>

        <div class="content-resultNoLogueado">
            <%
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
                String sql = "Select * from likes inner join usuario on likes.idUsuarioDestino=usuario.email where idUsuarioOrigen = '" + correo + "'";

                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {

                    System.out.println(rs.getString("idUsuarioDestino"));
                    nombresResultado.add(rs.getString("nombre"));
                    edadesResultado.add(rs.getString("edad"));
                    fotosResultado.add(rs.getString("foto"));
                    sexosResultado.add(rs.getString("genero"));
                    ciudadesResultado.add(rs.getString("ciudad"));

                    String sql2 = "Select * from likes where idUsuarioDestino = '"+correo+"'";
                    
                    Statement stmt2 = connection.createStatement();
                    ResultSet rs2 = stmt2.executeQuery(sql2);

                    String correoResultado = rs.getNString("idUsuarioDestino");
                    Boolean comprobado = false;
                    while (rs2.next() && !comprobado){
                        if(correoResultado.equals(rs2.getString("idUsuarioOrigen"))){
                            System.out.println("true");
                            matchesResultado.add(true);
                            comprobado = true;
                        }else{
                            System.out.println("false");
                        }
                    }
                    if(!comprobado){
                        matchesResultado.add(false);
                    }
                    System.out.println(matchesResultado);
                }

            } catch (SQLException ex) {
            }
        }

                Boolean match = false;

                for (int i = 0; i < nombresResultado.size(); i++) {
                    if (matchesResultado.get(i)) {
                        match = true;
                    } else {
                        match = false;
                    }%>
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
                            <div id="hijo<%= i + 1%>-ciudad"><%if(match){%><%= "Match: Si"%><%}else {%><%= "Match: No"%><%}%></div>
                        </div>
                    </div>
                </div>
            </div>
            <%   }
            %>


            <div class="cambioPagina-container">
                <button class="btn-siguientePagina" id="btn-siguientePagina">Siguiente Pagina</button>
            </div>
    </body>
</html>