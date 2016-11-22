import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.*;

/**
 * Loads the order database using code.
 *I'm putting this comment here - Duncan
 */
public class Load {
	public static void main(String[] argv) throws Exception {
		loadData();
	}

	public static void loadData() throws Exception {
		// TODO: Fill-in
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_dolychuc;";
		String uid = "dolychuc";
		String pw = "42686155";

		System.out.println("Connecting to database.");

		Connection con = DriverManager.getConnection(url, uid, pw);

		String fileName = "Data/Schema.sql";

		try {
			// Create statement
			Statement stmt = con.createStatement();

			Scanner scanner = new Scanner(new File(fileName));
			// Read commands separated by ;
			scanner.useDelimiter(";");
			while (scanner.hasNext()) {
				String command = scanner.next();
				if (command.trim().equals(""))
					continue;
				System.out.println(command); // Uncomment if want to see
												// commands executed
				try {
					stmt.execute(command);
				} catch (Exception e) { // Keep running on exception. This is
										// mostly for DROP TABLE if table does
										// not exist.
					System.out.println(e);
				}
			}
			scanner.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
