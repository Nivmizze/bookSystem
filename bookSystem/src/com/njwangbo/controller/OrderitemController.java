package com.njwangbo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njwangbo.po.Order;
import com.njwangbo.po.Orderitem;
import com.njwangbo.service.OrderService;
import com.njwangbo.service.OrderitemService;

@Controller
@RequestMapping("/orderitem")
public class OrderitemController {

	@Autowired
	private OrderitemService orderitemservice;
	
	@Autowired
	private OrderService orderservice;
	
	@RequestMapping("/orderinfo")
	public String showorderitem(String oid,Model model,HttpServletRequest request){
		double total = 0;
		List<Orderitem> list=orderitemservice.showitembyoid(oid);
		List<Order> listad=orderservice.showAllOrdersinfo(oid);
        HttpSession session=request.getSession();
        for (Orderitem orderitem : list) {
			total+=orderitem.getSubtotal();
		}
        String orderad=listad.get(0).getAddress();
        session.setAttribute("total", total);
        session.setAttribute("orderad", orderad);
        session.setAttribute("statu",oid);
		model.addAttribute("orderitems",list);
		System.out.println("ordertitems"+oid+":::::::::::::::::::::::::::");
		return "order/order5";
	}
	@RequestMapping("/adorderinfo")
	public String showorderitems(String oid,Model model,HttpServletRequest request){
		double total = 0;
		List<Orderitem> list=orderitemservice.showitembyoid(oid);
		List<Order> listad=orderservice.showAllOrdersinfo(oid);
        HttpSession session=request.getSession();
        for (Orderitem orderitem : list) {
			total+=orderitem.getSubtotal();
		}
        String orderad=listad.get(0).getAddress();
        session.setAttribute("total", total);
        session.setAttribute("orderad", orderad);
        session.setAttribute("statu",oid);
		model.addAttribute("orderitems",list);
		System.out.println("ordertitems"+oid+":::::::::::::::::::::::::::");
		return "adorder/order5";
	}
}
