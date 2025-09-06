package it.uniroma2.dicii.bd.model.domain;

public class Oggetto {
    private String codice;
    private String descrizione;
    private String prezzoBase;
    private String adminUsername;
    private String nomeCategoria;
    private int idAsta;
    private enum Condizione{NUOVO,USATO};
    private enum Stato{VENDUTO,NON_VENDUTO};

    public Oggetto(String adminUsername, String codice, String descrizione, int idAsta, String nomeCategoria, String prezzoBase) {
        this.adminUsername = adminUsername;
        this.codice = codice;
        this.descrizione = descrizione;
        this.idAsta = idAsta;
        this.nomeCategoria = nomeCategoria;
        this.prezzoBase = prezzoBase;
    }

    public String getAdminUsername() {
        return adminUsername;
    }

    public void setAdminUsername(String adminUsername) {
        this.adminUsername = adminUsername;
    }

    public String getCodice() {
        return codice;
    }

    public void setCodice(String codice) {
        this.codice = codice;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public int getIdAsta() {
        return idAsta;
    }

    public void setIdAsta(int idAsta) {
        this.idAsta = idAsta;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    public String getPrezzoBase() {
        return prezzoBase;
    }

    public void setPrezzoBase(String prezzoBase) {
        this.prezzoBase = prezzoBase;
    }
}
