package com.work.database;

import java.sql.SQLException;

import org.h2.tools.Server;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class WorkDbTestLauncher {

	public static void main(String[] args) {
		SpringApplication.run(WorkDbTestLauncher.class, args);
	}
	
	@Value("${db.port}")
    private String h2DbPort;

    @Bean
    public Server server() throws SQLException {
        return Server.createTcpServer("-tcp", "-tcpAllowOthers", "-tcpPort", h2DbPort).start();
    }
}
