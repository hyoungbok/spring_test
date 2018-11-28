package img;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import db.DBOpen;
import db.DBclose;

public class ImgDAO {
	
	public boolean update(ImgDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update img ");
		sql.append(" set name =?, ");
		sql.append(" title=?, ");
		sql.append(" fname=? ");
		sql.append(" where no=? ");
		 
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getFname());
			pstmt.setInt(4, dto.getNo());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(pstmt, con);
		}
		
		
		return flag;
	}


	
	public boolean passCheck(Map map) {
		boolean flag= false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int no = (Integer)map.get("no");
		String passwd = (String)map.get("passwd");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(no) as cnt ");
		sql.append(" FROM img ");
		sql.append(" WHERE no=? AND passwd=? ");
		 
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if(cnt>0)flag=true;
			} 
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBclose.close(rs, pstmt, con);
		}
		 
		
		return flag;
	}
	

	public boolean create(ImgDTO dto) {
		boolean flag=false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into img(no, name, title,passwd, mdate,fname, grpno) ");
		sql.append(" values((select nvl(max(no),0)+1 from img), ");
		sql.append(" ?,?,?,sysdate,?,(select nvl(max(grpno),0)+1 from img)) ");
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFname());
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(pstmt, con);
		}
		
		
		return flag;
		
		
		
	}
	
	
	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from img ");
		sql.append(" where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(pstmt, con);
		}

		return flag;
	}


		public int total(Map map) {
			int total=0;
			
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String col = (String) map.get("col");
			String word = (String) map.get("word");
			int sno = (int) map.get("sno");
			int eno = (int) map.get("eno");
			
			StringBuffer sql = new StringBuffer();
			sql.append(" select count(*) from img ");
			if(word.trim().length()>0) {
				sql.append(" 	where "+col+" like '%'||?||'%' ");
				}
			
			try {
				pstmt=con.prepareStatement(sql.toString());
				if(word.trim().length()>0) {
					pstmt.setString(1, word);
				}
				rs=pstmt.executeQuery();
				
				rs.next();
				total = rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return total;
		}
		
		public List<ImgDTO> list(Map map){
			List<ImgDTO> list = new ArrayList();
			
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String col = (String) map.get("col");
			String word = (String) map.get("word");
			int sno = (int) map.get("sno");
			int eno = (int) map.get("eno");
			
			StringBuffer sql = new StringBuffer();
			sql.append(" select no, name, title, mdate, fname,indent, r ");
			sql.append(" from( ");
			sql.append(" 	select no, name, title, mdate, fname,indent, rownum r ");
			sql.append(" 	from( ");
			sql.append(" 		select no, name, title, mdate, fname,indent from img ");
			if(word.trim().length()>0) {
			sql.append(" 		where "+col+" like '%'||?||'%' ");
			}
			sql.append(" 		order by grpno desc, ansnum ");
			sql.append(" 		) ");
			sql.append(" 	)where r>=? and r<=? ");
			
			int i =0;
			try {
				pstmt=con.prepareStatement(sql.toString());
				if(word.trim().length()>0) {
				pstmt.setString(++i, word);
					}
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
				
				rs= pstmt.executeQuery();
				
				while(rs.next()) {
					ImgDTO dto = new ImgDTO();
					dto.setNo(rs.getInt("no"));
					dto.setName(rs.getString("name"));
					
					dto.setTitle(rs.getString("title"));
					dto.setMdate(rs.getString("mdate"));
					dto.setFname(rs.getString("fname"));
					dto.setIndent(rs.getInt("indent"));
					
					
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBclose.close(rs, pstmt, con);
			}
			
			return list;
		}


	
	public ImgDTO read(int no) {
		ImgDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, name, title, fname ");
		sql.append(" from img ");
		sql.append(" where no=? ");

		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto = new ImgDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setFname(rs.getString("fname"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(rs, pstmt, con);
			
		}
		
		return dto;
	}

	public List Imgread(int no) {
		List list = new ArrayList();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs= null;
/*		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");*/
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select * from ( ");
		sql.append(" 				select lag(no, 2) over(order by no) pre_no2, ");
		sql.append(" 					   lag(no, 1) over(order by no) pre_no1, ");
		sql.append(" 				       no, ");
		sql.append(" 				       lead(no, 1) over(order by no) po_no1, ");
		sql.append(" 				       lead(no, 2) over(order by no) po_no2, ");
		sql.append(" 				       lag(fname, 2) over(order by no) pre_fname2, ");
		sql.append(" 				       lag(fname, 1) over(order by no) pre_fname1, ");
		sql.append(" 				       fname, ");
		sql.append(" 				       lead(fname, 1) over(order by no) po_fname1, ");
		sql.append(" 				       lead(fname, 2) over(order by no) po_fname2 ");
		sql.append(" 			from( ");
		sql.append(" 					select no, fname, name, title  ");
		sql.append(" 					from img  ");
		sql.append(" 					order by no desc ");
		sql.append(" 			) ");
		sql.append(" )where no=? ");
		

		try {
			pstmt=con.prepareStatement(sql.toString());
//			if(word.trim().length()>0)
//			pstmt.setString(++i, word);
//			pstmt.setInt(++i, sno);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int [] no1 = {
						rs.getInt("pre_no2"),
						rs.getInt("pre_no1"),
						rs.getInt("no"),
						rs.getInt("po_no1"),
						rs.getInt("po_no2")
						
				};
				String[] fname1 = {
						rs.getString("pre_fname2"),
					rs.getString("pre_fname1"),
					rs.getString("fname"),
					rs.getString("po_fname1"),
					rs.getString("po_fname2")
					
				};
				list.add(no1);
				list.add(fname1);
				
	
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(rs, pstmt, con);
			
		}
		
		return list;
	}
	
}
