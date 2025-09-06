package it.uniroma2.dicii.bd.model.domain;

import java.sql.Date;

public class Carta {
    private int numero;
    private String intestatario;
    private int cvv;
    private Date dataScadeza;

    public Carta(int cvv, Date dataScadeza, String intestatario, int numero) {
        this.cvv = cvv;
        this.dataScadeza = dataScadeza;
        this.intestatario = intestatario;
        this.numero = numero;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public Date getDataScadeza() {
        return dataScadeza;
    }

    public void setDataScadeza(Date dataScadeza) {
        this.dataScadeza = dataScadeza;
    }

    public String getIntestatario() {
        return intestatario;
    }

    public void setIntestatario(String intestatario) {
        this.intestatario = intestatario;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
}
