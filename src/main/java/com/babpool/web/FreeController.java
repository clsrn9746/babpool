package com.babpool.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class FreeController {
	
	@RequestMapping("/freeList.do")
	public String freeList() {
		return "free/freeList";
	}
	
}
