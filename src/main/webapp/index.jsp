<%-- 
    Document   : index
    Created on : 21-oct-2022, 10:47:38
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    HttpSession sesion = request.getSession();
    String disabled = "";
    String disabledCreado = "";

    if (sesion.getAttribute("usuario") == null) {
        disabled = "disabled";
    } else {
        disabledCreado = "disabled";

    }
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestion Sesiones</title>
        <link rel="stylesheet" href="CSS/styleGestionSesiones.css">

    </head>
    <body>
        <form action="FrontController" method="post">
            <fieldset>
                <h3>Gestion de Sesiones</h3>
                <input type="submit" value="Crear" name="opcion" id="crear" <%=disabledCreado%>>
                <br><br>
                <input type="submit" value="Visualizar" name="opcion" id="visualizar" <%=disabled%>>
                <br><br>
                <input type="submit" value="Modificar" name="opcion" id="modificar" <%=disabled%>>
                <br><br>
                <input type="submit" value="Eliminar" name="opcion" id="eliminar" <%=disabled%>>
            </fieldset>
        </form>
    </body>
</html>