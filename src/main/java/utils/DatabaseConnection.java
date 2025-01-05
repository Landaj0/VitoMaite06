/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author USUARIO
 */
public class DatabaseConnection {

    // Definimos los parámetros de conexión
    private static final String URL = "jdbc:mysql://localhost:3306/vitomaite06";
    private static final String USER = "root";
    private static final String PASSWORD = "SlgnstNslq3lf";

    private static Connection connection = null;

    // Método para obtener la conexión
    public static Connection getConnection() {
        if (connection == null) {
            try {
                // Establece la conexión a la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Conexión exitosa a la base de datos.");
            } catch (ClassNotFoundException e) {
                // Manejo de la excepción si el controlador no se encuentra
                System.err.println("Error: No se encontró el controlador JDBC.");
                e.printStackTrace();
            } catch (SQLException e) {
                System.out.println("Error al conectar a la base de datos.");
                e.printStackTrace();
            }
        }
        return connection;
    }

    // Método para cerrar la conexión
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Conexión cerrada.");
            } catch (SQLException e) {
                  System.out.println("Error al cerrar la conexión.");
                e.printStackTrace();
            }
        }
    }
}
