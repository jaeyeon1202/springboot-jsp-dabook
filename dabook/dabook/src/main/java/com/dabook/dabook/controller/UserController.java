package com.dabook.dabook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    //장바구니
    @GetMapping("/user/cart")
    public String cart(){
        return "/customer/cart";
    }

    //결제
    @GetMapping("/user/pay")
    public String pay(){
        return "/customer/pay";
    }

    //구독
    @GetMapping("/user/subscription")
    public String subscription(){
        return "/customer/subscription";
    }
}
