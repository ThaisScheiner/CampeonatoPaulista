package model;

import java.io.Serializable;

public class grupo implements Serializable
{
	private String grupo;
	private Time time;
	
	public grupo() {
		super();
	}

	public grupo(String grupo, Time time) {
		this.grupo = grupo;
		this.time = time;
	}

	public String getGrupo() {
		return grupo;
	}

	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	
}
