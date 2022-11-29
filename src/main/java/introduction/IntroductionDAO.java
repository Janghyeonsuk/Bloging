package introduction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class IntroductionDAO {
	private Connection connection;
	private PreparedStatement preparedstatement;
	private ResultSet result;

	public IntroductionDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/WEBDATABASE?useUnicode=true&characterEncoding=UTF-8";
			String dbID = "root";
			String dbPassword = "jhs993010!";

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Introduction getIntro(String userID) {
		String SQL = "SELECT * FROM INTRODUCTION WHERE userID = ?";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setString(1, userID);
			result = preparedstatement.executeQuery();
			
			if(result.next()) {
			Introduction intro = new Introduction();
			intro.setUserID(result.getString(1));
			intro.setIntroContent(result.getString(2));
			return intro;
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int write(String userID, String IntroductionContent) {
		String SQL = "INSERT INTO INTRODUCTION VALUES (?, ?)";

		try {
			preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setString(1, userID);
			preparedstatement.setString(2, IntroductionContent);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	
	public int modify(String userID, String introContent) {
		String SQL = "UPDATE INTRODUCTION SET introContent = ? WHERE userID = ?";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setString(1, introContent);
			preparedstatement.setString(2, userID);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
}
