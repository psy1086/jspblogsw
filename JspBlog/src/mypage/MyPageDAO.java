package mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DButil;


public class MyPageDAO {
	public int mylogin(String userId, String userPassword) {
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
	public ArrayList<MyPageDTO> getMy (String userId) {
		ArrayList<MyPageDTO> myList = null;
		String SQL = "SELECT userName, userPassword, userEmail FROM user WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			myList = new ArrayList<MyPageDTO>();
			while(rs.next()) {
				MyPageDTO myPageDTO = new MyPageDTO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3)
						);
				myList.add(myPageDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return myList;
	}
	
	public int setReWrite(String userName, String userPassword, String userEmail, String userId) {
		String SQL="UPDATE USER SET userName = ?, userPassword = ?, userEmail = ? WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userEmail);
			pstmt.setString(4, userId);
			pstmt.executeUpdate();
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
			return -1;
	}
	public int secession(String userId) {
		String SQL ="DELETE FROM user WHERE userId = ?";
		String SQL2 = "DELETE FROM boder WHERE userId =?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt2 = conn.prepareStatement(SQL2);
			pstmt.setString(1, userId);
			pstmt2.setString(1, userId);
			pstmt.executeUpdate();
			pstmt2.executeUpdate();
			return 1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
}
