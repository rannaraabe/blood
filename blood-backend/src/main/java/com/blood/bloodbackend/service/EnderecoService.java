package com.blood.bloodbackend.service;

import com.blood.bloodbackend.model.DTO.EnderecoIncomingDTO;
import com.blood.bloodbackend.model.Endereco;
import com.blood.bloodbackend.repository.EnderecoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnderecoService {

    @Autowired
    EnderecoRepository enderecoRepository;

    //TODO cadastrar a unidade de doação referente (quando a parte de unidade de doação estiver pronta)
    public ResponseEntity<Endereco> cadastrar (EnderecoIncomingDTO enderecoASerCadastradoDTO) {
        Endereco enderecoASerCadastrado = new Endereco();

        enderecoASerCadastrado.setLogradouro(enderecoASerCadastradoDTO.getLogradouro());
        enderecoASerCadastrado.setLatitude(enderecoASerCadastradoDTO.getLatitude());
        enderecoASerCadastrado.setLongitude(enderecoASerCadastradoDTO.getLongitude());

        return ResponseEntity.ok(enderecoRepository.save(enderecoASerCadastrado));

    }

    public ResponseEntity<List<Endereco>> getEnderecos () {
        return ResponseEntity.ok(enderecoRepository.findAll());
    }
}
