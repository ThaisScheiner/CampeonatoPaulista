package model;

public class Jogos 
{
	private String id;
	private String timeA;
	private String timeb;
	private String Rodada;
	private String dataRod;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTimeA() {
		return timeA;
	}
	public void setTimeA(String timeA) {
		this.timeA = timeA;
	}
	public String getTimeb() {
		return timeb;
	}
	public void setTimeb(String timeb) {
		this.timeb = timeb;
	}
	public String getRodada() {
		return Rodada;
	}
	public void setRodada(String rodada) {
		Rodada = rodada;
	}
	public String getDataRod() {
		return dataRod;
	}
	public void setDataRod(String dataRod) {
		this.dataRod = dataRod;
	}
	
	@Override
	public String toString() {
		return "Jogos [id=" + id + ", timeA=" + timeA + ", timeb=" + timeb + ", Rodada=" + Rodada + ", dataRod="
				+ dataRod + "]";
	}
	
	
	
	
}
