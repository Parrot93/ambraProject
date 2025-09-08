package it.uniroma2.dicii.bd.view;
import java.io.IOException;
import java.util.Scanner;

public class FirstPageView {
    public static int showMenu() throws IOException {
        System.out.println("*****************************************************");
        System.out.println(
                "▄▀█ █▀ ▀█▀ █▀▀   █▀█ █▄░█ █░░ █ █▄░█ █▀▀\n" +
                "█▀█ ▄█ ░█░ ██▄   █▄█ █░▀█ █▄▄ █ █░▀█ ██▄   ");
        System.out.println("*****************************************************");
        System.out.println("*** Cosa Vuoi fare? ***");
        System.out.println("1) Accedi");
        System.out.println("2) Iscriviti");
        System.out.println("3) Quit");

        Scanner input = new Scanner(System.in);
        int choice = 0;
        while (true) {
            System.out.print("fai una scelta: ");
            choice = input.nextInt();
            if (choice >= 1 && choice <= 3) {
                break;
            }
            System.out.println("Opzione non valida");
        }

        return choice;
    }
}
