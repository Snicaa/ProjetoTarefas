<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>Alterar tarefa - ${tarefa.id}</h3>
		<form action="alteraTarefa" method="post">
			<input type="hidden" name="id" value="${tarefa.id}" />
			Descrição:<br />
			<textarea class="txt" min-length="5" max-length="255" name="descricao" cols="100" rows="5"><%----%>${tarefa.descricao}<%----%></textarea> <br />
			Finalizado? <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado? 'checked' : '' }/> <br />
			Data de finalização: <br />
			<input type="text" name="dataFinalizacao"
			value="<fmt:formatDate value="${tarefa.dataFinalizacao}" 
			pattern="dd/MM/yyyy"/>"/> 
			
			<br />
			
			<input class="btn" type="submit" value="Alterar"/>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script>
				$(".txt").on("input", function(){
	                var string = $(".txt").val();
					if (string.length < 5){
	                    if (string.length == 0){
	                        $(".txt").css("border", "1px black solid");
	                    } else {
	                        $(".txt").css("border", "1px red solid");
	                        $(".btn").attr("disabled", "disabled");
	                    }
	                } else {
	                    $(".txt").css("border", "1px green solid");
	                    $(".btn").removeAttr("disabled");
	                }
				});
			</script>
		</form>
	</body>
</html>