package com.blood.bloodbackend.service;

import com.blood.bloodbackend.model.DTO.UsuarioIncomingDTO;
import com.blood.bloodbackend.model.Usuario;
import com.blood.bloodbackend.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    UsuarioRepository usuarioRepository;

    public ResponseEntity<Usuario> cadastrarUsuario (@RequestBody UsuarioIncomingDTO usuario) {
        Usuario usuarioASerCadastrado = new Usuario();

        usuarioASerCadastrado.setNome(usuario.getNome());
        usuarioASerCadastrado.setUserName(usuario.getUserName());
        usuarioASerCadastrado.setDataNascimento(usuario.getDataNascimento());

        return ResponseEntity.ok(this.usuarioRepository.save(usuarioASerCadastrado));
    }

    public  ResponseEntity<List<Usuario>> getUsuarios () {
        return ResponseEntity.ok(usuarioRepository.findAll());
    }

}
