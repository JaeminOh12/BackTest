package kr.smhrd.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Board;
import kr.smhrd.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;

@Controller // 역할이름(어노테이션)
@RequiredArgsConstructor
public class BoardController { // new BoardController()
	
	//@Autowired // DI(의존성주입)
	private final BoardMapper boardMapper;
//	public BoardController(BoardMapper boardMapper) {
//		this.boardMapper=boardMapper;
//	} 이걸 만들 필요없음  위에 @RequiredArgsConstructor 이거 쓰면 됨
	// final 넣어줘야함    final : 한번세팅하면 수정 못함 
	

	@RequestMapping("/list.do")
	public String list(Model model) { // 컨트롤러에서 메서드이름은 내맘대로 ex)list()
		List<Board> list = boardMapper.getList();
		// 객체바인딩(View로 전달할 객체를 특정메모리에 연결시키는 기술)
		model.addAttribute("list", list);
		return "board/list"; // (forward) --> ViewResolver /WEB-INF/views/board/list.jsp
	}       
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String register() {
		return "board/register";
	}
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register(Board vo) { // request.getparameter("title"), content, writer 이걸 받아야함
		boardMapper.register(vo); //등록성공
		// 등록성공후에는 -> 다시 리스트페이지로(list.do)이동 : redirect 
		return "redirect:/list.do";
	}


	
}
