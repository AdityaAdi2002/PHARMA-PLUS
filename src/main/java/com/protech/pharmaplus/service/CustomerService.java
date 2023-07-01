package com.protech.pharmaplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import com.protech.pharmaplus.dto.Customer;
import com.protech.pharmaplus.dto.Product;
import com.protech.pharmaplus.repository.CustomerRepository;
import com.protech.pharmaplus.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class CustomerService {
	@Autowired 
	CustomerRepository customerRepository;
@Autowired
ProductRepository productRepository;
public String signup(Customer customer, ModelMap model) {
	Customer customer1 = null;
	try {
		long mobile = customer.getMno();
		customer1 = customerRepository.findByMno(mobile);
	} catch (NumberFormatException e) {
		String email = customer.getEmail();
		customer1 = customerRepository.findByEmail(email);
	}
	if (customer1 == null) {
		customerRepository.save(customer);
		model.put("pass", "Data Saved Succesfully");
		return "Home";
	} else {
		model.put("fail", "Email or Mobile Already Exists");
		return "AdminSignup";
	}

}
public String login(String user, String password, HttpSession session, ModelMap model) {
	Customer customer = null;
	try {
		long mobile = Long.parseLong(user);
		customer = customerRepository.findByMno(mobile);
	} catch (NumberFormatException e) {
		String email = user;
		customer = customerRepository.findByEmail(email);
	}
	if (customer == null) {
		model.put("fail", "Incorrect Email or Mobile");
		return "CustomerLogin";
	} else {
		if (customer.getPwd().equals(password)) {
			session.setAttribute("customer", customer);
			model.put("pass", "Login Success");
			return "Home";
		} else {
			model.put("fail", "Incorrect Password");
			return "CustomerLogin";
		}
	}
	
}
public String fetchProducts(ModelMap model) {
	
	List<Product> list = productRepository.findAll();
	if (list.isEmpty()) {
		model.put("fail", "data not found");
		return "Home";
	} else {
		
		model.put("list", list);
		return "CustomerProduct";
	}
	
}
public String addToCart(HttpSession session, ModelMap model) {
	
	if (session.getAttribute("customer") == null) {
		view.setViewName("/login");
		view.addObject("fail", "First Login to Add to Cart");
	} else {
		// Logic to add to cart
		view.setViewName("/home");
	}
	return view;
	return null;
}

}
