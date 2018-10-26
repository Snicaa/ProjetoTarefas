package br.com.fti.tarefas.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.NamingException;

import br.com.fti.tarefas.model.Tarefa;
import br.com.fti.tarefas.dao.BancoDados;

public class TarefaDAO {
	
	private BancoDados db = null;
	
	public TarefaDAO() {
		try {
			db = new BancoDados("curso_java");
		} catch (NamingException e) {
			System.out.println("Erro ao instanciar o Banco de Dados: " + e);
		}
	}
	
	public void adiciona(Tarefa tarefa) {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = db.obterConexao();
			conn.setAutoCommit(false);

			StringBuffer sql = new StringBuffer();
			
			sql.append("INSERT INTO tarefas (descricao)");
			sql.append("VALUES(?)");

			stmt = conn.prepareStatement(sql.toString());
			
			stmt.setString(1, tarefa.getDescricao());
			
			stmt.execute();
			conn.commit();
			
		} catch (SQLException e) {
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					System.out.println("Erro no método adicionar - rollback");
				}
			}
			System.out.println("Erro no método adicionar");
			e.printStackTrace();
		} finally {
			db.finalizaObjetos(rs, stmt, conn);
		}
	}
	
	public ArrayList<Tarefa> lista(){
		
		ArrayList<Tarefa> listaTarefa = new ArrayList<Tarefa>();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = db.obterConexao();

			String sql = "SELECT id, descricao, finalizado, dataFinalizacao FROM tarefas ORDER BY id ASC;";

			stmt = conn.prepareStatement(sql.toString());

			rs = stmt.executeQuery();
			
			while (rs.next()) {
				Tarefa tarefa = new Tarefa();
				
				tarefa.setId(rs.getLong(1));
				tarefa.setDescricao(rs.getString(2));
				tarefa.setFinalizado(rs.getBoolean(3));
				tarefa.setDataFinalizacao(rs.getDate(4));
				
				listaTarefa.add(tarefa);
			}

		} catch (SQLException e) {
			System.out.println("Erro no método lista");
			e.printStackTrace();
		} finally {
			db.finalizaObjetos(rs, stmt, conn);
		}
		return listaTarefa;
	}
	
	public void remove(Tarefa tarefa){

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = db.obterConexao();

			String querry = "DELETE FROM tarefas\nWHERE id = ?;";
			
			stmt = conn.prepareStatement(querry.toString());
			
			stmt.setLong(1, tarefa.getId());

			stmt.execute();
			conn.commit();

		} catch (SQLException e) {
			System.out.println("Erro no método remover");
			e.printStackTrace();
		} finally {
			db.finalizaObjetos(rs, stmt, conn);
		}
	}
	
	public Tarefa buscaPorId(Long id){
		Tarefa tarefa = new Tarefa();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = db.obterConexao();

			String sql = "SELECT * FROM tarefas "
					+ "WHERE id = ?";

			stmt = conn.prepareStatement(sql.toString());
			
			stmt.setLong(1, id);
			
			rs = stmt.executeQuery();
			
			while(rs.next()){
				tarefa.setId(rs.getLong(1));
				tarefa.setDescricao(rs.getString(2));
				tarefa.setFinalizado(rs.getBoolean(3));
				tarefa.setDataFinalizacao(rs.getDate(4));
			}

		} catch (SQLException e) {
			System.out.println("Erro no método buscaPorId");
			e.printStackTrace();
		} finally {
			db.finalizaObjetos(rs, stmt, conn);
		}
		return tarefa;
	}
	
	public void altera(Tarefa tarefa){
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = db.obterConexao();
			
			StringBuffer sql = new StringBuffer();
			
			sql.append("UPDATE tarefas SET descricao = ?, finalizado = ?, dataFinalizacao = ? "
					+ "WHERE id = ?;");
			
			stmt = conn.prepareStatement(sql.toString());
			
			java.sql.Date d = new java.sql.Date(tarefa.getDataFinalizacao().getTime());
			
			stmt.setString(1, tarefa.getDescricao());
			stmt.setBoolean(2, tarefa.isFinalizado());
			stmt.setDate(3, d);
			stmt.setLong(4, tarefa.getId());
			
			stmt.execute();
			conn.commit();
			
		} catch (SQLException e) {
			System.out.println("Erro no método buscaPorId");
			e.printStackTrace();
		} finally {
			db.finalizaObjetos(rs, stmt, conn);
		}
	}
	
}
