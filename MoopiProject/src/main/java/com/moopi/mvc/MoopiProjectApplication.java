package com.moopi.mvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

import lombok.extern.slf4j.Slf4j;

@SpringBootApplication
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class MoopiProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(MoopiProjectApplication.class, args);
	}

}
