package team;

import java.util.List;

public class TeamTest {

	public static void main(String[] args) {
		TeamDAO dao = new TeamDAO();
		
		//list(dao);
		//create(dao);
        //read(dao);
        //update(dao); 
          delete(dao);
          
          }

	private static void delete(TeamDAO dao) {
		if(dao.delete(2)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void update(TeamDAO dao) {
		TeamDTO dto = dao.read(4);
		dto.setSkills("Java,JSP");
		dto.setHobby("영화");
		dto.setPhone("010-1234-5678");
		dto.setAddress("서울 특별시");
		dto.setAddress2("123");
		dto.setZipcode("00000");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void read(TeamDAO dao) {
		TeamDTO dto = dao.read(4);
		p(dto); 
		
	}

	private static void create(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		dto.setName("홍길동");
		dto.setGender("남자");
		dto.setHobby("게임");
		dto.setPhone("010-1234-5678");
		dto.setSkills("Java");
		dto.setZipcode("12345");
		dto.setAddress("서울시 관악구 신림동");
		dto.setAddress2("한국 어딘가");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void list(TeamDAO dao) {
	    List<TeamDTO> list = dao.list();
		
	    for(int i=0; i<list.size(); i++) {
	    	TeamDTO dto = list.get(i);
	    	
	    	p(dto);
	    	p("──────────────────");
	    	
	    }
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(TeamDTO dto) {
		p("번호:"+dto.getNo());
		p("이름:"+dto.getName());
		p("성별:"+dto.getGender());
		p("보유기술:"+dto.getSkills());
		p("전화번호:"+dto.getPhone());
		
		p("━━━━━━━━━━━━━━━━━━");
		
		p("취미:"+dto.getHobby());
		p("우편번호:"+dto.getZipcode());
		p("주소:"+dto.getAddress());
		p("주소2:"+dto.getAddress2());
	}

}
