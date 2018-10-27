<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<td style="text-align: center;">${tarefa.id}</td>>
<td>${tarefa.descricao}</td>
<td><i style="color: white; margin-left: 35%;" class="material-icons"> done</i></td>
<td style="text-align: center;">
	<fmt:formatDate
		value="${tarefa.dataFinalizacao}"
		pattern="dd/MM/yyyy"/>
</td>
<td style="display: inline-block; width: 100%;"><a href="mostraTarefa?id=${tarefa.id}"><i style="color: white; margin-left:13%;" class="material-icons">create</i></a>  &nbsp
<a href="removeTarefa?id=${tarefa.id}"><i style="color: white;" class="material-icons">delete</i></a></td>