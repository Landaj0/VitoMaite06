<%-- 
    Document   : ResultadoBusquedaNoLogueado
    Created on : 02-ene-2025, 19:59:20
    Author     : Yeray
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
    <body>
        <header class="header-resultNoLogueado">
            <a href="#" class="logo">
                <img src="Img/logoCorazon.png" width="50" height="50" alt="Logo VitoMaite">
                <p class="logoTexto">VitoMaite</p>
            </a>
            <nav>
                <a href="BusquedaNoLogueado.jsp">Buscar Pareja</a>
                <a href="index.jsp">Log in</a>
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
                        <img id="hijo-foto" class="fotoPerfilNoLogueado" src="Img/<%= fotos.get(i)%>" alt="foto de perfil">
                    </div>
                    
                    <div class="informacionPersona-datos">
                        <div class="datos-container">
                            <div id="hijo-nombre"><%= nombres.get(i) %></div>
                            <div id="hijo-sexo"><%= sexos.get(i).toString() %></div>
                            <div id="hijo-edad"><%= edades.get(i) %></div>
                            <div id="hijo-ciudad"><%= ciudades.get(i) %></div>
                            <a href="MasInfo?id=<%= correos.get(i) %>" id=<%= correos.get(i) %>>Ver detalles</a>
                        </div>
                    </div>
                </div>
            </div>
            <%}
        %>
        </div>
        
        <div class="cambioPagina-container">
            <a href="BusquedaNoLogueado.jsp" class="btn-cambioBusqueda" id="btn-cambioBusqueda">Cambiar Busqueda</a>
        </div>
    </body>
</html>
