package com.axsos.DojosAndNinjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.axsos.DojosAndNinjas.models.Dojo;
import com.axsos.DojosAndNinjas.models.Ninja;
import com.axsos.DojosAndNinjas.services.DojoService;
import com.axsos.DojosAndNinjas.services.NinjaService;


@Controller
public class MainController {
	@Autowired
	DojoService dojoService;
	@Autowired
	NinjaService ninjaService;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/dojos/new";
	}
	@GetMapping("/dojos/new")
	public String dojo(@ModelAttribute("dojo") Dojo dojo) {
		return "dojo.jsp";
	}
	@GetMapping("/ninjas/new")
	public String ninja(Model model, @ModelAttribute("ninja") Ninja ninja) {
		model.addAttribute("dojos", dojoService.AllDojos());
		return "ninja.jsp";
	}
	@PostMapping("/dojos")
	public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if (result.hasErrors()) {
			return "dojo.jsp";
		}
		else {
			dojoService.createDojo(dojo);
			return "redirect:/";
		}
	}
	@PostMapping("/ninjas")
	public String createNinja(Model model, @Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("dojos", dojoService.AllDojos());
			return "ninja.jsp";
		}
		else {
			ninjaService.createNinja(ninja);
			return "redirect:/";
		}
	}
	@GetMapping("/dojos/{dojoId}")
	public String show(Model model, @PathVariable(value="dojoId") Long id) {
		Dojo dojo = dojoService.findDojo(id);
		model.addAttribute("dojo", dojo);
		return "show.jsp";
	}
}