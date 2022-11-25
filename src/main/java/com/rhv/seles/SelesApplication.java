package com.rhv.seles;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@OpenAPIDefinition(info = @Info(title = "Seles API", version = "1.0", description = "Seles API Information"))
public class SelesApplication {

	public static void main(String[] args) {
		SpringApplication.run(SelesApplication.class, args);
	}

}
