package member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import address.AddressDTO;

public class memberTEST {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
	
		//create(dao);
		//read(dao);
		update(dao);
		//delete(dao);
		//list(dao);
	}



	//create
	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setId("id");    
		dto.setPasswd("9876"); 
		dto.setMname("천이진");  
		dto.setTel("010-4040-4400");    
		dto.setEmail("cheon@hanmail.net");  
		dto.setZipcode("03749");
		dto.setAddress1("01010101010");
		dto.setAddress2("03030303");
		dto.setJob("취준생")   ;
		dto.setFname("ijin.jpg");
		dto.setGrade("A");
		if(dao.create(dto)){
			p("성공");
		}else {
			p("실패");
		}
		
	}

	//read
	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user6");
		p(dto);
		
	}

	//update
	private static void update(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		Map map=new HashMap();
		map.put("id","user6");
		map.put("passwd", "123");
		
		if(dao.updatePw(map)) {
			p("비밀번호 변경");
		}else {
			p("변경 실패");
		}
				
				
				
				
				
		
		
	}

	//delete
	private static void delete(MemberDAO dao) {
		if(dao.delete("user1")) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	//list
	private static void list(MemberDAO dao) {
		Map map= new HashMap();

		map.put("col","id");
		map.put("word","id");
		map.put("sno",1);
		map.put("eno",5);
	
		List<MemberDTO> list = dao.list(map);
		Iterator<MemberDTO> iter = list.iterator();
		while(iter.hasNext()) {
			MemberDTO dto = iter.next();
			p(dto);
			p("=======================");
		}
	}
	
	
	private static void p(MemberDTO dto) {
		p("id: "+dto.getId());
		p("passwd: "+dto.getPasswd());
		p("name: "+dto.getMname());
		p("tel: "+dto.getTel());
		p("email: "+dto.getEmail());
		p("zipcode: "+dto.getZipcode());
		p("address1: "+dto.getAddress1());
		p("address2: "+dto.getAddress2());
		p("job: "+dto.getJob());
		p("mdate: "+dto.getMdate());
		p("fname: "+dto.getFname());
		p("grade: "+dto.getGrade());
		
	}


	private static void p(String string) {
		System.out.println(string);
		
	}

}
