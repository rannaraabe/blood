package com.blood.bloodbackend.model.DTO;

import com.blood.bloodbackend.model.Publicacao;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class UsuarioIncomingDTO {

    private String nome;

    private String userName;

    private int tipoSanguineo;

    private String email;

    @JsonFormat(pattern="yyyy-MM-dd")
    private Date dataNascimento;

    // [Comentado apenas para testes iniciais]
   // private Publicacao publicacao;


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getTipoSanguineo() {
        return tipoSanguineo;
    }

    public void setTipoSanguineo(int tipoSanguineo) {
        this.tipoSanguineo = tipoSanguineo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

//    public Publicacao getPublicacao() {
//        return publicacao;
//    }
//
//    public void setPublicacao(Publicacao publicacao) {
//        this.publicacao = publicacao;
//    }
}
