package spring.sts.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.board.BoardDAO;
import spring.model.board.BoardDTO;
import spring.model.board.BoardMgr;

import spring.utility.board.Utility;


@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private BoardMgr mgr;
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(int num,String passwd, String oldfile,
			HttpServletRequest request ,Model model) {
		
		String basePath = request.getRealPath("/storage");
		
		Map map = new HashMap();
		map.put("num", num);
		map.put("passwd",passwd);
			
		boolean pflag = dao.passwdCheck(map);

		if(pflag) {
			dao.delete(num);
			Utility.deleteFile(basePath, oldfile);
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));

			return "redirect:/list";
		}else {
			return "/passwdError";
		}
	}
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int num, Model model) {
		
		boolean flag = dao.checkRefnum(num);
		
		model.addAttribute("flag", flag);
		
		return "/delete";
		
	}
	
	@RequestMapping(value="/reply", method=RequestMethod.POST)
	public String reply(BoardDTO dto, HttpServletRequest request, Model model) {
		
		String basePath = request.getRealPath("/storage");
		
		dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), basePath));
		dto.setFilesize((int)dto.getFilenameMF().getSize());
		dto.setIp(request.getRemoteAddr());
		
		boolean flag = mgr.reply(dto);
		
		if(flag) {
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));

			return "redirect:/list";
		}else {
			
			return "/error";
		}
		
	}
	@RequestMapping(value="/reply", method=RequestMethod.GET)
	public String reply(int num, Model model) {
		
		BoardDTO dto = dao.readReply(num);
		
		model.addAttribute("dto", dto);
		
		return "/reply";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(BoardDTO dto, HttpServletRequest request, 
			String oldfile, Model model) {
		String basePath = request.getRealPath("/storage");
		
		dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), basePath));
		dto.setFilesize((int)dto.getFilenameMF().getSize());
		
		Map map = new HashMap();
		map.put("num", dto.getNum());
		map.put("passwd", dto.getPasswd());
		
		boolean pflag = dao.passwdCheck(map);
		boolean flag = false;
		
		if(pflag) {
			flag = dao.update(dto);
		}
		
		String str = null;		
		if(pflag) {
			if(flag) {
				if(dto.getFilesize()>0) {
					Utility.deleteFile(basePath, oldfile);	
				}	
				model.addAttribute("nowPage",request.getParameter("nowPage"));
				model.addAttribute("col",request.getParameter("col"));
				model.addAttribute("word",request.getParameter("word"));
				str = "redirect:/list";
			}else {
				if(dto.getFilesize()>0) {
					Utility.deleteFile(basePath, dto.getFilename());	
				}				
				str = "/error";
			}
		}else {
			if(dto.getFilesize()>0) {
				Utility.deleteFile(basePath, dto.getFilename());	
			}			
			str = "/passwdError";
		}						
		return str;		
	}
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(int num, Model model) {
		
		BoardDTO dto = dao.read(num);
		
		model.addAttribute("dto", dto);
		
		return "/update";
	}
	
	@RequestMapping("/read")
	public String read(int num, Model model) {
		dao.upCount(num);
		BoardDTO dto = dao.read(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("content", dto.getContent().replaceAll("\r\n", "<br>"));
		
		
		return "/read";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(BoardDTO dto, HttpServletRequest request) {
		String upDir = request.getRealPath("/storage");
		
		dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(), upDir));
		dto.setFilesize((int)dto.getFilenameMF().getSize());
		dto.setIp(request.getRemoteAddr());
		
		boolean flag = dao.create(dto);
		
		
		if(flag) {
			return "redirect:/list";
		}else {
			return "/error";
		}
		
	}
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create() {
		
		return "/create";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) word="";
		
		int nowPage = 1;
		int recordPerPage = 5;
		
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage -1) * recordPerPage) +1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
			
		//1. model 사용
		List<BoardDTO> list = dao.getList(map);
		int total = dao.getTotal(map);
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		//2. request 저장
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		
		return "/list";
	}

}
