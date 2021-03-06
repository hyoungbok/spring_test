package address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBOpen;
import db.DBclose;
import team.TeamDTO;

public class AddressDAO {
	
	public boolean checkRefnum(int no) {
		boolean flag= false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum) ");
		sql.append(" from address ");
		sql.append(" where refnum=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int cnt = rs.getInt(1);
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(rs, pstmt, con);
		}
		
		
		return flag;
		
	}
	
	public boolean replyCreate(AddressDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into address ");
		sql.append(" (no, name, phone, zipcode, address, address2, grpno, indent, ansnum, refnum) ");
		sql.append(" values((select nvl(max(no),0) +1 from address), ");
		sql.append(" ?,?,?,?,?,?,?,?,?) ");
		 
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setInt(6, dto.getGrpno());
			pstmt.setInt(7, dto.getIndent()+1);
			pstmt.setInt(8, dto.getAnsnum()+1);
			pstmt.setInt(9, dto.getNo());
			
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

	
	
	public void upAnsnum(Map map) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		
		sql.append(" update address ");
		sql.append(" set ansnum = ansnum +1 ");
		sql.append(" where grpno = ? and ansnum > ? ");
	
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(pstmt, con);
		}
	}
	
	public AddressDTO replyRead(int no) {
		AddressDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, name, grpno, indent, ansnum ");
		sql.append(" from address ");
		sql.append(" where no= ? ");
		
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			dto = new AddressDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setGrpno(rs.getInt("grpno"));
			dto.setIndent(rs.getInt("indent"));
			dto.setAnsnum(rs.getInt("ansnum"));
					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}DBclose.close(rs, pstmt, con);
		
		return dto;
	}
	
	public AddressDTO read(int no) {
		AddressDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		StringBuffer sql = new StringBuffer();
		sql.append(" select*from address ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new AddressDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress2(rs.getString("address2"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	
	public boolean create(AddressDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into address ");
		sql.append(" (no, name, phone, zipcode, address, address2,grpno) ");
		sql.append(" values((select nvl(max(no),0)+1 from address), ");
		sql.append(" ?,?,?,?,?, ");
		sql.append(" (select nvl(max(grpno),0)+1 from address) ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddress2());
			
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

		public boolean update(AddressDTO dto) {
			
			boolean flag = false;
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			
			StringBuffer sql = new StringBuffer();
			sql.append(" update address ");
			sql.append(" set phone 		= ? , ");
			sql.append(" 	zipcode 	= ? , ");
			sql.append(" 	address 	= ? , ");
			sql.append(" 	address2	= ? ");
			sql.append(" where no 	= ? ");
			
	
			try {
				pstmt = con.prepareStatement(sql.toString());
				
				pstmt.setString(1, dto.getPhone());
				pstmt.setString(2, dto.getZipcode());
				pstmt.setString(3, dto.getAddress2());
				pstmt.setString(4, dto.getAddress2());
				pstmt.setInt(5, dto.getNo());
				
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
		
		public boolean delete(int no) {
			boolean flag = false;
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			
			StringBuffer sql = new StringBuffer();
			sql.append(" delete from address ");
			sql.append(" where no = ? ");
			
			try {
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, no);
				
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
		
		public int total(Map map) {
			int total = 0;
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String col = (String)map.get("col");
			String word = (String)map.get("word");
			
			StringBuffer sql = new StringBuffer();
			sql.append(" select count(*) from address ");
			if(word.trim().length() > 0)
				sql.append(" where " +col+ " like '%'||?||'%' ");
			
			try {
				pstmt = con.prepareStatement(sql.toString());
					if(word.trim().length() > 0)
						pstmt.setString(1, word);
					
					rs = pstmt.executeQuery();
					
					rs.next();
					
					total = rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBclose.close(rs, pstmt, con);
			}
			return total;
		}
		
		public List<AddressDTO> list(Map map){
			List<AddressDTO> list = new ArrayList<AddressDTO>();
			Connection con = DBOpen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String col = (String)map.get("col");
			String word = (String)map.get("word");
			int sno = (Integer)map.get("sno");
			int eno = (Integer)map.get("eno");
			
			StringBuffer sql = new StringBuffer();
			sql.append(" 	select no, name, phone, grpno, indent, ansnum, r  ");
			sql.append(" 	from( ");
			sql.append(" 	select no, name, phone, grpno, indent, ansnum, rownum as r ");
			sql.append(" 	from( ");
			sql.append(" 	select no, name, phone, grpno, indent, ansnum  ");
			sql.append(" 	from address ");
			if(word.trim().length()>0)
				sql.append(" 	where "+col+" like '%'||?||'%' ");
			sql.append(" 	order by grpno desc, ansnum ");
			sql.append(" 	) ");
			sql.append(" 	) ");
			sql.append(" where r>=? and r<=? ");

			int i =0;
			try {
				pstmt = con.prepareStatement(sql.toString());
				if(word.trim().length()>0)
					pstmt.setString(++i, word);
				
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
				
				rs= pstmt.executeQuery();
				
				
				
				while(rs.next()){
					AddressDTO dto = new AddressDTO();
					dto.setNo(rs.getInt("No"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setGrpno(rs.getInt("grpno"));
					dto.setIndent(rs.getInt("indent"));
					dto.setAnsnum(rs.getInt("ansnum"));
					 
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
}