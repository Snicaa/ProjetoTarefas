<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<title>Tarefas</title>
	</head>
	<body>
		<h1>Lista de Tarefas</h1>
		<main>
			<table>
				<thead>
					<tr>
						<th style="width: 6%; text-align: center;">ID</th>
						<th style="width: 68%;">Descrição</th>
						<th style="width: 6%">Status</th>
						<th style="width: 12%; font-size: 1.40rem;">Data de finalização</th>
						<th style="width: 8%;"></th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="6">
							<input class="button" type="button" onclick="location.href='novaTarefa'" value="Criar nova Tarefa">
						</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${tarefas}" var="tarefa">
						<tr id="tarefa_${tarefa.id}">
							<td style="text-align: center;">${tarefa.id}</td>
							<td>${tarefa.descricao}</td>
							
							<c:if test="${tarefa.finalizado eq false}">
								<td><a href="#" onclick="finalizaAgora(${tarefa.id})"><i id="check" style="color: white; margin-left: 32%;" class="material-icons">check_box_outline_blank</i></a></td>
							</c:if>
				
							<c:if test="${tarefa.finalizado eq true}">
								<td><i style="color: white; margin-left: 35%;" class="material-icons"> done</i></td>
							</c:if>
							<td style="text-align: center;">
								<fmt:formatDate
									value="${tarefa.dataFinalizacao}"
									pattern="dd/MM/yyyy"/>
							</td>
							<td style="display: inline-block; width: 100%;"><a href="mostraTarefa?id=${tarefa.id}"><i style="color: white; margin-left:13%;" class="material-icons">create</i></a>  &nbsp
							<a href="removeTarefa?id=${tarefa.id}"><i style="color: white;" class="material-icons">delete</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		function finalizaAgora(id) {
			$.post("finalizaTarefa", {'id' : id}, function(resposta) {
				$("#tarefa_"+id).html(resposta);
			});
		}
</script>
</html>