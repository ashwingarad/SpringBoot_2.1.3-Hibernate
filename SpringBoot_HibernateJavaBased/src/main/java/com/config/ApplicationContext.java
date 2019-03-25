package com.config;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(scanBasePackages = "com")
@ComponentScan(value = "com")
@EntityScan("com.model")
public class ApplicationContext {

	public static void main(String[] args) {
		System.setProperty("server.port", "8095");
		System.setProperty("server.tomcat.max-threads", "200");
		System.setProperty("server.connection-timeout", "60000");
		SpringApplication.run(ApplicationContext.class, args);
		openHomePage();
	}

	private static void openHomePage() {
		Runtime rt = Runtime.getRuntime();
		try {
			rt.exec("rundll32 url.dll,FileProtocolHandler " + "http://localhost:8095/index.html");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
