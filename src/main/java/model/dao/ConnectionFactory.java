package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import model.ModelException;

public class ConnectionFactory {

	private static final String JDBC_DRIVER_NAME = "org.postgresql.Driver";

	// Valores padrão; podem ser sobrescritos pelas variáveis de ambiente
	// DB_URL, DB_USER e DB_PASSWORD
	private static final String DATABASE_URL =
			env("DB_URL", "jdbc:postgresql://localhost:5432/facebook");

	// Credenciais
	static final String USER = env("DB_USER", "postgres");
	static final String PASSWORD = env("DB_PASSWORD", "postgres");

	public static Connection getConnection() throws ModelException {
		try {
			Class.forName(JDBC_DRIVER_NAME);

			// Cria uma conexão com o Banco de Dados
			return DriverManager.getConnection(
					DATABASE_URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			throw new ModelException("Driver não encontrado", e);
		} catch (SQLException e) {
			throw new ModelException("Falha na conexão com o BD", e);
		}
	}

	private static String env(String name, String defaultValue) {
		String value = System.getenv(name);
		return (value == null || value.isBlank()) ? defaultValue : value;
	}
}
