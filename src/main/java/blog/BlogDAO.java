package blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BlogDAO {
	private ArrayList<Blog> listOfBlogs = new ArrayList<Blog>();
	private Connection connection;
	private ResultSet result;

	public BlogDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/WEBDATABASE?useUnicode=true&characterEncoding=UTF-8";
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
			String SQL = "SELECT blogID from BLOG ORDER BY blogID DESC";

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
		
		public int write(String mainTitle, String mainContent, String userID,String serveTitle, String serveContent, String fileName) {
			String SQL = "INSERT INTO Blog VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

			try {
				PreparedStatement preparedstatement = connection.prepareStatement(SQL);
				preparedstatement.setInt(1, getNextID());
				preparedstatement.setString(2, userID);
				preparedstatement.setString(3, getDate());
				preparedstatement.setString(4, mainTitle);
				preparedstatement.setString(5, mainContent);
				preparedstatement.setString(6, serveTitle);
				preparedstatement.setString(7, serveContent);
				preparedstatement.setString(8, fileName);
				preparedstatement.setInt(9, 1);

				return preparedstatement.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

			return -1;
		}
		
		public ArrayList<Blog> getList(int pageNumber) {
			String SQL = "SELECT * FROM BLOG WHERE blogID < ? AND blogAvailable = 1 ORDER BY blogID DESC LIMIT 3";
			ArrayList<Blog> blogList = new ArrayList<Blog>();

			try {
				PreparedStatement preparedstatement = connection.prepareStatement(SQL);
				preparedstatement.setInt(1, getNextID() - ((pageNumber - 1) * 3));
				result = preparedstatement.executeQuery();

				while (result.next()) {
					Blog blog = new Blog();
					blog.setBlogID(result.getInt(1));
					blog.setUserID(result.getString(2));
					blog.setBlogDate(result.getString(3));
					blog.setMainTitle(result.getString(4));
					blog.setMainContent(result.getString(5));
					blog.setServeTitle(result.getString(6));
					blog.setServeContent(result.getString(7));
					blog.setFileName(result.getString(8));
					blog.setBlogAvailable(result.getInt(9));
					blogList.add(blog);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return blogList;
		}

		public boolean nextPage(int pageNumber) {
			String SQL = "SELECT * FROM BLOG WHERE blogID < ? AND blogAvailable = 1 ORDER BY blogID DESC LIMIT 3";

			try {
				PreparedStatement preparedstatement = connection.prepareStatement(SQL);
				preparedstatement.setInt(1, getNextID() - ((pageNumber - 1) * 3));
				result = preparedstatement.executeQuery();

				while (result.next()) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		
		public Blog getBlog(int blogID) {
			String SQL = "SELECT * FROM BLOG WHERE blogID = ?";

			try {
				PreparedStatement preparedstatement = connection.prepareStatement(SQL);
				preparedstatement.setInt(1, blogID);
				result = preparedstatement.executeQuery();

				if (result.next()) {
					Blog blog = new Blog();
					blog.setBlogID(result.getInt(1));
					blog.setUserID(result.getString(2));
					blog.setBlogDate(result.getString(3));
					blog.setMainTitle(result.getString(4));
					blog.setServeTitle(result.getString(5));
					blog.setMainContent(result.getString(6));
					blog.setServeContent(result.getString(7));
					blog.setFileName(result.getString(8));
					blog.setBlogAvailable(result.getInt(9));
					return blog;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}

		public int modify(int blogID, String mainTitle, String mainContent, String serveTitle, String serveContent) {
			String SQL = "UPDATE BLOG SET mainTitle = ? , mainContent = ?, serveTitle = ?, serveContent = ? WHERE blogID = ?";

			try {
				PreparedStatement preparedstatement = connection.prepareStatement(SQL);
				preparedstatement.setString(1, mainTitle);
				preparedstatement.setString(2, mainContent);
				preparedstatement.setString(3, serveTitle);
				preparedstatement.setString(4, serveContent);
				preparedstatement.setInt(5, blogID);

				return preparedstatement.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

			return -1;
		}
		
		public int unavailable() {
			String SQL = "UPDATE BLOG SET blogAvailable = 0";

			try {
				PreparedStatement preparedstatement = connection.prepareStatement(SQL);

				return preparedstatement.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

			return -1;
		}
		
		public int available() {
			String SQL = "UPDATE BLOG SET blogAvailable = 1";

			try {
				PreparedStatement preparedstatement = connection.prepareStatement(SQL);

				return preparedstatement.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

			return -1;
		}
		
		public int delete(int blogID) {
			String SQL = "DELETE FROM BLOG WHERE blogID = ?";

			try {
				PreparedStatement preparedstatement = connection.prepareStatement(SQL);
				preparedstatement.setInt(1, blogID);

				return preparedstatement.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

			return -1;
		}
		
		public ArrayList<Blog> getBlogs() {
			return listOfBlogs;
		}
}
