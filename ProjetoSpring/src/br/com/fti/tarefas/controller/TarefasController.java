package br.com.fti.tarefas.controller;

import br.com.fti.tarefas.dao.TarefaDAO;
import br.com.fti.tarefas.model.*;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TarefasController {
	
	private TarefaDAO dao = new TarefaDAO();
	
	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefa/formulario";
	}
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result, Model model) {
		
		if(result.hasFieldErrors("descricao")){
			return"tarefa/formulario";
		}
		model.addAttribute("tarefa", tarefa);
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}
	
	@RequestMapping("listaTarefas")
	public String lista(Model model) {
		
		ArrayList<Tarefa> tarefas = dao.lista();
		
		model.addAttribute("tarefas", tarefas);
		
		return "tarefa/lista";
	}
	
	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {
		dao.remove(tarefa);
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model) {
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/mostra";
	}
	
	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa) {
		dao.altera(tarefa);
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model) {
		dao.finaliza(id);
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/finalizada";
	}
}
