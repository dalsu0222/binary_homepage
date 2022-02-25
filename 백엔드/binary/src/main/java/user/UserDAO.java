package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USERINFO WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int changePassword(String userID, String userName, String userPassword, String userPassword2) {
		String SQL1 = "SELECT userName FROM USERINFO WHERE userID = ?";
		String SQL2 = "UPDATE USERINFO SET userPassword = ? WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userName)) {
					if(userPassword.equals(userPassword2)) {
						pstmt = conn.prepareStatement(SQL2);
						pstmt.setString(1, userPassword2);
						pstmt.setString(2, userID);
						return pstmt.executeUpdate(); // 비밀번호 변경 성공
					}
					else {
						return -3; // 비밀번호 불일치
					}
				}
				else
					return 0; // 아이디, 이름 불일치
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
}
