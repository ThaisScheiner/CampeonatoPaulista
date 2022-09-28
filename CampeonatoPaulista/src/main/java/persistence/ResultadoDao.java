package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Jogos;

public class ResultadoDao 
{
	private Connection c;

	public String geraJogos() throws SQLException 
	{
		String sql = "{CALL SP_FormarJogo}";
		CallableStatement cs = c.prepareCall(sql);
		cs.execute();

		String saida = "As rodadas foram definidas";
		return saida;
	}

	public ArrayList<Jogos> mostraJogos() throws SQLException, ClassNotFoundException
	{
		
		System.out.println("comeco do dao");
		
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
		
		ArrayList<Jogos> jogosLista = new ArrayList<Jogos>();
		
		
		String sql = "select * from jogos";
		PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();

	    while (rs.next()) {	
	    	Jogos jogo = new Jogos();
	    	jogo.setTimeA(rs.getString(1));
	    	jogo.setTimeb(rs.getString(2));
	    	jogo.setRodada(rs.getString(3));
	    	jogo.setDataRod(rs.getString(4));
	    	jogo.setId(rs.getString(5));
	    	
	    	System.out.println("entrou dao");
	    	System.out.println(" jogo no dao " + jogo);
	    	
	    	jogosLista.add(jogo);
	     }
	   
	     rs.close();
	     ps.close();
		 c.close();
		return jogosLista;
	}
}