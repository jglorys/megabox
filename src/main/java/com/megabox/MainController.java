package com.megabox;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	@RequestMapping("/main/megabox")
	public String mainMegabox(Model model) {
		
		model.addAttribute("viewName", "main/megabox");
		return "template/layout";
	}
}
