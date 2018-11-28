package gallery;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBOpen;
import db.DBclose;

import java.sql.*;



public class GalleryDAO {
	public boolean create(GalleryDTO dto) {
		boolean flag = false;
		
		
		return flag;
	}
	
	public GalleryDTO read(int gno) {
		GalleryDTO dto = null; 
		
		
		return dto;
	}
	
	public boolean update(GalleryDTO dto) {
		boolean flag = false;
		
		
		return flag;
	}
	
	public boolean passwdCheck(Map map) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		
		int gno = (Integer) map.get("gno");
		String pw = (String) map.get("pw");
		
		sql.append(" select count(gno) as cnt ");
		sql.append(" from gallery ");
		sql.append(" where gno=? and pw=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gno);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			if (rs.getInt("cnt") == 1)
				
				flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public boolean delete(int gno) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete  from gallery ");
		sql.append(" where gno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, gno);
				
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0 ) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}DBclose.close(pstmt, con);
		
		
		
		
		
		return flag;
	}
	
	public List<GalleryDTO> list(Map map) {
		List<GalleryDTO> list = new ArrayList<GalleryDTO>();
		
		
		return list;
	}
}

