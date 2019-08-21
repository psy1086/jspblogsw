package boder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DButil;

public class BoderDAO {
	
	public int write(BoderDTO boderDTO) {
		String SQL="INSERT INTO boder VALUES (NULL,?,?,?,now(),0)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boderDTO.getUserId());
			pstmt.setString(2, boderDTO.getBodertitle());
			pstmt.setString(3, boderDTO.getBodercontent());
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
	
	public ArrayList<BoderDTO> getList (int pageNumber) {
		ArrayList<BoderDTO> boderList = null;
		String SQL = "SELECT * FROM boder ORDER BY boderID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6 ;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			boderList = new ArrayList<BoderDTO>();
			while(rs.next()) {
				BoderDTO boderDTO = new BoderDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6)
						);
				boderList.add(boderDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return boderList;
	}
	
	public int delete(String boderId) {
		String SQL="DELETE FROM boder WHERE boderId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(boderId));
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
	
	public String getUserId(String boderId) {
		String SQL="SELECT userID FROM boder WHERE boderId =?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(boderId));
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
	
	public String boderView(int boderId) {
		String SQL = "SELECT boderTitle FROM boder WHERE boderId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boderId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	public String boderView2(int boderId) {
		String SQL = "SELECT boderTitle FROM boder WHERE boderId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boderId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	public int like(String boderId) {
		String SQL = "UPDATE boder SET likeCount = likeCount + 1 WHERE boderId = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(boderId));
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
}

