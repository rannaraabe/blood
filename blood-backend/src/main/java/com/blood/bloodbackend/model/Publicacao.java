package com.blood.bloodbackend.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "publicacao")
public class Publicacao {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_PUBLICACAO")
    @SequenceGenerator(name = "SEQ_PUBLICACAO", sequenceName = "id_seq_publicacao", allocationSize = 1)
    private long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "unidade_id")
    private UnidadeDeDoacao unidadeDeDoacao;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    private Date dataDeCriacao;

    private int prioridade;

    private  int tipoSanguineo;

}
