package it.uniroma2.dicii.bd.model.domain;

import java.sql.Date;

public class Acquirente {
    private String username;
    private String nome;
    private String cognome;
    private String cittaDiNascita;
    private Date dataNascita;
    private String password;
    private IndirizzoUtente indirizzo;


    public Acquirente(String cittaDiNascita, String cognome, Date dataNascita, IndirizzoUtente indirizzo, String nome, String password, String username) {
        this.cittaDiNascita = cittaDiNascita;
        this.cognome = cognome;
        this.dataNascita = dataNascita;
        this.indirizzo = indirizzo;
        this.nome = nome;
        this.password = password;
        this.username = username;
    }

    public Acquirente(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCittaDiNascita() {
        return cittaDiNascita;
    }

    public void setCittaDiNascita(String cittaDiNascita) {
        this.cittaDiNascita = cittaDiNascita;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public Date getDataNascita() {
        return dataNascita;
    }

    public void setDataNascita(Date dataNascita) {
        this.dataNascita = dataNascita;
    }

    public IndirizzoUtente getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(IndirizzoUtente indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
