package it.uniroma2.dicii.bd.view;

import java.util.Scanner;

public class IscrizioneView {
    private final Scanner input = new Scanner(System.in);

    public void showHeader() {
        System.out.println("*********************************");
        System.out.println("*           Iscrizione          *");
        System.out.println("*********************************\n");
    }

    public String ask(String prompt) {
        System.out.print(prompt + ": ");
        return input.nextLine().trim();
    }

    public void showError(String msg) {
        System.out.println("Errore: " + msg);
    }
}
