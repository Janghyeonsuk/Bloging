package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection connection;
	private ResultSet result;

	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/WEBDATABASE?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPW = "jhs993010!";

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbID, dbPW);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			result = preparedstatement.executeQuery();

			if (result.next())
				return result.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	public int getNextID() {
		String SQL = "SELECT boardID from BOARD ORDER BY boardID DESC";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			result = preparedstatement.executeQuery();

			if (result.next())
				return result.getInt(1) + 1;

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO BOARD VALUES (?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setInt(1, getNextID());
			preparedstatement.setString(2, boardTitle);
			preparedstatement.setString(3, userID);
			preparedstatement.setString(4, getDate());
			preparedstatement.setString(5, boardContent);
			preparedstatement.setInt(6, 1);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	public ArrayList<Board> getList(int pageNumber) {
		String SQL = "SELECT * FROM BOARD WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10";
		ArrayList<Board> boardList = new ArrayList<Board>();

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setInt(1, getNextID() - ((pageNumber - 1) * 10));
			result = preparedstatement.executeQuery();

			while (result.next()) {
				Board board = new Board();
				board.setBoardID(result.getInt(1));
				board.setBoardTitle(result.getString(2));
				board.setUserID(result.getString(3));
				board.setBoardDate(result.getString(4));
				board.setBoardContent(result.getString(5));
				board.setBoardAvailable(result.getInt(6));
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BOARD WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setInt(1, getNextID() - ((pageNumber - 1) * 10));
			result = preparedstatement.executeQuery();

			while (result.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Board getBoard(int boardID) {
		String SQL = "SELECT * FROM BOARD WHERE boardID = ?";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setInt(1, boardID);
			result = preparedstatement.executeQuery();

			if (result.next()) {
				Board board = new Board();
				board.setBoardID(result.getInt(1));
				board.setBoardTitle(result.getString(2));
				board.setUserID(result.getString(3));
				board.setBoardDate(result.getString(4));
				board.setBoardContent(result.getString(5));
				board.setBoardAvailable(result.getInt(6));
				return board;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int modify(int boardID, String boardTitle, String boardContent) {
		String SQL = "UPDATE BOARD SET boardTitle = ? , boardContent = ? WHERE boardID = ?";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setString(1, boardTitle);
			preparedstatement.setString(2, boardContent);
			preparedstatement.setInt(3, boardID);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	
	public int unavailable() {
		String SQL = "UPDATE BOARD SET boardAvailable = 0";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	
	public int available() {
		String SQL = "UPDATE BOARD SET boardAvailable = 1";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	
	public int delete(int boardID) {
		String SQL = "DELETE FROM BOARD WHERE boardID = ?";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setInt(1, boardID);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
}