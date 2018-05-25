package br.com.gpt.models;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class PontosTuristicos implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long codigo;

	private String descricaoPonto;
	private String localizacao;
	private String identificacao;
	private int duracaoVisita;

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public String getDescricaoPonto() {
		return descricaoPonto;
	}

	public void setDescricaoPonto(String descricaoPonto) {
		this.descricaoPonto = descricaoPonto;
	}

	public String getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}

	public String getIdentificacao() {
		return identificacao;
	}

	public void setIdentificacao(String identificacao) {
		this.identificacao = identificacao;
	}

	public int getDuracaoVisita() {
		return duracaoVisita;
	}

	public void setDuracaoVisita(int duracaoVisita) {
		this.duracaoVisita = duracaoVisita;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
