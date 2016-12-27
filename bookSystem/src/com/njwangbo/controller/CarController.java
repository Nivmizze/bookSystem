package com.njwangbo.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njwangbo.po.CartItem;
import com.njwangbo.po.User;
import com.njwangbo.service.CarService;
import com.njwangbo.vo.CartItemVo;

@Controller
@RequestMapping("/car")
public class CarController
{
    @Autowired
    private CarService carService;
    /** 
     *跳转到购物车的页面
     * @param session
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/gocar")
    public String goCar(Model model,HttpSession session){
        //判断当前是否为登陆状态,如果没登陆需提示
        User user = (User)session.getAttribute("loginuser");
        
        if(null==user)
        {
            //没登陆
            return "car/noneCar";
        }else{
            //根据当前用户找到其购物车,商品图片,商品名称,单价,数量,
            List<CartItem> carList = carService.showBooksByUid(user.getUid());
            /*session.setAttribute("carList", carList);*/
            model.addAttribute("carList", carList);
            return "car/shoppingcar";
        }
    }
    /** 
     * 根据购物车号删除购物车
     * @param cartitemid
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/deleteOneBook")
    public String deleteOneBook(String cartItemId)
    {
        carService.deleteOneCarById(cartItemId);
       
        return "redirect:gocar.action";
    }
    @RequestMapping("/deleteBatch")
    public String deleteBatch(String carids)
    {
        //0,1,3
        String[]caridarr = carids.split(",");
        if(null!=caridarr && caridarr.length!=0){
            for(int i=1;i<caridarr.length;i++)
            {
                carService.deleteOneCarById(caridarr[i]);
            }
        }
        
        return "redirect:gocar.action";
        
    }
    /** 
     * 点击减号时调用的action
     * @param cartItem
     * @param response
     * @throws Exception
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/modifyQuantity")
    public void modifyQuantity(CartItem cartItem,HttpServletResponse response) throws Exception
    {
        //减一本书的数量
        //根据购物车的id修改购物车中的书的数量
        int quantity = cartItem.getQuantity()-1;
        cartItem.setQuantity(quantity);
        carService.updateQuantity(cartItem);
        PrintWriter out = response.getWriter();
        out.println(quantity);
        out.flush();
        out.close();
    }
    /** 
     * 点击加号时调用
     * @param cartItem
     * @param response
     * @throws Exception
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/addmodifyQuantity")
    public void addModifyQuantity(CartItem cartItem,HttpServletResponse response) throws Exception{
        //加一本书的数量
        //根据购物车的id修改购物车中的书的数量
        int quantity = cartItem.getQuantity()+1;
        cartItem.setQuantity(quantity);
        carService.updateQuantity(cartItem);
        PrintWriter out = response.getWriter();
        out.println(quantity);
        out.flush();
        out.close();
    }
    /** 
     * 从页面添加书籍到购物车
     * @param cartItemVo
     * @param response
     * @throws Exception
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/addCartitem")
    public void addCartItem(CartItemVo cartItemVo,HttpServletResponse response,HttpServletRequest request) throws Exception{
    	
    	//HttpSession session=request.getSession();
    	String bid=request.getParameter("bid");
    	String uid=request.getParameter("uid");
        System.out.println(bid+"............");
        System.out.println(cartItemVo.getQuantity()+"////////////////");
    	String ran=UUID.randomUUID().toString();
    	System.out.println(ran);
    	String []carid1=ran.split("-");
        String carid=carid1[0];
        cartItemVo.setBid(bid);
        cartItemVo.setUid(uid);
        cartItemVo.setCartItemId(carid);
        System.out.println(cartItemVo.getBid()+cartItemVo.getQuantity()+"ooooooooooooooooooooo");
        carService.addBookIntoCar(cartItemVo);
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("已添加到购物车");
        out.flush();
        out.close();
    }
}
