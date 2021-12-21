package com.blood.bloodbackend.model.DTO;

import com.blood.bloodbackend.model.UnidadeDeDoacao;



public class EnderecoIncomingDTO {

    private long id;

    private String logradouro;

    private double latitude;

    private double longitude;

    public long getId () {
        return id;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() { return longitude; }

    public void setLongitude(double lon) { this.longitude = lon; }

    public int getUnidadeDeDoacao() {
        return unidadeDeDoacao;
    }

    public void setUnidadeDeDoacao(int unidadeDeDoacao) {
        this.unidadeDeDoacao = unidadeDeDoacao;
    }

    private int unidadeDeDoacao;
}
