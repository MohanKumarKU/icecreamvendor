package com.icecream.vendor.icecreamvendor.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icecream.vendor.icecreamvendor.entities.OrderIce;
import com.icecream.vendor.icecreamvendor.entities.UserLogin;
import com.icecream.vendor.icecreamvendor.repos.OrderIceRepository;

@Controller
public class DashboardController {
	
	@Autowired
	OrderIceRepository iceRepository;
	
	@RequestMapping("dashboard")
	public String showDashBoard() {
		return "dashboard";
	}
	
	@RequestMapping("/login")
	public String showLogin() {
		return "login";
	}
	
	@RequestMapping("/admin")
	public String showAdmin() {
		return "admin";
	}
	
	@RequestMapping("/transport")
	public String showTransport() {
		return "transport";
	}
	
	@RequestMapping("/logout")
	public String logOut() {
		return "dashboard";
	}
	
	@RequestMapping(value="/loginDashboard",method = RequestMethod.POST)
	public String showLoginDashboard(UserLogin userLogin, ModelMap modelMap) {
		modelMap.addAttribute(userLogin);
		return "loginDashboard";
	}
	
	@RequestMapping(value="/orderice")
	public String showIcecreamOrder(@RequestParam("username") String username, ModelMap modelMap) {
		modelMap.addAttribute("username", username);
		return "icecreamOrder";
	}
	
	
	
	@RequestMapping(value="/makeorder",method = RequestMethod.POST)
	public String makeIceOrder(OrderIce orderIce,ModelMap modelMap) {
		orderIce.setDate(Date.valueOf(java.time.LocalDate.now()));
		orderIce.setStatus('C');
		
		OrderIce ordered = iceRepository.save(orderIce);
		modelMap.addAttribute(ordered);
		return "loginOrderDashboard";
	}
}
