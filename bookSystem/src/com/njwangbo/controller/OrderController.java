package com.njwangbo.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.njwangbo.po.Book;
import com.njwangbo.po.Order;
import com.njwangbo.po.Orderitem;
import com.njwangbo.service.CarService;
import com.njwangbo.service.OrderService;
import com.njwangbo.service.OrderitemService;
import com.njwangbo.vo.CartItemVo;
import com.njwangbo.vo.OrderVo;
import com.sys.constraint.Constraint;

// 普通的JAVABEAN
@Controller
@RequestMapping("/order")
public class OrderController
{
    
    @Autowired
    private OrderService orderService;
  
    @Autowired
    private OrderitemService orderitemService;
    
    @Autowired
    private CarService carService;
    
    
    @RequestMapping("/showMyOrders")
	public String showMyOrders(HttpServletRequest request,Model model,Integer page){
	
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("uid");
		System.out.println(uid);
		OrderVo ordervo = new OrderVo();
		ordervo.setUid(uid);
	        
		List<Order>	list = orderService.showAllOrders(uid);
		System.out.println("---------------------------------------------------");
		//订单详情
		List<Orderitem> listFinal = new ArrayList<Orderitem>()  ;
		//String oid=order.getOid();
		for (Order order : list) {
			String oid = order.getOid();
			//查出订单详情的集合
			List<Orderitem> listitem=orderitemService.showitembyoid(oid);
			for (Orderitem orderitem : listitem) {
				listFinal.add(orderitem);
				System.out.println(oid+"的orderitem");
			}
		}
		
		
		System.out.println("------------------------------------------------------");
		int totalPage;
		
		int startRow;
		
		int curPage;
		
		int pageSize=Constraint.PAGE_SIZE;
		//最大页数
		if(list.size()%pageSize==0){
			
			totalPage=list.size()/pageSize;
		}else{
			totalPage=list.size()/pageSize+1;
		}
		System.out.println(page+"=========");
		//上下页限制
		if(null==page){
			page = 1;
		}
		else
        {
            if(page<1)
            {
                page=1;
            }
            else if(page>totalPage)
            {
               page=totalPage;
            }
        }
		curPage = page;
		
		startRow = (page-1)*pageSize;
		
		List<Order> list1 = orderService.showOrderByUid(uid, startRow, pageSize);
		
		model.addAttribute("myorders", list1);
		model.addAttribute("curPage", curPage);		
		model.addAttribute("maxPage", totalPage);
		model.addAttribute("items", listFinal);
		//session.setAttribute("orderitem",listFinal);
		return "order/order3";
	}
    
    @RequestMapping("gopay")
    public String gopay(Order order,HttpServletRequest request){
    	String oid=request.getParameter("oid");
    	HttpSession session=request.getSession();
    	session.setAttribute("status", oid);
    	return "order/pay";
    }
    
    @RequestMapping("pay")
    public String updatestatus(Order order){
    	orderService.updatestatus(order);
    	System.out.println("支付");
    	return "redirect:/order/showMyOrders.action";
    }
    
    @RequestMapping("cancel")
    public String updatestatuscancel(Order order,HttpServletRequest request){
    	orderService.updatestatuscancel(order);
    	System.out.println("取消");
    	return "redirect:/order/showMyOrders.action";
    }
    
    @RequestMapping("complete")
    public String updatestatusget(Order order,HttpServletRequest request){
    	orderService.updatestatusget(order);
    	System.out.println("交易成功");
    	return "redirect:/order/showMyOrders.action";
    }
    //生成订单
    @SuppressWarnings("unchecked")
	@RequestMapping("addorder")
    public String addorder(Order order,HttpServletRequest request) throws UnsupportedEncodingException{
    	HttpSession session=request.getSession();
    	List <CartItemVo>carlist=(List<CartItemVo>) session.getAttribute("CartItemVos");
    	String ran=UUID.randomUUID().toString();
    	String []oid1=ran.split("-");
    	String oid=oid1[0]+oid1[1]+oid1[2]+oid1[3];
    	String uid=request.getParameter("uid");
    	Orderitem oditem=new Orderitem();
    	double total=Double.parseDouble(request.getParameter("total"));
    	//String address=request.getParameter("address");
    	String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"Utf-8");
    	System.out.println(total+"^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
    	order.setAddress(address);
    	order.setOid(oid);
    	order.setTotal(total);
    	order.setUid(uid);
    	orderService.addorder(order);
    	for (CartItemVo car : carlist) {
    		//遍历存入订单详情
    		String ran1=UUID.randomUUID().toString();
    		String []oid2=ran1.split("-");
        	
    		String bid=car.getBid();
    		String bname=car.getBname();
    		double currprice=car.getCurrPrice();
    		int quantity=car.getQuantity();
    		String img_b=car.getImage_b();
            
    		String oditemid=oid2[0];
    		double subtotal=currprice*quantity;
    		
    		oditem.setOrderItemId(oditemid);
    		oditem.setQuantity(quantity);
    		oditem.setBid(bid);
    		oditem.setBname(bname);
    		oditem.setImage_b(img_b);
    		oditem.setCurrPrice(currprice);
    		oditem.setOid(oid);
    		oditem.setSubtotal(subtotal);
    		orderitemService.addorderitem(oditem);
    		carService.deleteOneCarById(car.getCartItemId());
		}
    	//生成订单
    	session.setAttribute("orderid", oid);
    	session.setAttribute("address", address);
    	session.setAttribute("total", total);
    	return "order/order2";
    }
    
