package tacos;

import org.springframework.stereotype.Controller;//Controller 메소드
import org.springframework.web.bind.annotation.GetMapping;


//Controller 
@Controller 
public class HomeController {
	
	@GetMapping("/") // "/"의 루트 경로 웹 요청을 처
	public String home() {
		return "home";//뷰 이름을 반
	}
}
