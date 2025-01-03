<%-- 
    Document   : modificarPerfil
    Created on : 02-ene-2025, 21:41:32
    Author     : Yeray
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar Perfil</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="Styles.css" >
    </head>
    <body>
        <header>
            <a href="#" class="logo">
                <img src="../img/logoCorazon.png" width="50" height="50" alt="Logo VitoMaite">
                <p class="logoTexto">VitoMaite</p>
            </a>
            <span id="saludoUsuario" class="saludo"></span>
            <nav>
                <a href="miPerfil.html">Mi Perfil</a>
                <a href="BusquedaLogueado.html">Busqueda General</a>
                <a href="VerMisLikes.html">Ver mis Likes</a>
                <a href="index.html">Log out</a>
            </nav>
        </header>
        <div class="container">
        <h1>Modificar Perfil</h1>
        <form id="perfilForm" action="ModificarPerfilServlet" method="POST">
            <label for="imagen">Foto de Perfil:</label>
            <div id="dropArea">
                <p>Arrastra una foto aquí o haz clic para subir</p>
                <input type="file" id="imagen" accept="image/*" name="foto">
            </div>
            <img id="preview" src="" alt="Previsualización" style="display:none; width: 150px; height: 150px; border-radius: 50%; margin-top: 10px;">
            <br><br>
            <label for="ciudad">Ciudad:</label>
            <br>
            <input type="text" id="ciudad" placeholder="Escribe tu ciudad" name="ciudad">
            <br><br>
            <button id="button" type="submit">Guardar Cambios </button>
        </form>
        </div>
        <script src="../js/modificarPerfil.js"></script>
    </body>
</html>
