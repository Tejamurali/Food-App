String host = System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";
String port = System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "3306";
String database = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "foodapp_db";
String user = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
String password = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "";
