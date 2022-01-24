package com.megabox.event;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class eventController {

	@RequestMapping("/event/event_view")
	public String eventView(Model model) {
		model.addAttribute("viewName", "event/event");
		return "template/layout";
	}
}
