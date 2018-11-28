package img;

import java.util.HashMap;
import java.util.Map;

import member.MemberDTO;

public class ImgTest {

	public static void main(String[] args) {
		ImgDAO dao =new ImgDAO();
		//read(dao);
		//delete(dao);
		//create(dao);
		update(dao);
	}

	private static void passCheck(ImgDAO dao) {
		boolean flag = false;
		
		Map map =new HashMap();
		map.put("no", 1);
		map.put("passwd", "1234");
		
		if(dao.passCheck(map)) {
			System.out.println("비밀번호확인");
		}else {
			System.out.println("비밀번호가 틀렸습니다");
		}
		
	}

	private static void update(ImgDAO dao) {
		ImgDTO dto = dao.read(1);
		
		dto.setName("갑수");
		dto.setTitle("합시다");
		dto.setFname("흠");
		dto.setName("갑수");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}


	private static void create(ImgDAO dao) {
		ImgDTO dto = new ImgDTO();
		dto.setNo(3);
		dto.setTitle("ㅋㅋ");
		dto.setName("나홀로");
		dto.setPasswd("1234");
		dto.setFname("9.jpg");
	
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(ImgDAO dao) {
		ImgDTO dto = dao.read(1);
		p(dto);
		
	}

	private static void p(ImgDTO dto) {
		System.out.println("no : " + dto.getNo());
		System.out.println("name : " + dto.getName());
		System.out.println("title : " + dto.getTitle());
		System.out.println("name : " + dto.getFname());

	
		
	}
	private static void delete(ImgDAO dao) {
		// TODO Auto-generated method stub
		if (dao.delete(1)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}
