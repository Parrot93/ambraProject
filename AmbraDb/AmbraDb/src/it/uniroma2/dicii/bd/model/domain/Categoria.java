package it.uniroma2.dicii.bd.model.domain;

public class Categoria {
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    private String nome;
    private String nomeCategoria;

    public Categoria(String nome, String nomeCategoria) {
        this.nome = nome;
        this.nomeCategoria = nomeCategoria;
    }
}
