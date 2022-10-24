<%-- 
    Document   : crear
    Created on : 21-oct-2022, 11:50:24
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/styleGestionSesiones.css">
        <title>Crear Sesion</title>
    </head>
    <body>
        <form action="ControladorOpciones" method="post">
            <fieldset>
                <h3>Crear sesion</h3>
                <%
                    if (request.getAttribute("error") != null) {
                %>
                <p><%=request.getAttribute("error")%></p>
                <%
                    }
                %>
                <label for="id">Id: </label>
                <input type="text" name="id" id="id" value="<%=request.getParameter("id") != null ? request.getParameter("id") : ""%>">
                <br><br>
                <label for="nombre">Nombre: </label>
                <input type="text" name="nombre" id="nombre" value="<%=request.getParameter("nombre") != null ? request.getParameter("nombre") : ""%>">
                <br><br>
                <label for="fecha">Fecha: </label>
                <input type="date" name="fecha" id="fecha" value="<%=request.getParameter("fecha") != null ? request.getParameter("fecha") : ""%>">
                <br><br>
                <label for="tipoIdentificacion">Tipo identificacion</label>
                <select name="tipoIdentificacion" id="tipoIdentificacion">
                    <%
                        if (request.getParameter("tipoIdentificacion") != null) {
                    %>
                    <option value="<%=request.getParameter("tipoIdentificacion")%>" name ="opcion"><%=request.getParameter("tipoIdentificacion")%>  </option>      
                    <%
                        } else {
                        }
                    %>
                    <option value="NIF" name="opcion">NIF</option>
                    <option value="NIE" name="opcion">NIE</option>
                    <option value="Pasaporte" name="opcion">Pasaporte</option>
                </select>
                <br><br>
                <label for="identificacion">Identificacion: </label>
                <input type="text" name="identificacion" id="identificacion" value="<%=request.getParameter("identificacion") != null ? request.getParameter("identificacion") : ""%>">
                <br><br>
                <input type="submit" name="crear" id="crear" value="Crear">
                <input type="submit" name="cancelar" id="cancelar" value="Cancelar">
                <br><br>
            </fieldset>
        </form>

    </body>
</html>