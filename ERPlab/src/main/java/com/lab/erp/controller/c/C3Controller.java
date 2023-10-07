package com.lab.erp.controller.c;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lab.erp.service.c.C3Service;
import com.lab.erp.vo.c.c3.Erp_EventVO;
import com.lab.erp.vo.c.c3.Erp_OnlineVO;
import com.lab.erp.vo.c.c3.Erp_StoresalesVO;
import com.lab.erp.util.EventValidator;
import com.lab.erp.vo.a.a1.Erp_CompanyVO;
import com.lab.erp.vo.all.Erp_CtgrVO;
import com.lab.erp.vo.b.b3.Erp_SettletypeVO;
import com.lab.erp.vo.c.c3.Erp_WarehouseVO;
import com.lab.erp.vo.c.c4.Erp_CustomerVO;
import com.lab.erp.vo.d.d6.Erp_GoodsVO;
import com.lab.erp.vo.d.d6.Erp_GoodslotVO;
import com.lab.erp.vo.login.Erp_TeamVO;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/c/c3")
public class C3Controller {
	private C3Service c3Service;
	
	@Autowired
	public void setC3Service(C3Service c3Service) {
		this.c3Service = c3Service;
	}
	// ---------매장매출---------
	@GetMapping("/c31/storesales")
	public String storsales(Model model) {
		List<Erp_StoresalesVO> list_res = c3Service.list_storesales();
		model.addAttribute("storesales_list", list_res);
		return "thymeleaf/c/storesales";
	}
	
	@PostMapping("/c31/storesales")
	public String storesales (HttpSession session, @Valid @ModelAttribute("erp_StoresalesVO") Erp_StoresalesVO erp_StoresalesVO, BindingResult result, RedirectAttributes redirectAttributes) {
		// 에러있다면, 적힌 내용들 담고 해당 페이지 redirect 시킴
		if(result.hasErrors()) {
			if (!result.getFieldErrors().get(0).getField().equals("storesales_no")) {
				redirectAttributes.addFlashAttribute("erp_StoresalesVO", erp_StoresalesVO);
			    redirectAttributes.addFlashAttribute("error", result.getFieldErrors().get(0).getField());	
			}
			// 에러가 없다며 일반적 저장기능 실행
			else {
//				int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
//				erp_StoresalesVO.setComcode_no(comcode_no);
				erp_StoresalesVO.setComcode_no(1); //temporary TODO 삭제할것
				c3Service.save_storesales(erp_StoresalesVO);
			}
		} 
		return "redirect:/c/c3/c31/storesales";
	}
	
	
	@PostMapping("/c31/storesales_update")
	public String storesales_update (HttpSession session, Erp_StoresalesVO erp_StoresalesVO) {
		int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
		erp_StoresalesVO.setComcode_no(comcode_no); 
		int res = c3Service.update_storesales(erp_StoresalesVO);
		return "redirect:/c/c3/c32/warehouse";
	}
	
	@PostMapping("/c31/storesales_delete")
	public String event_delete (Erp_StoresalesVO erp_StoresalesVO) {
		int res = c3Service.delete_storesales(erp_StoresalesVO.getStoresales_no());
		return "redirect:/c/c3/c31/storesales";
	}
	
	// ---------창고관리(재고관리)---------
	@GetMapping("/c32/warehouse")
	public String warehouse (Model model) {
		List<Erp_WarehouseVO> list_res = c3Service.list_warehouse();
		model.addAttribute("warehouse_list", list_res);
		return "thymeleaf/c/warehouse";
	}
	
	@PostMapping("/c32/warehouse")
	public String event (HttpSession session, @Valid @ModelAttribute("erp_WarehouseVO") Erp_WarehouseVO erp_WarehouseVO, BindingResult result, RedirectAttributes redirectAttributes) {
		// 에러있다면, 적힌 내용들 담고 해당 페이지 redirect 시킴
		if(result.hasErrors()) {
			if (!result.getFieldErrors().get(0).getField().equals("warehouse_no")) {
				redirectAttributes.addFlashAttribute("erp_WarehouseVO", erp_WarehouseVO);
			    redirectAttributes.addFlashAttribute("error", result.getFieldErrors().get(0).getField());	
			}
			// 에러가 없다며 일반적 저장기능 실행
			else {
				int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
				erp_WarehouseVO.setComcode_no(comcode_no);
//				erp_WarehouseVO.setComcode_no(1); //temporary TODO 삭제할것
				c3Service.save_warehouse(erp_WarehouseVO);
			}
		} 
		return "redirect:/c/c3/c32/warehouse";
	}
	
	
	@PostMapping("/c32/warehouse_update")
	public String warehouse_update (HttpSession session, Erp_WarehouseVO erp_WarehouseVO) {
		int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
		erp_WarehouseVO.setComcode_no(comcode_no); 
		int res = c3Service.update_warehouse(erp_WarehouseVO);
		return "redirect:/c/c3/c32/warehouse";
	}
	
	@PostMapping("/c32/warehouse_delete")
	public String event_delete (Erp_WarehouseVO erp_WarehouseVO) {
		int res = c3Service.delete_warehouse(erp_WarehouseVO.getWarehouse_no());
		return "redirect:/c/c3/c32/warehouse";
	}
	
	// ---------행사---------
	@GetMapping("/c33/event")
	public String event (Model model) {
		List<Erp_EventVO> list_res = c3Service.list_event();
		model.addAttribute("event_list", list_res);
		return "thymeleaf/c/event";
	}
	
