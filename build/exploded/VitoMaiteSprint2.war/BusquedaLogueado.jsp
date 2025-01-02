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
            <span id="saludoUsuario" class="saludo"><%= request.getAttribute("saludo") %></span>
            <img id="imagen-perfil" src="Img/<%= request.getAttribute("fotoPerfil") %>" alt="foto de perfil">
            <nav>
                <a href="miPerfil.html">Ver mi perfil</a>
                <a href="BusquedaPorAficiones.html">Busqueda por Aficiones</a>
                <a href="VerMisLikes.html">Ver mis Likes</a>
                <a href="BusquedaPorLocalizacion.html">Por Localizaci�n</a>
                <a href="index.html">Log out</a>
            </nav>
        </header>

        <div class="content">
            <div class="form-container">
                <h1>Buscar Personas</h1>
                <form action="BusquedaLogueadoServlet" method="POST">
                    <div class="form-container--sexo">
                        <h4>Eliga el sexo</h4>
                        <select id="sexo" name="sexo">
                            <option value="" disabled selected>Seleccine una opci�n</option>
                            <option value="Mujer">Soy hombre y busco mujer</option>
                            <option value="Hombre">Soy hombre y busco hombre</option>
                            <option value="Hombre">Soy mujer y busco hombre</option>
                            <option value="Mujer">Soy mujer y busco mujer</option>
                            <option value="Ambos">Soy hombre y busco ambos</option>
                            <option value="Ambos">Soy mujer y busco ambos</option>
                        </select>
                    </div>

                    <div class="form-container--edad">
                        <h4>Eliga la edad</h4>
                        <div class="edad-container">
                            <input id="edad-min" type="number" min="18" placeholder="M�nima" name="edadMin">
                            <p>-</p>
                            <input id="edad-max" type="number" min="18" placeholder="M�xima" name="edadMax">
                        </div>
                    </div>

                    <div class="form-container--ciudad">
                        <h4>Eliga la ciudad</h4>
                        <select id="ciudad" name="ciudad">
                            <option value="" disabled selected>Seleccine una opci�n</option>
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
