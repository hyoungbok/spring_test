package address;

import java.util.*;

public class AddressTest {

	public static void main(String[] args) {
		AddressDAO dao = new AddressDAO();
		
		//create(dao);
		//list(dao);
		//update(dao);
		//delete(dao);
		read(dao);
	}

 



	private static void read(AddressDAO dao) {
		AddressDTO dto = dao.read(2);
		p(dto);
		
	}




/*
	private static void list(AddressDAO dao) {
		Map map = null;
		List<AddressDTO> list = dao.list(map);
		
		for(int i = 0; i<list.size(); i++) {
			AddressDTO dto =  list.get(i);
			
			p(dto);
			p("-----------------------------------");
		}
	}
*/




	private static void p(AddressDTO dto) {
		p("번호:" + dto.getName());
		p("이름:" + dto.getName());
		p("전화번호:"+ dto.getPhone());
		p("우편번호:"+ dto.getZipcode());
		p("주소:" + dto.getAddress());
		p("주소2:" +dto.getAddress2());
		
	}





	private static void delete(AddressDAO dao) {
		
		if(dao.delete(1)) {
			p("성공");
		}else {
			p("실패");
			
		}
		
	}


	private static void update(AddressDAO dao) {
		AddressDTO dto = new AddressDTO();
		int no =1;
		
		dto.setName("고길동");
		dto.setPhone("010-9999-9999");
		dto.setZipcode("22222");
		dto.setAddress("경기도 의정부시");
		dto.setAddress2("200");
		dto.setNo(no);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}



	private static void create(AddressDAO dao) {
		AddressDTO dto = new AddressDTO();
		dto.setName("이길동");
		dto.setPhone("010-5555-5555");
		dto.setZipcode("00000");
		dto.setAddress("서울시 동작구 흑석동");
		dto.setAddress2("100");
		if(dao.create(dto )) {
			p("성공");
			
		}else {
			p("실패");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
