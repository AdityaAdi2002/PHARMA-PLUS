package com.protech.pharmaplus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.protech.pharmaplus.dto.Customer;
import com.protech.pharmaplus.dto.Product;
import com.protech.pharmaplus.repository.CustomerRepository;
import com.protech.pharmaplus.repository.ProductRepository;

@Controller
public class CustomerController {
	@Autowired // creates object
	CustomerRepository repository;
@Autowired
ProductRepository repository1;
	@PostMapping("/customersignup")
	public ModelAndView CustomerSignup(@ModelAttribute Customer cust) {
		ModelAndView view = new ModelAndView();
		Customer customer = null;
		try {
			long mobile = cust.getMno();
			customer = repository.findByMno(mobile);
		} catch (NumberFormatException e) {
			String email = cust.getEmail();
			customer = repository.findByEmail(email);
		}
		if (customer == null) {
			repository.save(cust);
			view.setViewName("/home");
			view.addObject("pass", "Data Saved Succesfully");
		} else {
			view.addObject("fail", "Email or Mobile Already Exists");
			view.setViewName("/signup");
		}
		return view;
	}

	@PostMapping("/customerlogin")
	public ModelAndView customerLogin(@RequestParam String user, @RequestParam String password) {
		ModelAndView view = new ModelAndView();
		Customer customer = null;
		try {
			long mobile = Long.parseLong(user);
			customer = repository.findByMno(mobile);
		} catch (NumberFormatException e) {
			String email = user;
			customer = repository.findByEmail(email);
		}
		if (customer == null) {
			view.addObject("fail", "Incorrect Email or Mobile");
			view.setViewName("/login");
		} else {
			if (customer.getPwd().equals(password)) {
				view.addObject("pass", "Login Success");
				view.setViewName("/home");
			} else {
				view.addObject("fail", "Incorrect Password");
				view.setViewName("/login");
			}
		}
		return view;
	}
	@GetMapping("Customer/products")
	public ModelAndView fetchAllproducts() {
		ModelAndView view = new ModelAndView();
		List<Product> list = repository1.findAll();
		if (list.isEmpty()) {
			view.addObject("fail", "data not found");
			view.setViewName("/home");
		} else {
			view.setViewName("/product");
			view.addObject("list", list);
		}
		return view;
	}
}
