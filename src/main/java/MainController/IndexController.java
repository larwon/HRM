package MainController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	@GetMapping("index")
	public String index() {
		return "index";
	}
	
	@GetMapping("input")
	public String input() {
		return "input";
	}
	
	@GetMapping("list")
	public String list() {
		return "list";
	}
}
