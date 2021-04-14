<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Vacuna"%>
<%@page import="com.emergentes.modelo.GestorVacunas"%>
<%
if(session.getAttribute("agenda")==null){
    GestorVacunas objeto1=new GestorVacunas();

    objeto1.insertVacuna(new Vacuna(1,"Brunito Diaz",25.0,1.40,"SI"));
    objeto1.insertVacuna(new Vacuna(2,"Juancito Pinto",30.0,1.52,"NO"));
  
    session.setAttribute("agenda", objeto1);
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>REGISTROS DE VACUNAS</h1>
         <table border="1">
             <tr>
                 <th>PRIMER PARCIAL TEM-742
                     <br>
                 Nombre: Mendel Maldonado Nina
                 <br>
                 Carnet:8430820
                 </th>
             </tr>
             
         </table>
         <br>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Peso</th>
                <th>Talla</th>
                <th>Vacuna</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.peso}</td>
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
                
            </c:forEach>
        </table>
    </body>
</html>
