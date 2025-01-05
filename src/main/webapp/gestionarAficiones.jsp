<%-- 
    Document   : gestionarAficiones
    Created on : 05-ene-2025, 11:57:59
    Author     : Yeray
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Aficiones</title>
    <link rel="stylesheet" href="Styles.css">
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
                <a href="BusquedaPorAficiones.jsp">Busqueda por Aficiones</a>
                <a href="VerMisLikes.jsp">Ver mis Likes</a>
                <a href="BuscarPorLocalizacion.jsp">Por Localización</a>
                <a href="LogOutServlet">Log out</a>
            </nav>
        </header>
    
    <div class="container-gestionarAficiones">
        <h1 class="h1-gestionarAficiones">Gestión de Aficiones</h1>
        <div class="button-container-gestionarAficiones">
            <a href="GestionarAficionesVerServlet" class="button-gestionarAficiones" id="btn-verAficiones">Ver Aficiones</a>
            <a href="GestionarAficionesAgregarServlet" class="button-gestionarAficiones" id="btn-anadirAficiones">Añadir Aficiones</a>
            <a href="GestionarAficionesEliminarServlet" class="button-gestionarAficiones" id="btn-eliminarAficiones">Eliminar Aficiones</a>
        </div>
        <div class="output-gestionarAficiones" id="output">
            <%
                ArrayList<String> aficiones = (ArrayList<String>) request.getAttribute("VerAficiones");
                if(aficiones != null && aficiones.get(0).equals("Ver")){
                    System.out.println("Ver aficiones");
                    for(int i = 1; i<aficiones.size(); i++){
                        System.out.println("Hola6");%>
                        <%= aficiones.get(i) %><br>
                    <%}
                }%>
            
            <%
                if(aficiones != null && aficiones.get(0).equals("Agregar")){
                    System.out.println("Agregar aficiones");%>
                    <form action="GestionarAficionesAgregarServlet" method="POST">
                    <%
                    for(int i = 1; i<aficiones.size(); i++){%>
                        <div class="checkbox-container"><input type="checkbox" value="<%= aficiones.get(i) %>" name="aficionesSeleccionadas"><%= aficiones.get(i) %><br></div>
                    <%}%>
                    <button type="submit" class="btn boton-aficiones">Agregar</button>
                    </form>
                <%}%>
            
            <%
                if(aficiones != null && aficiones.get(0).equals("Eliminar")){
                    System.out.println("Eliminar aficiones");%>
                    <form action="GestionarAficionesEliminarServlet" method="POST">
                    <%
                    for(int i = 1; i<aficiones.size(); i++){%>
                    <div class="checkbox-container"><input type="checkbox" value="<%= aficiones.get(i) %>" name="aficionesSeleccionadas"><%= aficiones.get(i) %><br></div>
                    <%}%>
                    <button type="submit" class="btn boton-aficiones">Eliminar</button>
                    </form>
                <%}%>
        </div>
    </div>
</body>
</html>
