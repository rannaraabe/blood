package com.blood.bloodbackend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Test {


    @GetMapping("/rm")
    public  String cars () {
        return "https://www.youtube.com/watch?v=Xn8wIvccWBQ";
    }
}
