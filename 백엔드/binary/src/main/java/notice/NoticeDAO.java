package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public NoticeDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1522/xe";
			String dbID = "JEFFSEP";
			String dbPassword = "gang3535";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT SYSDATE FROM DUAL";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT noticeNum FROM NOTICE ORDER BY noticeNum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String noticeTitle, String userID, String noticeContent) {
		String SQL = "INSERT INTO NOTICE VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, noticeTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, noticeContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Notice> getList(int pageNumber){
		String SQL = "SELECT * FROM (SELECT * FROM NOTICE WHERE noticeNum < ? AND noticeAvailable = 1 ORDER BY noticeNum DESC) WHERE ROWNUM <= 10";
		ArrayList<Notice> list = new ArrayList<Notice>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeNum(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setUserID(rs.getString(3));
				notice.setNoticeDate(rs.getString(4));
				notice.setNoticeContent(rs.getString(5));
				notice.setNoticeAvailable(rs.getString(6));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // 데이터베이스 오류
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM NOTICE WHERE noticeNum < ? AND noticeAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류
	}
	
}
