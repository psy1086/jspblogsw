package user;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import boder.BoderDTO;
import util.DButil;

public class UserDAO {
	public int login(String userId, String userPassword) {
		String SQL="SELECT userPassword FROM USER WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();	
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; 
				}
				else {
					return 0; 
				}
			}
			return -1; 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
			return -2; 
	}
	
	public int join(UserDTO user) {
		String SQL="INSERT INTO USER VALUES (?, ?, ?, ?, ?, false)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserEmailHash());
			return pstmt.executeUpdate();	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
			return -1; 
	}
	
	public String getUserEmail(String userId) {
		String SQL="SELECT userEmail FROM USER WHERE userId =?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
			return null; 
	}
	
	public boolean getUserEmailChecked(String userId) {
		String SQL="SELECT userEmailChecked FROM USER WHERE userId =?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getBoolean(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
			return false; 
	}
	
	public boolean setUserEmailChecked(String userId) {
		String SQL="UPDATE USER SET userEmailChecked = true WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
			return false;
	}

	public int delete(String user) {
		String SQL="DELETE FROM user WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
			return -1;
	}
	
	public ArrayList<UserDTO> userList() {
		ArrayList<UserDTO> userList = null;
		String SQL ="SELECT * FROM user";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			userList = new ArrayList<UserDTO>();
			while(rs.next()) {
				UserDTO userDTO = new UserDTO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getBoolean(6)
						);
				userList.add(userDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return userList;
	}
}