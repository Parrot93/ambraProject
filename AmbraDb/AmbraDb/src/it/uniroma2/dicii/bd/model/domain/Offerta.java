package it.uniroma2.dicii.bd.model.domain;

import java.sql.Date;

public class Offerta {

    public Float getValore() {
        return valore;
    }

    public void setValore(Float valore) {
        this.valore = valore;
    }

    public Date getOrario() {
        return orario;
    }

    public void setOrario(Date orario) {
        this.orario = orario;
    }

    public String getCodiceOggetto() {
        return codiceOggetto;
    }

    public void setCodiceOggetto(String codiceOggetto) {
        this.codiceOggetto = codiceOggetto;
    }

    public String getAcquirente() {
        return acquirente;
    }

    public void setAcquirente(String acquirente) {
        this.acquirente = acquirente;
    }

    private Float valore;
    private Date orario;
    private String acquirente;
    public String codiceOggetto;

    public Offerta(String acquirente, String codiceOggetto, Date orario, Float valore) {
        this.acquirente = acquirente;
        this.codiceOggetto = codiceOggetto;
        this.orario = orario;
        this.valore = valore;
    }


}
