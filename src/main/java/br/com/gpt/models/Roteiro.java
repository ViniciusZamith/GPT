package br.com.gpt.models;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Roteiro implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long codigo;

	private String dataRoteiro;
	private String nomeRoteiro;
	private String caminhoRoteiro;

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public String getDataRoteiro() {
		return dataRoteiro;
	}

	public void setDataRoteiro(String dataRoteiro) {
		this.dataRoteiro = dataRoteiro;
	}

	public String getNomeRoteiro() {
		return nomeRoteiro;
	}

	public void setNomeRoteiro(String nomeRoteiro) {
		this.nomeRoteiro = nomeRoteiro;
	}

	public String getCaminhoRoteiro() {
		return caminhoRoteiro;
	}

	public void setCaminhoRoteiro(String caminhoRoteiro) {
		this.caminhoRoteiro = caminhoRoteiro;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
