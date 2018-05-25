package br.com.gpt.models;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Reserva implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long codigo;

	private String tipoReserva;
	private int horaReserva;
	private String dataInicio;
	private String dataFim;

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public String getTipoReserva() {
		return tipoReserva;
	}

	public void setTipoReserva(String tipoReserva) {
		this.tipoReserva = tipoReserva;
	}

	public int getHoraReserva() {
		return horaReserva;
	}

	public void setHoraReserva(int horaReserva) {
		this.horaReserva = horaReserva;
	}

	public String getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(String dataInicio) {
		this.dataInicio = dataInicio;
	}

	public String getDataFim() {
		return dataFim;
	}

	public void setDataFim(String dataFim) {
		this.dataFim = dataFim;
	}

	public int getQuantidadeClientes() {
		return quantidadeClientes;
	}

	public void setQuantidadeClientes(int quantidadeClientes) {
		this.quantidadeClientes = quantidadeClientes;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private int quantidadeClientes;

}
