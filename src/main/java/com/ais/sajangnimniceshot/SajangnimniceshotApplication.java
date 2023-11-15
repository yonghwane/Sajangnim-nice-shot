package com.ais.sajangnimniceshot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ais.sajangnimniceshot.mappers")
public class SajangnimniceshotApplication {

	public static void main(String[] args) {
		SpringApplication.run(SajangnimniceshotApplication.class, args);
	}

}


