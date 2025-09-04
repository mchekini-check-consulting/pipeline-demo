package com.example.pipelinedemo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldResource {


    @GetMapping
    public String helloWorld() {
        return "Hello World";
    }
}
