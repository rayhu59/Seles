package com.rhv.seles.Controller;

import com.rhv.seles.Model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class AuthController {

    Logger logger = LoggerFactory.getLogger(AuthController.class);

    @PostMapping("/user" )
    public ResponseEntity<String> createUser(@RequestParam String name){
        logger.info("created user {}", name);
        return ResponseEntity.ok().body("Created user with name " + name);
    }

    @GetMapping("/user")
    public User getUser(){
        return new User("Hello world",1L);
    }

    @DeleteMapping("user/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable("id") Long id){
        logger.info("deleted some user with id {}",id);
        return ResponseEntity.ok().body("Deleted user with id " + id);
    }

}
