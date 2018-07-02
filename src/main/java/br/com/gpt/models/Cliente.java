package br.com.gpt.models;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Cliente extends Usuario implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long codigo;

	private String diaNascimento;
	private int passeioCadastrados;

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public String getDiaNascimento() {
		return diaNascimento;
	}

	public void setDiaNascimento(String diaNascimento) {
		this.diaNascimento = diaNascimento;
	}

	public int getPasseioCadastrados() {
		return passeioCadastrados;
	}

	public void setPasseioCadastrados(int passeioCadastrados) {
		this.passeioCadastrados = passeioCadastrados;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
