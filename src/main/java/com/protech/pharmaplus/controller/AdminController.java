package com.protech.pharmaplus.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.protech.pharmaplus.dto.Customer;
import com.protech.pharmaplus.dto.Product;
import com.protech.pharmaplus.repository.CustomerRepository;
import com.protech.pharmaplus.repository.ProductRepository;

@Controller
public class AdminController {

	@Autowired
	ProductRepository repository;

	@Autowired
	CustomerRepository repository1;
	@PostMapping("/adminlogin")
	public ModelAndView simple(@RequestParam String user, @RequestParam String pass) {

		ModelAndView view = new ModelAndView();

		if (user.equals("admin")) {
			if (pass.equals("admin")) {
				view.setViewName("/adminoperation");
				view.addObject("pass", "Login Success");
			} else {
				view.setViewName("/adminlogin");
				view.addObject("fail", "Enter proper Password");
			}
		} else {
			view.setViewName("/adminlogin");
			view.addObject("fail", "Enter proper Email");
		}

		return view;
	}

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/home");
		return view;
	}

	@PostMapping("/insertproduct")
	public ModelAndView insertProduct(@ModelAttribute Product prod, @RequestParam MultipartFile pic)
			throws IOException {
		ModelAndView view = new ModelAndView();
		byte[] image = new byte[pic.getInputStream().available()];
		pic.getInputStream().read(image);

		prod.setImage(image);
		repository.save(prod);
		view.setViewName("/adminoperation");
		view.addObject("pass", "product added success");
		return view;
	}

	@PostMapping("/updateproduct")
	public ModelAndView updateProduct(@ModelAttribute Product prod, @RequestParam MultipartFile pic)
			throws IOException {
		ModelAndView view = new ModelAndView();

		Product prod2 = repository.findById(prod.getId()).orElse(prod);
		if (prod2 == null) {
			view.setViewName("/adminoperation");
			view.addObject("fail", "Incorrect Id");
		} else {
			byte[] image = new byte[pic.getInputStream().available()];
			pic.getInputStream().read(image);

			prod.setImage(image);
			prod.setCategory(prod2.getCategory());
			prod.setSubcategory(prod2.getSubcategory());
			prod.setSize(prod2.getSize());

			repository.save(prod);
			view.setViewName("/adminoperation");
			view.addObject("pass", "product updated success");
		}
		return view;
	}

	@PostMapping("/deleteproduct")
	public ModelAndView deleteProduct(@RequestParam int id) {
		ModelAndView view = new ModelAndView();

		Product prod = repository.findById(id).orElse(null);
		if (prod == null) {
			view.setViewName("/adminoperation");
			view.addObject("fail", "Incorrect Id");
		} else {
			repository.deleteById(id);
			view.setViewName("/adminoperation");
			view.addObject("pass", "product deleted success");

		}
		return view;
	}

	@GetMapping("/admin/products")
	public ModelAndView FetchAllProduct() {
		ModelAndView view = new ModelAndView();
		List<Product> list = repository.findAll();
		if (list.isEmpty()) {
			view.addObject("fail", "data not found");
			view.setViewName("/adminoperation");
		} else {
			view.setViewName("/admincart");
			view.addObject("list", list);
		}

		return view;
	}
	@GetMapping("/admin/Customer")
	public ModelAndView fetchAllCustomer() {
		ModelAndView view = new ModelAndView();
		List<Customer> list = repository1.findAll();
		if (list.isEmpty()) {
			view.addObject("fail", "data not found");
			view.setViewName("/adminoperation");
		} else {
			view.setViewName("/viewcustomers");
			view.addObject("list", list);
		}

		return view;
	}
}
