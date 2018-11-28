package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBOpen;
import db.DBclose;



public class MemberDAO {
	
	public String getGrade(String id) {
		String grade = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade from member ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
				pstmt.setString(1, id);
				
			rs = pstmt.executeQuery();	
			
			if(rs.next()) {
				grade = rs.getString("grade");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			DBclose.close(rs, pstmt, con);
		}
		
		
		return grade;
	}

	public boolean loginCheck(Map map) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String id = (String) map.get("id");
		String pw = (String) map.get("pw");

		System.out.println(id);
		System.out.println(pw);

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member ");
		sql.append(" where id =? and passwd = ? ");
		sql.append("  ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0)
					flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBclose.close(rs, pstmt, con);

		return flag;
	}

	public String getFname(String id) {
		String fname = null;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select fname from member ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				fname = rs.getString("fname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(rs, pstmt, con);
		}

		return fname;
	}

	public boolean dubplicatepw(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String npasswd = (String) map.get("npasswd");
		String id = (String) map.get("id");
		System.out.println(id);
		System.out.println(npasswd);
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(passwd) from member ");
		sql.append(" where id = ? and passwd = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, npasswd);

			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(rs, pstmt, con);
		}

		return flag;
	}

	// updatePw
	public boolean updatePw(Map map) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String passwd = (String) map.get("passwd");
		String id = (String) map.get("id");

		StringBuffer sql = new StringBuffer();
		sql.append(" update member ");
		sql.append(" set passwd = ? ");
		sql.append(" where id = ? ");
		System.out.println(id);
		System.out.println(passwd);
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(pstmt, con);
		}

		return flag;
	}

	// updateFile
	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String fname = (String) map.get("fname");
		String id = (String) map.get("id");

		StringBuffer sql = new StringBuffer();
		sql.append(" update member ");
		sql.append(" set fname = ? ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);

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

	// 이메일 중복검사
	public boolean duplicatedEmail(String email) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(email) ");
		sql.append(" from member ");
		sql.append(" where email = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0)
					flag = true; // 중복된 이메일이다.
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(rs, pstmt, con);
		}

		return flag;
	}

	// 아이디 중복검사
	public boolean dubplicateId(String id) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) ");
		sql.append(" from member ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0)
					flag = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(rs, pstmt, con);
		}

		return flag;
	}

	// create
	public boolean create(MemberDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" insert into member(id, passwd, mname, tel, email, zipcode, ");
		sql.append(" address1, address2, job, mdate, fname, grade) ");
		sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, 'H') ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getFname());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBclose.close(pstmt, con);

		return flag;

	}

	// read
	public MemberDTO read(String id) {
		MemberDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select id, passwd, mname, tel, email, zipcode, ");
		sql.append(" address1, address2, job, mdate, fname, grade ");
		sql.append(" from member ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				dto.setGrade(rs.getString("grade"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(rs, pstmt, con);
		}

		return dto;

	}
	// update

	public boolean update(MemberDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" update member  	   ");
		sql.append(" set    ");
		sql.append(" 	    tel	     =?,   ");
		sql.append(" 	    email	 =?,   ");
		sql.append(" 	    zipcode  =?,   ");
		sql.append(" 	    address1 =?,   ");
		sql.append(" 	    address2 =?,   ");
		sql.append("        job      =?    ");
		sql.append(" where  id       =?    ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getId());

			int cnt = pstmt.executeUpdate();
			System.out.println(dto.getId());
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(pstmt, con);
		}

		return flag;
	}

	// delete
	public boolean delete(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" delete from member ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

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

	// total
	public int total(Map map) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member ");
		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%' ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0) {
				pstmt.setString(1, word);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(rs, pstmt, con);
		}
		return total;

	}

	// list
	public List<MemberDTO> list(Map map) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append(" select id, mname, tel, email, zipcode, address1, address2, ");
		sql.append(" fname, r ");
		sql.append(" 	from( ");
		sql.append(" 	select id, mname, tel, email, zipcode, address1, address2, ");
		sql.append(" 	fname, rownum as r ");
		sql.append(" 		from( ");
		sql.append(" 		select id, mname, tel, email, zipcode, address1, address2, ");
		sql.append(" 		fname ");
		sql.append(" 		from member ");
		if (word.trim().length() > 0)
			sql.append(" 			where " + col + " like '%'||?||'%' ");
		sql.append(" 			order by mdate desc ");
		sql.append("         ) ");
		sql.append(" )where r >= ? and r <=? ");

		int i = 0;

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setFname(rs.getString("fname"));

				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(rs, pstmt, con);
		}

		return list;
	}

}
