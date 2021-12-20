package com.blood.bloodbackend.model;

import javax.persistence.*;

@Entity
@Table(name = "unidadeDeDoacao")
public class UnidadeDeDoacao {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_UNIDADE")
    @SequenceGenerator(name = "SEQ_UNIDADE", sequenceName = "id_seq_unidade", allocationSize = 1)
    private long id;

    private String nome;

    @Column(length = 40)
    private String telefones;

    @Column(length = 20)
    private  String horarioAtendimento;

    @OneToOne(mappedBy = "unidadeDeDoacao")
    private Endereco endereco;

    @OneToOne(mappedBy = "unidadeDeDoacao")
    private  Publicacao publicacao;
}
