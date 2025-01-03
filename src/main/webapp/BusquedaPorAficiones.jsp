<%-- 
    Document   : BusquedaPorAficiones
    Created on : 02-ene-2025, 20:31:39
    Author     : Yeray
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar Pareja</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="Styles.css">
    </head>
    
    <body>
        <header>
            <a href="#" class="logo">
                <img src="Img/logoCorazon.png" width="50" height="50" alt="Logo VitoMaite">
                <p class="logoTexto">VitoMaite</p>
            </a>
            <span id="saludoUsuario" class="saludo"><%= session.getAttribute("saludo") %></span>
            <img id="imagen-perfil" src="Img/<%= session.getAttribute("fotoPerfil") %>" alt="foto de perfil">
            <nav>
                <a href="MiPerfilServlet">Ver mi perfil</a>
                <a href="BusquedaLogueado.jsp">Busqueda General</a>
                <a href="VerMisLikes.jsp">Ver mis Likes</a>
                <a href="LogOutServlet">Log out</a>
            </nav>
        </header>
        
        <div class="content">
            <div class="form-container">
            <h1>Busqueda por aficiones</h1>
            <form action="BusquedaPorAficiones" method="POST">
                <div class="form-container--aficiones">
                    <h4>Eliga las aficiones</h4>
                    <div class="checkbox-container"><input type="checkbox" value="Leer" name="aficiones">Leer<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Cocinar" name="aficiones">Cocinar<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Pintar" name="aficiones">Pintar<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Deporte" name="aficiones">Deporte<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Jardineria" name="aficiones">Jardineria<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Escribir" name="aficiones">Escribir<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Viajar" name="aficiones">Viajar<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Ver peliculas" name="aficiones">Ver peliculas<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Bailar" name="aficiones">Bailar<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Pescar" name="aficiones">Pescar<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Escuchar Musica" name="aficiones">Escuchar musica<br></div>
                    <div class="checkbox-container"><input type="checkbox" value="Tocar un instrumento" name="aficiones">Tocar un instrumento<br></div>
                </div>
                
                <button id="boton-busquedaAficiones" type="submit" class="btn boton-aficiones">Buscar</button>
            </form>
        </div>
        </div>
        
        <script src="../js/busquedaLogueado.js"></script>
        <script src="../js/busquedaPorAficiones.js"></script>
    </body>
</html>
