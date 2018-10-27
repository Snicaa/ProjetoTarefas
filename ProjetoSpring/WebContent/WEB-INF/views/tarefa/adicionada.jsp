<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<title>Tarefas</title>
	</head>
	<h1>Nova tarefa adicionada com sucesso!</h1>
	<main class="mainAdicionada">
		<body>	
			<div class="card">
				<img src="images/tarefaAdicionadaHeader.jpeg" class="card-image" />
				<div class="card-title">
					Nova tarefa:
				</div>
				<div class="card-desc">
					${tarefa.descricao}
				</div>
				<div class="card-actions">
					<input class="button card-action-readMore" type="button" onclick="location.href='novaTarefa';" value="Adicionar nova Tarefa">
					<input class="button card-action-readMore" type="button" onclick="location.href='listaTarefas';" value="Ir para Lista">
				</div>
			</div>
		</body>
	</main>
</html>