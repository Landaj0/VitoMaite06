<%-- 
    Document   : miPerfil
    Created on : 02-ene-2025, 21:17:54
    Author     : Yeray
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mi Perfil</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Styles.css">
    </head>
    <body>
        <header>
            <a href="#" class="logo">
                <img src="Img/logoCorazon.png" width="50" height="50" alt="Logo VitoMaite">
                <p class="logoTexto">VitoMaite</p>
            </a>
            <nav>
                <a href="modificarPerfil.jsp">Modificar Perfil</a>
                <a href="gestionarAficiones.jsp">Gestionar Aficiones</a>
                <a href="BusquedaLogueado.jsp">Busqueda General</a>
                <a href="VerMisLikes.jsp">Ver mis Likes</a>
                <a href="Recomendaciones.jsp">Compatibles</a>
                <a href="LogOutServlet">Log out</a>
            </nav>
        </header>
        
        <div class="container">
                <h1>Mi Perfil</h1>
                <div class="misDatos-container">
                    <div id="misDatos"></div>
                    <span>Nombre:</span><%= request.getAttribute("nombre") %><span id="nombre"></span><br>
                        <span>Email:</span><%= request.getAttribute("email") %><span id="email"></span><br>
                        <span>Ciudad:</span><%= request.getAttribute("ciudad") %><span id="ciudad"></span><br>
                        <span>Edad:</span><%= request.getAttribute("edad") %><span id="edad"></span><br>
                        <span>Género:</span><%= request.getAttribute("genero") %><span id="genero"></span>
                    </div>
                    <img id="imagen-perfil" src="Img/<%= request.getAttribute("foto") %>" alt="foto de perfil">
                </div>
                

        <script src="../js/miPerfil.js"></script>
    </body>
</html>
