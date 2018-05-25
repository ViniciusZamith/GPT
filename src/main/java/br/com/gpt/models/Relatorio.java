package br.com.gpt.models;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Relatorio implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long codigo;

	private int diaRelatorio;
	private int horaRelatorio;
	private int qntPasseios;
	private double qntPagamentoStaff;
	private double qntLucro;

	public long getCodigo() {
		return codigo;
	}

	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}

	public int getDiaRelatorio() {
		return diaRelatorio;
	}

	public void setDiaRelatorio(int diaRelatorio) {
		this.diaRelatorio = diaRelatorio;
	}

	public int getHoraRelatorio() {
		return horaRelatorio;
	}

	public void setHoraRelatorio(int horaRelatorio) {
		this.horaRelatorio = horaRelatorio;
	}

	public int getQntPasseios() {
		return qntPasseios;
	}

	public void setQntPasseios(int qntPasseios) {
		this.qntPasseios = qntPasseios;
	}

	public double getQntPagamentoStaff() {
		return qntPagamentoStaff;
	}

	public void setQntPagamentoStaff(double qntPagamentoStaff) {
		this.qntPagamentoStaff = qntPagamentoStaff;
	}

	public double getQntLucro() {
		return qntLucro;
	}

	public void setQntLucro(double qntLucro) {
		this.qntLucro = qntLucro;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
