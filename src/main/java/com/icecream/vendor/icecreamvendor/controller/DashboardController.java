package com.icecream.vendor.icecreamvendor.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icecream.vendor.icecreamvendor.entities.Notifier;
import com.icecream.vendor.icecreamvendor.entities.OrderIce;
import com.icecream.vendor.icecreamvendor.entities.UserLogin;
import com.icecream.vendor.icecreamvendor.repos.OrderIceRepository;
import com.icecream.vendor.icecreamvendor.services.NotificationService;

@Controller
public class DashboardController {
	
	@Autowired
	OrderIceRepository iceRepository;
	
	@Autowired
	NotificationService notificationService;
	
	@RequestMapping("dashboard")
	public String showDashBoard() {
		return "dashboard";
	}
	
	@RequestMapping("/login")
	public String showLogin() {
		return "login";
	}
	
	@RequestMapping("/userProfile")
	public String showUserProfile() {
		return "userProfile";
	}
	
	@RequestMapping("/admin")
	public String showAdmin(ModelMap modelMap) {
		 
		List<OrderIce> newOrderList = iceRepository.selectOrderIce();
		modelMap.addAttribute("newOrderList",newOrderList);
		
		List<OrderIce> orderList = iceRepository.findAll();
		for(OrderIce orderIce : orderList)
		{
			if(orderIce.getStatus().equals("D"))
			{
				orderIce.setStatus("Delivered");
			}
			else
			{
		        orderIce.setStatus("In Production");
			}
		}
		modelMap.addAttribute("orderList",orderList);
		
		return "admin";
	}
	
	@RequestMapping("/adminProfile")
	public String showAdminProfile() {
		return "adminProfile";
	}
	
	
	@RequestMapping("/transport")
	public String showTransport(@RequestParam("id") int id , ModelMap modelMap) {
		OrderIce orderIce = iceRepository.findById(id).get();
		modelMap.addAttribute("orderIce",orderIce);
		return "transport";
	}
	
	@RequestMapping("/logout")
	public String logOut() {
		return "dashboard";
	}
	
	@RequestMapping(value="/loginDashboard",method = RequestMethod.POST)
	public String showLoginDashboard(UserLogin userLogin, ModelMap modelMap) {
		modelMap.addAttribute("userLogin",userLogin);
		return "loginDashboard";
	}
	
	@RequestMapping(value="/orderice")
	public String showIcecreamOrder(@RequestParam("username") String username, ModelMap modelMap) {
		modelMap.addAttribute("username", username);
		return "icecreamOrder";
	}
	
	@RequestMapping(value="/trackOrder")
	public String trackIcecreamOrder(@RequestParam("id") int id, ModelMap modelMap) {
		OrderIce trackice = iceRepository.findById(id).get();
		
		if(trackice.getStatus().equals("D"))
		{
			trackice.setStatus("Delivered");
		}
		else
		{
			trackice.setStatus("In Production");
		}
		modelMap.addAttribute("trackice",trackice);
		return "userProfile";
	}
	
	@RequestMapping(value="/makeorder",method = RequestMethod.POST)
	public String makeIceOrder(OrderIce orderIce,ModelMap modelMap) {
		orderIce.setDate(Date.valueOf(java.time.LocalDate.now()));
		orderIce.setStatus("C");
		
		OrderIce ordered = iceRepository.save(orderIce);
		sendOrderPlacedMail(ordered);
		modelMap.addAttribute("ordered",ordered);
		return "loginOrderDashboard";
	}
	
	@RequestMapping(value ="/sendDeliverNotification",method = RequestMethod.POST)
	public String sendDeliveredMail(@RequestParam("id") int id , @RequestParam("temp") double temp)
	{
		iceRepository.updateOrderIce(id,"D");
		Notifier nfr = new Notifier();
		nfr.setEmailId("mohanubdt@gmail.com");
		notificationService.sendDeliveredNotification(nfr,temp);
		return "admin";
	}
	
	@RequestMapping(value ="/sendOrderNotification",method = RequestMethod.POST)
	public void sendOrderPlacedMail(OrderIce ordered)
	{
		Notifier nfr = new Notifier();
		nfr.setEmailId("mohanubdt@gmail.com");
		notificationService.sendOrderNotification(nfr,ordered);
	}
}
