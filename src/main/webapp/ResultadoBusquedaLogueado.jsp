<%-- 
    Document   : ResultadoBusquedaLogueado
    Created on : 02-ene-2025, 16:47:10
    Author     : USUARIO
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Resultados busqueda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Styles.css">
    </head>
    
        <header class="header-resultNoLogueado">
            <a href="#" class="logo">
                <img src="../img/logoCorazon.png" width="50" height="50" alt="Logo VitoMaite">
                <p class="logoTexto">VitoMaite</p>
            </a>
            <span id="saludoUsuario" class="saludo"></span>
            <img id="imagen-perfil" src="" alt="foto de perfil">
            <nav>
                <a href="miPerfil.html">Ver mi perfil</a>
                <a href="BusquedaPorAficiones.html">Busqueda por Aficiones</a>
                <a href="VerMisLikes.html">Ver mis Likes</a>
                <a href="LogOutServlet">Log out</a>
            </nav>
        </header>
        <div class="content-resultNoLogueado">
        <% 
            ArrayList<String> correos = (ArrayList<String>) request.getAttribute("correos");
            ArrayList<String> nombres = (ArrayList<String>) request.getAttribute("nombres"); 
            ArrayList<Integer> edades = (ArrayList<Integer>) request.getAttribute("edades"); 
            ArrayList<String> ciudades = (ArrayList<String>) request.getAttribute("ciudades"); 
            ArrayList<String> sexos = (ArrayList<String>) request.getAttribute("sexos");
            ArrayList<String> fotos = (ArrayList<String>) request.getAttribute("fotos");
            
            for(int i=0; i<correos.size(); i++){%>
                <div class="content-resultNoLogueado--hijo" id="hijo">
                    <div class="informacionPersona-container">
                        <div class="informacionPersona-foto">
                            <img id="hijo-foto" src="Img/<%= fotos.get(i)%>" alt="foto de perfil">
                        </div>
                    
                        <div class="informacionPersona-datos">
                            <div class="datos-container">
                                <div id="hijo-nombre"><%= nombres.get(i) %></div>
                                <div id="hijo-sexo"><%= sexos.get(i).toString() %></div>
                                <div id="hijo-edad"><%= edades.get(i) %></div>
                                <div id="hijo-ciudad"><%= ciudades.get(i) %></div>
                            </div>
                        </div>
                    </div>
                </div>
            <%}
        %>
        </div>
        <!--<div class="content-resultNoLogueado">
            <div class="content-resultNoLogueado--hijo" id="hijo-1">
                <div class="informacionPersona-container">
                    <div class="informacionPersona-foto">
                        <img id="hijo1-foto" src="../img/foto-perfil.webp" alt="foto de perfil">
                    </div>
                    
                    <div class="informacionPersona-datos">
                        <div class="datos-container">
                            <div id="hijo1-nombre">Yerai</div>
                            <div id="hijo1-sexo">Hombre</div>
                            <div id="hijo1-edad">20</div>
                            <div id="hijo1-ciudad">Bilbao</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        -->
        <div class="cambioPagina-container">
            <button class="btn-cambioBusqueda" id="btn-cambioBusqueda">Cambiar Busqueda</button>
            <button class="btn-siguientePagina" id="btn-siguientePagina">Siguiente Pagina</button>
        </div>
        <script src="../js/resultadosBusquedaLogueado.js"></script>
    
</html>
