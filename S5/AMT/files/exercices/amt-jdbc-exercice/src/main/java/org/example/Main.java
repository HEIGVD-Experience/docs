package org.example;

import org.postgresql.ds.PGSimpleDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
        System.out.println("Hello world!");

        PGSimpleDataSource pgSimpleDataSource = new PGSimpleDataSource();
        pgSimpleDataSource.setServerName("localhost");
        pgSimpleDataSource.setPortNumber(5432);
        pgSimpleDataSource.setDatabaseName("postgres");
        pgSimpleDataSource.setUser("postgres");
        pgSimpleDataSource.setPassword("postgres");
        DataSource dataSource = pgSimpleDataSource;

        for(int i = 0 ; i < 1000 ; ++i) {
            Connection connection = dataSource.getConnection();
            System.out.println("Open connection n°" + i + " " + connection.getMetaData().getDatabaseProductName());
        }

    }
}