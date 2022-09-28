package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Jogos;
import persistence.ResultadoDao;
import persistence.ResultadoDao;

@WebServlet("/rodada")
public class ServletRodada extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletRodada() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Jogos> jogosLista = new ArrayList<>();
		
		try 
		{
			ResultadoDao rDao = new ResultadoDao();
			jogosLista= rDao.mostraJogos();
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			 e.getMessage();
		} 
		finally 
		{
			RequestDispatcher rd = request.getRequestDispatcher("rodada.jsp");
			request.setAttribute("jogos", jogosLista);
			rd.forward(request, response);
		}
			
		}
	}


