<%-- 
    Document   : crear
    Created on : 21-oct-2022, 11:50:24
    Author     : Sergio
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="es.albarregas.beans.GuardadoDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/styleGestionSesiones.css">
        <title>Crear Sesion</title>
        <%
            HttpSession sesion = request.getSession();
            GuardadoDatos guardadoDatos = (GuardadoDatos) sesion.getAttribute("usuario");

            //formato correcto de la fecha
            SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
            String formatoFecha = simple.format(guardadoDatos.getFecha());
        %>
    </head>
    <body>
        <form action="ControladorOpciones" method="post">
            <fieldset>
                <h3>Modificar sesion</h3>
                <%
                    if (request.getAttribute("error") != null) {
                %>
                <p><%=request.getAttribute("error")%></p>
                <%
                    }

                    //name = ((city.getName() == null) ? "N/A" : city.getName());

                %>
                <label for="id">Id: </label>
                <input type="text" name="id" id="id" readonly value="<%=guardadoDatos.getId()%>">
                <br><br>
                <label for="nombre">Nombre: </label>
                <input type="text" name="nombre" id="nombre"  value="<%=guardadoDatos.getNombre()%>">
                <br><br>
                <label for="fecha">Fecha: </label>
                <input type="date" name="fecha" id="fecha" value="<%=formatoFecha%>">
                <br><br>
                <label for="tipoIdentificacion">Tipo identificacion</label>
                <select name="tipoIdentificacion" id="tipoIdentificacion">
                    <option value="<%=guardadoDatos.getTipoIdentificacion()%>" name="opcion"><%=guardadoDatos.getTipoIdentificacion()%></option>
                    <option value="NIF" name="opcion">NIF</option>
                    <option value="NIE" name="opcion">NIE</option>
                    <option value="Pasaporte" name="opcion">Pasaporte</option>                
                </select>
                <br><br>
                <label for="identificacion">Identificacion: </label>
                <input type="text" name="identificacion" id="identificacion" value="<%=guardadoDatos.getIdentificacion()%>">
                <br><br>

                <input type="submit" name="modificar" id="modificar" value="Modificar">
                <input type="submit" name="cancelar" id="volver" value="Volver">
                <br><br>
            </fieldset>
        </form>

    </body>
</html>