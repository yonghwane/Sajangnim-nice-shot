package com.ais.sajangnimniceshot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ais.sajangnimniceshot.services.KDBService;

@RestController
public class KDBRestController {

	@Autowired
	KDBService service;

	@PostMapping("/removeReservation")
	public int removeReservation(Model model, @RequestParam("rsvCode") int rsvCode) {
		model.addAttribute("rsvCode", rsvCode);
		System.out.println(rsvCode);
		this.service.backController("removeReservation", model);
		return (int) model.getAttribute("deleteReservation");
	}
}
