<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Tarefas</title>
		<link rel="stylesheet" type="text/css" href="css/css.css">
	</head>
	<body>
		<h3>Adicionar tarefas</h3>
		<form:errors path="tarefa.descricao" cssStyle="color:red"/>
		<form action="adicionaTarefa" method="post">
			Descrição: <br />
			<textarea class="txt" placeholder="Informe a descrição da tarefa aqui." minlength="5"	 name="descricao" rows="10" cols="50" style="border: 1px solid black; overflow:auto; outline: none;"></textarea><br />
			<input class="btn" type="submit" value="Adicionar" disabled>
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