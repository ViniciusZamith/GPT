package br.com.gpt.models;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Veiculo implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long codigo;

	private String placa;
	private int anoVeiculo;
	private String modeloVeiculo;
	private String marcaVeiculo;
	private int locacaoMin;
	private int locacaoMax;

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public int getAnoVeiculo() {
		return anoVeiculo;
	}

	public void setAnoVeiculo(int anoVeiculo) {
		this.anoVeiculo = anoVeiculo;
	}

	public String getModeloVeiculo() {
		return modeloVeiculo;
	}

	public void setModeloVeiculo(String modeloVeiculo) {
		this.modeloVeiculo = modeloVeiculo;
	}

	public String getMarcaVeiculo() {
		return marcaVeiculo;
	}

	public void setMarcaVeiculo(String marcaVeiculo) {
		this.marcaVeiculo = marcaVeiculo;
	}

	public int getLocacaoMin() {
		return locacaoMin;
	}

	public void setLocacaoMin(int locacaoMin) {
		this.locacaoMin = locacaoMin;
	}

	public int getLocacaoMax() {
		return locacaoMax;
	}

	public void setLocacaoMax(int locacaoMax) {
		this.locacaoMax = locacaoMax;
	}
}
