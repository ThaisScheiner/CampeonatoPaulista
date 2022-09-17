package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Time;
import model.grupo;


public class GrupoDao 
{
	private Connection c;
	
	private GenericDao gDao;
	
	public GrupoDao(GenericDao gDao)
	{
		this.gDao = gDao;
	}
	
	public List<grupo> gerarGrupos() throws SQLException, ClassNotFoundException 
	{
		
		Connection c = gDao.getConnection();

        String sqlGera = "{CALL sp_insereGrupoTimes}";

        CallableStatement cs = c.prepareCall(sqlGera);
        
        cs.execute();
        
        String sqlGrupo = "select p.Grupo, t.* from Times t, Grupos p where p.CodigoTime = t.CodigoTime";

        PreparedStatement ps = c.prepareStatement(sqlGrupo);

		ResultSet rs = ps.executeQuery();
        		
		List<grupo> grupos = new ArrayList<>();
		
		String grupo = "";

		while (rs.next()) {
			
			grupo = rs.getString(1);

			Time time = new Time();
			time.setCodigoTime(rs.getInt(2));
			time.setNomeTime(rs.getString(3));
			time.setCidade(rs.getString(4));
			time.setEstadio(rs.getString(5));

			grupo g = new grupo(grupo, time);

			grupos.add(g);
		}
		ps.close();

		return grupos;

	}
	
	public List<grupo> selectGrupos() throws SQLException {

		String sqlGrupo = "select p.Grupo, t.* from Times t, Grupos p where p.CodigoTime = t.CodigoTime";

        PreparedStatement ps = c.prepareStatement(sqlGrupo);

		ResultSet rs = ps.executeQuery();
        		
		List<grupo> grupos = new ArrayList<>();
		
		String grupo = "";

		while (rs.next()) {
			
			grupo = rs.getString(1);

			Time time = new Time();
			time.setCodigoTime(rs.getInt(2));
			time.setNomeTime(rs.getString(3));
			time.setCidade(rs.getString(4));
			time.setEstadio(rs.getString(5));

			grupo g = new grupo(grupo, time);

			grupos.add(g);
		}
		ps.close();

		return grupos;

	}

	
}