	@PostMapping("/c33/event")
	public String event (HttpSession session, @Valid @ModelAttribute("erp_EventVO") Erp_EventVO erp_EventVO, BindingResult result, RedirectAttributes redirectAttributes) {
		// 에러있다면, 적힌 내용들 담고 해당 페이지 redirect 시킴
		if(result.hasErrors()) {
			if (!result.getFieldErrors().get(0).getField().equals("event_no")) {
				redirectAttributes.addFlashAttribute("erp_EventVO", erp_EventVO);
			    redirectAttributes.addFlashAttribute("error", result.getFieldErrors().get(0).getField());	
			}
			// 에러가 없다며 일반적 저장기능 실행
			else {
				int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
				erp_EventVO.setComcode_no(comcode_no);
				c3Service.save_event(erp_EventVO);
			}
		} 
		return "redirect:/c/c3/c33/event";
	}
	
	
	@PostMapping("/c33/event_update")
	public String event_update (HttpSession session, Erp_EventVO erp_EventVO) {
		int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
		erp_EventVO.setComcode_no(comcode_no); 
		int res = c3Service.update_event(erp_EventVO);
		return "redirect:/c/c3/c33/event";
	}
	
	@PostMapping("/c33/event_delete")
	public String event_delete (Erp_EventVO erp_EventVO) {
		int res = c3Service.delete_event(erp_EventVO.getEvent_no());
		return "redirect:/c/c3/c33/event";
	}

	
	// ---------온라인매출---------
	@GetMapping("/c34/online")
	public String online (Model model) {
		List<Erp_OnlineVO> list_res = c3Service.list_online();
		model.addAttribute("online_list", list_res);
		return "thymeleaf/c/online";
	}
	
	@PostMapping("/c34/online")
	public String online (HttpSession session, @Valid @ModelAttribute("erp_OnlineVO") Erp_OnlineVO erp_OnlineVO, BindingResult result, RedirectAttributes redirectAttributes) {
		// 에러있다면, 적힌 내용들 담고 해당 페이지 redirect 시킴
		if(result.hasErrors()) {
			if (!result.getFieldErrors().get(0).getField().equals("online_no")) {
				redirectAttributes.addFlashAttribute("erp_OnlineVO", erp_OnlineVO);
			    redirectAttributes.addFlashAttribute("error", result.getFieldErrors().get(0).getField());	
			}
			// 에러가 없다며 일반적 저장기능 실행
			else {
				int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
				erp_OnlineVO.setComcode_no(comcode_no);
				c3Service.save_online(erp_OnlineVO);
			}
		} 
		return "redirect:/c/c3/c34/online";
	}
	
	
	@PostMapping("/c34/online_update")
	public String online_update (HttpSession session, Erp_OnlineVO erp_OnlineVO) {
		int comcode_no = Integer.parseInt((String) session.getAttribute("comcode_no"));
		erp_OnlineVO.setComcode_no(comcode_no); 
		int res = c3Service.update_online(erp_OnlineVO);
		return "redirect:/c/c3/c34/online";
	}
	
	@PostMapping("/c34/online_delete")
	public String online_delete (Erp_OnlineVO erp_OnlineVO) {
		int res = c3Service.delete_online(erp_OnlineVO.getOnline_no());
		return "redirect:/c/c3/c34/online";
	}
	
	
	// ---------상품조회---------
	@GetMapping("/c3/goods_list")
	public String goods_list (Model model) {
		List<Erp_GoodsVO> goods_list = c3Service.findGoodsAll();
		model.addAttribute("goods_list", goods_list);
		return "thymeleaf/c/goods_list";
	}
	
	// ---------회사조회---------
	@GetMapping("/c3/company_list")
	public String company_list (Model model) {
		List<Erp_CompanyVO> company_list= c3Service.findCompanyAll();
		model.addAttribute("company_list", company_list);
		return "thymeleaf/c/company_list";
	}
	
	// ---------카테고리조회---------
	@GetMapping("/c3/ctgr_list")
	public String ctgr_list (Model model) {
		List<Erp_CtgrVO> ctgr_list= c3Service.findCtgrAll();
		model.addAttribute("ctgr_list", ctgr_list);
		return "thymeleaf/c/ctgr_list";
	}
	
	// ---------부서-팀조회---------
	@GetMapping("/c3/team_list")
	public String team_list (Model model) {
		List<Erp_TeamVO> team_list= c3Service.findTeamAll();
		model.addAttribute("team_list", team_list);
		return "thymeleaf/c/team_list";
	}
	
	// ---------고객정보조회---------
	@GetMapping("/c3/customer_list")
	public String customer_list (Model model) {
		List<Erp_CustomerVO> customer_list= c3Service.findCustomerAll();
		model.addAttribute("customer_list", customer_list);
		return "thymeleaf/c/customer_list";
	}
	
	// ---------결제구분조회---------
	@GetMapping("/c3/settletype_list")
	public String settletype_list (Model model) {
		List<Erp_SettletypeVO> settletype_list= c3Service.findSettletypeAll();
		model.addAttribute("settletype_list", settletype_list);
		return "thymeleaf/c/settletype_list";
	}
	
	// ---------상품로트번호조회---------
	@GetMapping("/c3/goodslot_list")
	public String goodslot_list (Model model, @RequestParam int order) {
		List<Erp_GoodslotVO> goodslot_list= c3Service.findGoodslotAll();
		model.addAttribute("goodslot_list", goodslot_list);
		model.addAttribute("order", order);
		return "thymeleaf/c/goodslot_list";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {binder.setValidator(new EventValidator());}

	
}
