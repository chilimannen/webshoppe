package com.codingchili.webshoppe;

import com.fasterxml.jackson.databind.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * @author Robin Duda
 *
 * Application configuration.
 */
public class Properties {
    private static Logger logger = LoggerFactory.getLogger(Properties.class);
    private static ObjectMapper mapper = new ObjectMapper()
            .configure(SerializationFeature.INDENT_OUTPUT, true);
    private static Properties properties;
    private String jdbcUrl = "jdbc:mysql://192.168.10.129:3306/WebShop?useSSL=false";
    private String databaseUser = "root";
    private String databasePass = "root";
    private String swishReceiver = "0737557200";

    static {
        try {
            properties = mapper.readValue(new FileInputStream("application.json"), Properties.class);
            logger.info("Loaded application configuration \n" + mapper.writeValueAsString(properties));
        } catch (IOException e) {
            properties = new Properties();
            try {
                Files.write(Paths.get("application.json"), mapper.writeValueAsBytes(properties));
                logger.info("no 'application.properties' file found, generated new.");
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    public static Properties get() {
        return properties;
    }

    public String getDatabaseUser() {
        return databaseUser;
    }

    public void setDatabaseUser(String databaseUser) {
        this.databaseUser = databaseUser;
    }

    public String getDatabasePass() {
        return databasePass;
    }

    public void setDatabasePass(String databasePass) {
        this.databasePass = databasePass;
    }

    public String getSwishReceiver() {
        return swishReceiver;
    }

    public void setSwishReceiver(String swishReceiver) {
        this.swishReceiver = swishReceiver;
    }

    public String getJdbcUrl() {
        return jdbcUrl;
    }

    public void setJdbcUrl(String jdbcUrl) {
        this.jdbcUrl = jdbcUrl;
    }
}