package com.dabook.dabook.controller;

import com.dabook.dabook.dto.CartDTO;
import com.dabook.dabook.service.CartService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    //장바구니 페이지 로드
    @GetMapping("/user/cart/2")
    public String cart(Model model) throws JsonProcessingException {
        List<CartDTO> cartData = cartService.cartList("2");

        ObjectMapper objectMapper = new ObjectMapper();
        String list = objectMapper.writeValueAsString(cartData);

        model.addAttribute("data", cartData);
        model.addAttribute("list", list);

        return "/customer/cart";
    }

    // 장바구니 변경 후 데이터
    @GetMapping("/cart/data/2")
    @ResponseBody
    public List<CartDTO> cartData() {
        return cartService.cartList("2");
    }

    // 장바구니 상품 삭제
    @DeleteMapping("/delCartItem/{cartNo}")
    public ResponseEntity<String> delCartItem(@PathVariable("cartNo") String cartNo) {
        Long no = Long.parseLong(cartNo);
        boolean isDelete = cartService.delCartItem(no);

        if (isDelete) {
            return new ResponseEntity<>("삭제 성공", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 장바구니 수량 변경
    @PutMapping("/countUpdate/{cartNo}")
    @ResponseBody
    public ResponseEntity<String> countUpdate(@PathVariable("cartNo") String cartNo, @RequestParam("action") String action) {

        System.out.println(cartNo);
        System.out.println(action);

        int isUpdate = cartService.countUpdate(cartNo, action);
        System.out.println(isUpdate);

        if (isUpdate == 1) {
            return new ResponseEntity<>("업데이트 성공", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("업데이트 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 장바구니 선택삭제
    @DeleteMapping("/cart/chkDel")
    public ResponseEntity<String> chkDel(@RequestBody Map<String, List<Integer>> delList){
        List<Integer> list = (delList.get("data"));
        List<Long> noList =  list.stream()
                .map(Long::valueOf)
                .toList();

        boolean isChkDel = cartService.delCartItems(noList);

        if (isChkDel) {
            return new ResponseEntity<>("삭제 성공", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 주문리스트
    @PostMapping("/orderList")
    @ResponseBody
    public List<CartDTO> orderItems(@RequestBody Map<String, List<Integer>> orderList, HttpSession session){
        List<Integer> list = orderList.get("data");
        List<Long> noList =  list.stream()
                .map(Long::valueOf)
                .toList();

        List<CartDTO> items = cartService.orderItems(noList);
        session.setAttribute("items", items);

        return items;
    }
}
