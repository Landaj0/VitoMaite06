<%-- 
    Document   : BusquedaLogueado
    Created on : 29-dic-2024, 20:02:21
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>VitoMaite</title>
    </head>
    <body>

        <header>
            <a href="#" class="logo">
                <img src="Img/logoCorazon.png" width="50" height="50" alt="Logo VitoMaite">
                <link rel="stylesheet" type="text/css" href="Styles.css" >
                <p class="logoTexto">VitoMaite</p>
            </a>
            <span id="saludoUsuario" class="saludo"><%= session.getAttribute("saludo") %></span>
            <img id="imagen-perfil" src="Img/<%= session.getAttribute("fotoPerfil") %>" alt="foto de perfil">
            <nav>
                <a href="MiPerfilServlet">Ver mi perfil</a>
                <a href="BusquedaPorAficiones.jsp">Busqueda por Aficiones</a>
                <a href="VerMisLikes.jsp">Ver mis Likes</a>
                <a href="BusquedaPorLocalizacion.jsp">Por Localización</a>
                <a href="Recomendaciones.jsp">Compatibles</a>
                <a href="LogOutServlet">Log out</a>
            </nav>
        </header>

        <div class="content">
            <div class="form-container">
                <h1>Buscar Personas</h1>
                <form action="BusquedaLogueadoServlet" method="POST">
                    <div class="form-container--sexo">
                        <h4>Eliga el sexo</h4>
                        <select id="sexo" name="sexo">
                            <option value="" disabled selected>Seleccine una opción</option>
                            <option value="Mujer">Mujer</option>
                            <option value="Hombre">Hombre</option>
                            <option value="Ambos">Ambos</option>
                        </select>
                    </div>

                    <div class="form-container--edad">
                        <h4>Eliga la edad</h4>
                        <div class="edad-container">
                            <input id="edad-min" type="number" min="18" placeholder="Mínima" name="edadMin">
                            <p>-</p>
                            <input id="edad-max" type="number" min="18" placeholder="Máxima" name="edadMax">
                        </div>
                    </div>

                    <div class="form-container--ciudad">
                        <h4>Eliga la ciudad</h4>
                        <select id="ciudad" name="ciudad">
                            <option value="" disabled selected>Seleccine una opción</option>
                            <option value="Bilbao">Bilbao</option>
                            <option value="Vitoria-Gasteiz">Vitoria</option>
                            <option value="Donosti">San Sebastian</option>
                        </select>
                    </div>

                    <button type="submit" class="btn" id="boton-busquedaLogueado">Buscar</button>
                </form>
            </div>
        </div>
    </body>
</html>
