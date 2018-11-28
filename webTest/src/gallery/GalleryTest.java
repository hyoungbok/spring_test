package gallery;

public class GalleryTest {

	public static void main(String[] args) {
		GalleryDAO dao = new GalleryDAO();
		
		//create(dao);
		//read(dao);
		//update(dao);
		delete(dao);
		//list(dao);
		//total(dao);

	}

	private static void total(GalleryDAO dao) {
		// TODO Auto-generated method stub
		
	}

	private static void list(GalleryDAO dao) {
		// TODO Auto-generated method stub
		
	}

	private static void delete(GalleryDAO dao) {
		int gno = 1;
		if(dao.delete(gno)) {
			p("삭제성공");
			
		}else
			p("삭제실패");
		
	}

	private static void update(GalleryDAO dao) {
		// TODO Auto-generated method stub
		
	}

	private static void read(GalleryDAO dao) {
		// TODO Auto-generated method stub
		GalleryDTO dto = null;
		p("?");
		p(dto);
	}

	private static void p(GalleryDTO dto) {
		// TODO Auto-generated method stub
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void create(GalleryDAO dao) {
		// TODO Auto-generated method stub
		
	}

}