  //生成订单页面
	@RequestMapping("/toaddOrder")
	public String toAddOrder(String ids,HttpServletRequest request)
	{
	    String [] idArray = ids.split(",");
	    List<CartItemVo>  listCar = new ArrayList<CartItemVo>();
 	    for(int i=1 ; i < idArray.length ; i++)
	    {
 	    	System.out.println(idArray[i]);
	        listCar.add(carService.showCarItemVoByCaritemid(idArray[i]));
	    }
 	    HttpSession session = request.getSession();
 	    session.setAttribute("CartItemVos", listCar);
	    return "order/getOrder";
	}
	
   
    //后台 ..........................................................................
    
    @RequestMapping("showadOrders")
    public String showadOrders(HttpServletRequest request,Model model,Integer page,String statu){
    	
    	int status;
    	HttpSession session = request.getSession();
		System.out.println(statu);
		if(statu==null){
			status=5;
			System.out.println(status);
		}else{
		status=Integer.parseInt(statu);
		System.out.println(status);
		}
//		String uid = (String) session.getAttribute("uid");//uid后期注意整合
		Order order1 = new Order();
//		ordervo.setStatus(status);
	        
		List<Order>	list = orderService.showAllOrderss();
		System.out.println("---------------------------------------------------");
		//订单详情
		List<Orderitem> listFinal = new ArrayList<Orderitem>()  ;
		//String oid=order.getOid();
		for (Order order : list) {
			String oid = order.getOid();
			//查出订单详情的集合
			List<Orderitem> listitem=orderitemService.showitembyoid(oid);
			for (Orderitem orderitem : listitem) {
				listFinal.add(orderitem);
				System.out.println(oid+"的orderitem");
			}
		}
		
		
		System.out.println("------------------------------------------------------");
		int totalPage;
		
		int startRow;
		
		int curPage;
		
		int pageSize=Constraint.PAGE_SIZE;
		
		if(list.size()%pageSize==0){
			
			totalPage=list.size()/pageSize;
		}else{
			totalPage=list.size()/pageSize+1;
		}
		System.out.println(page+"=========");
		if(null==page){
			page = 1;
		}
		else
        {
            if(page<1)
            {
                page=1;
            }
            else if(page>totalPage)
            {
               page=totalPage;
            }
        }
		curPage = page;
		
		startRow = (page-1)*pageSize;
		System.out.println(status+""+startRow+""+pageSize+"++++++++++++++");
		order1.setStatus(status);
		order1.setStartRow(startRow);
		order1.setPageSize(pageSize);
		List<Order> list1 = orderService.showOderbystatus(order1);
		
		model.addAttribute("admyorders", list1);
		model.addAttribute("adcurPage", curPage);		
		model.addAttribute("admaxPage", totalPage);
		model.addAttribute("aditems", listFinal);
		//session.setAttribute("orderitem",listFinal);
		return "adorder/order4";
	}
    
    
    @RequestMapping("fahuo")
    public String fahuo(Order order,HttpServletRequest request){
    	orderService.updateadstatus(order);
    	System.out.println("发货");
    	return "redirect:/order/showadOrders.action";
    }
    
    @RequestMapping("adcancel")
    public String updateadstatuscancel(Order order,HttpServletRequest request){
    	orderService.updatestatuscancel(order);
    	System.out.println("取消");
    	return "redirect:/order/showadOrders.action";
    }
}
