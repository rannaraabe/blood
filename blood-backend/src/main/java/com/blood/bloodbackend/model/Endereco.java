package com.blood.bloodbackend.model;

import javax.persistence.*;

@Entity
@Table(name = "endereco")
public class Endereco {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_ENDERECO")
    @SequenceGenerator(name = "SEQ_ENDERECO", sequenceName = "id_seq_endereco", allocationSize = 1)
    private long id;

    private String logradouro;

    private double latitude;

    private  double longitude;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "unidade_id")
    private UnidadeDeDoacao unidadeDeDoacao;

    public long getId() {
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

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public UnidadeDeDoacao getUnidadeDeDoacao() {
        return unidadeDeDoacao;
    }

    public void setUnidadeDeDoacao(UnidadeDeDoacao unidadeDeDoacao) {
        this.unidadeDeDoacao = unidadeDeDoacao;
    }
}
