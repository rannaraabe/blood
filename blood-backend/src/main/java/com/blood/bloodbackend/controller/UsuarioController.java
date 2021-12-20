package com.blood.bloodbackend.controller;


import com.blood.bloodbackend.model.DTO.UsuarioIncomingDTO;
import com.blood.bloodbackend.model.Usuario;
import com.blood.bloodbackend.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    UsuarioService usuarioService;


    @GetMapping
    public ResponseEntity<List<Usuario>> getUsuarios () {
       return this.usuarioService.getUsuarios();
    }

    @PostMapping
    public ResponseEntity<Usuario> cadastrarUsuario (@RequestBody UsuarioIncomingDTO usuario) {
        return usuarioService.cadastrarUsuario(usuario);
    }

}
