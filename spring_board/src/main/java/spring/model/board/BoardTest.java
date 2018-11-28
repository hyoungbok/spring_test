package spring.model.board;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class BoardTest {
	public static void main(String[] args) {
		
		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		BoardDAO dao = (BoardDAO)factory.getBean("dao");
		
		
	//	create(dao);
	//	update(dao);
	//	delete(dao);
	//	read(dao);
	//	list(dao);
	//	viewCount(dao);
	//	paasswdCheck(dao);
	//	total(dao);
	//	readReply(dao);
	//	reply(dao);
	//	checkRefnum(dao);
		
	}

	
	
	private static void checkRefnum(BoardDAO dao) {
		if(dao.checkRefnum(5)) {
			p("답변글이 있어서 삭제 할수 없습니다.");
		} else {
			p("삭제 가능 합니다.");
		}
		
	}

	private static void reply(BoardDAO dao) {
		BoardDTO dto = dao.readReply(1);
		dto.setName("답변");
		dto.setContent("게시판 내용");
		dto.setPasswd("1234");
		dto.setIp("1111");
		dto.setFilename("파일이름3");
		dto.setFilesize(1111);
		
		Map map = new HashMap();
		map.put("ref", dto.getRef());
		map.put("ansnum", dto.getAnsnum());
		dao.upAnsnum(map);
		if(dao.insertReply(dto)) {
			p("성공");
		} else {
			p("실패");
		}
		
	}

	private static void readReply(BoardDAO dao) {
		BoardDTO dto = dao.readReply(3);
		p("번호 : "+dto.getNum());
		p("ref : "+dto.getRef());
		p("indent : "+dto.getIndent());
		p("ansnum : "+dto.getAnsnum());
		p("제목 : "+dto.getSubject());
		p("이름 : "+dto.getName());
		
	}

	private static void total(BoardDAO dao) {
		Map map = new HashMap();

		map.put("col", "name");
		map.put("word", "");
		
		int total = dao.getTotal(map);
		p("전체레코드수:" + total);
		
	}

	private static void paasswdCheck(BoardDAO dao) {
		Map map = new HashMap();
		map.put("num",  1);
		map.put("passwd",  "1234");
		if(dao.passwdCheck(map )) {
			p("비밀번호 일치");
		}else {
			p("비밀번호 불일치");
		}
	}

	private static void viewCount(BoardDAO dao) {
		dao.upCount(1);
		
	}

	private static void list(BoardDAO dao) {
		Map map = new HashMap();

		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<BoardDTO> list = dao.getList(map);
	
		Iterator<BoardDTO> iter = list.iterator();
		while(iter.hasNext()) {
			BoardDTO dto = iter.next();
			p(dto);
			p("-----------------");
		}
	/*	
		for(int i=0; i<list.size(); i++) {
			BoardDTO dto = list.get(i);
			
			p(dto);
		}
	*/
	}

	private static void read(BoardDAO dao) {
		int no = 1;
		BoardDTO dto = dao.read(no);
		p(dto);
	}

	private static void delete(BoardDAO dao) {
		int no = 5;
		
		if(dao.delete(no)) {
			p("DELETE 성공");
		}else {
			p("DELETE 실패");
		}
	}

	private static void update(BoardDAO dao) {
		BoardDTO dto = new BoardDTO();
		
		dto.setName("이순신");
		dto.setSubject("제목 제목");
		dto.setContent("내용 내용");
		dto.setFilename("파일 파일");
		dto.setFilesize(2222);
		dto.setNum(3);
		
		if(dao.update(dto)) {
			p("UPDATE 성공");
		} else {
			p("UPDATE 실패");
		}
	}

	private static void create(BoardDAO dao) {
		BoardDTO dto = new BoardDTO();
		
		dto.setName("이순신");
		dto.setSubject("게시판 제목");
		dto.setContent("게시판 내용");
		dto.setPasswd("1234");
		dto.setIp("1111");
	//	dto.setFilename("파일이름3");
	//	dto.setFilesize(1111);
		
		if(dao.create(dto)) {
			p("CREATE 성공");
		}else {
			p("CREATE 실패");
		}
	}

	private static void p(String string) {
		System.out.println(string);
	}
	
	private static void p(BoardDTO dto) {
		
		p("번호 : " + dto.getNum());
		p("이름 : " + dto.getName());
		p("제목 : " + dto.getSubject());
		p("내용 : " + dto.getContent());
		p("조회수 : " + dto.getCount());
		p("날짜 : " + dto.getRegdate());
		p("뭐지1 : " + dto.getIp());
		p("뭐지2 : " + dto.getFilename());
		p("뭐지3 : " + dto.getFilesize());
		
	}
	
	
}
