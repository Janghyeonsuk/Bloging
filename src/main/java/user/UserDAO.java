package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection connection;
	private PreparedStatement preparedstatement;
	private ResultSet result;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/WEBDATABASE?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "jhs993010!";

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbID, dbPassword);
																				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?)";

		try {
			preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setString(1, user.getUserID());
			preparedstatement.setString(2, user.getUserPassword());
			preparedstatement.setString(3, user.getUserName());

			// INSERT문의 경우, 성공일 경우 0 이상의 숫자가 반환됨.
			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터 베이스 오류일 때
	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";

		try {
			preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setString(1, userID);
			result = preparedstatement.executeQuery(); // 쿼리 실행 결과는 담는 변수

			if (result.next()) { // 쿼리 실행 결과 데이터가 존재하면 해당 영역이 실행
				if (result.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 로그인 실패(비밀번호 불일치)
			}
			return -1; // ID가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -2; // -2는 데이터베이스 오류를 의미함.
	}

	public String getName(String userID) {
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setString(1, userID);
			result = preparedstatement.executeQuery();
			result.next();
			return result.getString("userName");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}