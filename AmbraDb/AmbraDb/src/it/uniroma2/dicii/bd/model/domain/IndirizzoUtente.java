package it.uniroma2.dicii.bd.model.domain;

public class IndirizzoUtente {
    private String via;
    private int civico;
    private int cap;
    private int citta;
    private Acquirente acquirente;

    public IndirizzoUtente(int cap, int citta, int civico, String via) {
        this.cap = cap;
        this.citta = citta;
        this.civico = civico;
        this.via = via;
    }


    public int getCap() {
        return cap;
    }

    public void setCap(int cap) {
        this.cap = cap;
    }

    public int getCitta() {
        return citta;
    }

    public void setCitta(int citta) {
        this.citta = citta;
    }

    public int getCivico() {
        return civico;
    }

    public void setCivico(int civico) {
        this.civico = civico;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public void setAcquirente(Acquirente acquirente) {
        this.acquirente = acquirente;
        if (acquirente != null && acquirente.getIndirizzo() != this) {
            acquirente.setIndirizzo(this);
        }
    }
}




