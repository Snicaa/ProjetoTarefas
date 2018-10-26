package br.com.fti.tarefas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class OlaMundoController {
	
	private static int acesso;
	
	@RequestMapping("/olaMundoSpring")
	public String execute() {
			System.out.println("Executando a lógica com Spring MVC - Acesso: " + acesso);
			acesso++;
			
			
			return "ok";
	}
}
