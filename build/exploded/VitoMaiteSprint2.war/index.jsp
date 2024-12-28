<%-- 
    Document   : index
    Created on : 28-dic-2024, 7:42:11
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" type="text/css" href="Styles.css" >
        <title>VitoMaite</title>
    </head>

    <body>

        <header>
            <a href="#" class="logo">
                <img src="Img/logoCorazon.png" width="50" height="50" alt="Logo VitoMaite">
                <p class="logoTexto">VitoMaite</p>
            </a>
            <nav>
                <a href="BusquedaNoLogueado.jsp">Buscar Pareja</a>
                <a href="">Registrarse</a>
            </nav>
        </header>

        <div class="content">

            <div class="form-container">
                <form action="indexServlet" method="POST">
                    <h1>Iniciar Sesión</h1>

                    <div class="form-container--usuario">
                        <label>Correo</label>
                        <input type="text" id="correo" name="correo" placeholder="Ingresa tu correo electronico" required>
                    </div>

                    <div class="form-container--contrasena">
                        <label>Contraseña</label>
                        <input type="password" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required>
                    </div>

                    <button class="btn" id="boton-inicioSesion" type="submit">Iniciar Sesión</button>
                </form>
            </div>

        </div>

    </body>
</html>
