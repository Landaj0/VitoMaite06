<%-- 
    Document   : BusquedaNoLogueado
    Created on : 28-dic-2024, 7:48:01
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
                <a href="index.jsp">Log in</a>
            </nav>
        </header>

        <div class="content">
            <div class="form-container">
                <h1>Buscar Personas</h1>
                <form action="BusquedaNoLogueadoServlet" method="POST">
                    <div class="form-container--sexo">
                        <h4>Eliga el sexo</h4>
                        <select id="sexo" name="sexo">
                            <option value="" disabled selected>Seleccine una opci�n</option>
                            <option value="Mujer">Mujer</option>
                            <option value="Hombre">Hombre</option>
                            <option value="Ambos">Ambos</option>
                        </select>
                    </div>

                    <div class="form-container--edad">
                        <h4>Eliga la edad</h4>
                        <div class="edad-container">
                            <input name="edadMin" id="edad-min" type="number" min="18" placeholder="M�nima">
                            <p>-</p>
                            <input name="edadMax" id="edad-max" type="number" min="18" placeholder="M�xima">
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

                    <button type="submit" class="btn" id="boton-busquedaNoLogueado">Buscar</button>
                </form>
            </div>
        </div>

    </body>

</html>
