package tacos;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest(HomeController.class) //HomeController의 웹 페이지 테스트, 스프링 부트의 테스트 어노테이션	
public class HomeControllerTest{
	@Autowired
	private MockMvc mockMvc; //MockMvc를 주입
	
	@Test
	public void testHomePage() throws Exception{ //홈페이지에 대해 수행하고자 하는 테스트 정의, http get을 수행 후, 3가지 중 하나라도 충족 못하면 테스트 실패
		mockMvc.perform(get("/")) // GET /를 수행
		.andExpect(status().isOk()) // HTTP 200이 되어야 한다
		.andExpect(view().name("home")) // home 뷰가 있어야 한다
		.andExpect(content().string(containsString("Welcome to ..."))); // content에 welcome to ...가 포함 되어야 한다
		
		
	}
}
