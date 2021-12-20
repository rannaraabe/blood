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
}
