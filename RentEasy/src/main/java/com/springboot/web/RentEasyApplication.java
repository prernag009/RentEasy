package com.springboot.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class RentEasyApplication {

	public static void main(String[] args) {
		SpringApplication.run(RentEasyApplication.class, args);
		System.out.println("Server started...");
	}

}
