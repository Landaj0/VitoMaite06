/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package packControl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author USUARIO
 */
public class DatabaseConnection {

    // Definimos los par�metros de conexi�n
    private static final String URL = "jdbc:mysql://localhost:3306/vitomaite06";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private static Connection connection = null;

    // M�todo para obtener la conexi�n
    public static Connection getConnection() {
        if (connection == null) {
            try {
                // Establece la conexi�n a la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Conexi�n exitosa a la base de datos.");
            } catch (ClassNotFoundException e) {
                // Manejo de la excepci�n si el controlador no se encuentra
                System.err.println("Error: No se encontr� el controlador JDBC.");
                e.printStackTrace();
            } catch (SQLException e) {
                System.out.println("Error al conectar a la base de datos.");
                e.printStackTrace();
            }
        }
        return connection;
    }

    // M�todo para cerrar la conexi�n
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Conexi�n cerrada.");
            } catch (SQLException e) {
                  System.out.println("Error al cerrar la conexi�n.");
                e.printStackTrace();
            }
        }
    }
}
