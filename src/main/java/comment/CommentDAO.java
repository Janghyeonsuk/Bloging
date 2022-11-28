package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
	private ArrayList<Comment> listOfComments = new ArrayList<Comment>();
	private Connection connection;
	private ResultSet result;

	public CommentDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/WEBDATABASE";
			String dbID = "root";
			String dbPassword = "jhs993010!";

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Comment getComment(int commentID) {
		String SQL = "SELECT * FROM COMMENT WHERE commentID = ?";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setInt(1, commentID);
			result = preparedstatement.executeQuery();

			if (result.next()) {
				Comment comment = new Comment();
				comment.setCommentID(result.getInt(1));
				comment.setBlogID(result.getInt(2));
				comment.setUserID(result.getString(3));
				comment.setCommentContent(result.getString(4));
				return comment;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getNextID() {
		String SQL = "SELECT commentID from COMMENT ORDER BY commentID DESC";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			result = preparedstatement.executeQuery();

			if (result.next())
				return result.getInt(1) + 1;

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // DB 오류
	}

	public ArrayList<Comment> getList() {
		String SQL = "SELECT * FROM COMMENT ORDER BY commentID DESC";
		ArrayList<Comment> commentList = new ArrayList<Comment>();

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			result = preparedstatement.executeQuery();

			while (result.next()) {
				Comment comment = new Comment();
				comment.setCommentID(result.getInt(1));
				comment.setBlogID(result.getInt(2));
				comment.setUserID(result.getString(3));
				comment.setCommentContent(result.getString(4));

				commentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return commentList;
	}

	public ArrayList<Comment> getComments() {
		return listOfComments;
	}

	public int write(int blogID, String userID, String commentContent) {
		String SQL = "INSERT INTO COMMENT VALUES (?, ?, ?, ?)";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setInt(1, getNextID());
			preparedstatement.setInt(2, blogID);
			preparedstatement.setString(3, userID);
			preparedstatement.setString(4, commentContent);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	public int delete(int commentID) {
		String SQL = "DELETE FROM COMMENT WHERE commentID = ?";

		try {
			PreparedStatement preparedstatement = connection.prepareStatement(SQL);
			preparedstatement.setInt(1, commentID);

			return preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

}
