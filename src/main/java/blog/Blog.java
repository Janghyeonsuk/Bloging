package blog;

import java.util.ArrayList;

public class Blog {
	private int blogID;
	private String userID;			
	private String blogDate;
	private String mainTitle;	
	private String mainContent;
	private String serveTitle;	
	private String serveContent;
	private String fileName;
	private int blogAvailable;
	
	public int getBlogID() {
		return blogID;
	}
	public void setBlogID(int blogID) {
		this.blogID = blogID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBlogDate() {
		return blogDate;
	}
	public void setBlogDate(String blogDate) {
		this.blogDate = blogDate;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public String getMainContent() {
		return mainContent;
	}
	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}
	public String getServeTitle() {
		return serveTitle;
	}
	public void setServeTitle(String serveTitle) {
		this.serveTitle = serveTitle;
	}
	public String getServeContent() {
		return serveContent;
	}
	public void setServeContent(String serveContent) {
		this.serveContent = serveContent;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getBlogAvailable() {
		return blogAvailable;
	}
	public void setBlogAvailable(int blogAvailable) {
		this.blogAvailable = blogAvailable;
	}
	
}
