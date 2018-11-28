package bbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao = new BbsDAO();
		//list(dao);
		//create(dao);
		//read(dao);
		update(dao);
		//delete(dao);
		//updateViewcnt(dao);
		//passwdCheck(dao);
	}

	private static void updateViewcnt(BbsDAO dao) {
		dao.updateViewcnt(1);
		read(dao);
	}

	private static void passwdCheck(BbsDAO dao) {
		Map map = new HashMap();
		map. put("bbsno", 1);
		map. put("passwd", "1234");
		if(dao.passwdCheck(map)) {
			p("삐빅! 비밀번호 일치");
		} else {
			p("삐용삐용삐용! 비밀번호 불일치");
		}
		
	}

	private static void delete(BbsDAO dao) {
		int bbsno = 2;
		if(dao.delete(bbsno)) {
			p("삭제 성공");
		} else {
			p("삭제 실패");
		}
		
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("김정은");
		dto.setTitle("나는 말이야.");
		dto.setContent("한지민이 누군지 알아.");
		dto.setBbsno(2);
		if(dao.update(dto)) {
			p("성공");
		} else {
			p("실패");
		};
		
	}

	private static void read(BbsDAO dao) {
		int bbsno=1;
		BbsDTO dto = dao.read(bbsno);
		p(dto);
		
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("고지원");
		dto.setTitle("저는 말입니다.");
		dto.setContent("한지민이 누군지 몰라요.");
		dto.setPasswd("1234");
		if(dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
		
	}

	private static void list(BbsDAO dao) {
		List<BbsDTO> list = dao.list();
		
		Iterator<BbsDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			BbsDTO dto = iter.next();
			p(dto);
			p("-------------------------------");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(BbsDTO dto) {
		System.out.println("번호 : "+dto.getBbsno());
		System.out.println("작성자 : "+dto.getWname());
		System.out.println("제목 : "+dto.getTitle());
		System.out.println("글내용 : "+dto.getContent());
		System.out.println("조회수 : "+dto.getViewcnt());
		System.out.println("등록날짜 : "+dto.getWdate());
		System.out.println("grpno : "+dto.getGrpno());
		System.out.println("indent : "+dto.getIndent());
		System.out.println("ansnum : "+dto.getAnsnum());
		
		
	}

}
