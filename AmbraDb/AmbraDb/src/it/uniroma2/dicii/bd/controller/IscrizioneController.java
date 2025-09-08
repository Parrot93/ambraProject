package it.uniroma2.dicii.bd.controller;
import it.uniroma2.dicii.bd.model.domain.Acquirente;
import it.uniroma2.dicii.bd.model.domain.IndirizzoUtente;
import it.uniroma2.dicii.bd.view.IscrizioneView;

import java.sql.Date;

public class IscrizioneController {
    private final IscrizioneView view;

    public IscrizioneController(IscrizioneView view) {
        this.view = view;
    }

    public Acquirente register() {
        view.showHeader();
        String username = view.ask("Inserisci Username");
        String password = view.ask("Inserisci Password");
        // qui eventuali validazioni
        return new Acquirente(username, password);
    }

    public void completeProfile(Acquirente acq) {
        String nome = view.ask("inserisci nome");
        String cognome = view.ask("inserisci cognome");
        String citta = view.ask("inserisci citta nascita");
        Date data = Date.valueOf(view.ask("inserisci data nascita (YYYY-MM-DD)"));
        String choice = view.ask("vuoi inserire l'indirizzo? (yes/no)");
        IndirizzoUtente indirizzo = null;
        if ("yes".equalsIgnoreCase(choice)) {
            // chiedi via, civico, etc.
        }
        // imposta su acq via setter o costruttore specifico
    }
}
