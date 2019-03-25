/**
 * SpringMVC-AjaxWithHibernate
 */
package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Employee;
import com.service.EmployeeService;

/**
 * @author Ashwin
 */

@Controller
public class EmployeeController {

	@Resource
	private EmployeeService employeeService;

	@GetMapping(value = "/index.html")
	public String getHome(ModelMap map, @RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "success", required = false) String success,
			@RequestParam(value = "error", required = false) String error) {

		Employee employee = null;
		if (id != null)
			employee = employeeService.getService(id);
		else
			employee = new Employee();

		if (success != null)
			map.addAttribute("success", success);
		if (error != null)
			map.addAttribute("error", error);

		map.addAttribute("employee", employee);
		return "EmployeePage";
	}

	@RequestMapping(value = "/empRegister.html", method = RequestMethod.POST)
	public String saveAndUpdateEmployee(ModelMap map, @ModelAttribute(value = "employee") @Valid Employee employee,
			BindingResult result) {
		if (result.hasErrors()) {
			map.addAttribute("error", "Binding error..");
			map.addAttribute("employee", employee);
			return "EmployeePage";
		} else {
			boolean status = employeeService.saveService(employee);
			if (!status) {
				if (employee.getId() == null) {
					map.addAttribute("success", "Saved Successfully..");
				} else {
					map.addAttribute("success", "Updated Successfully..");
				}
			} else {
				map.addAttribute("error", "Something went wrong...");
			}
		}
		return "redirect:/index.html";
	}

	@GetMapping(value = "/empDelete.html")
	public String deleteEmployee(ModelMap map, @RequestParam(value = "id") Long id) {
		if (id != null) {
			boolean status = employeeService.deleteService(id);
			if (!status)
				map.addAttribute("success", "Deleted Successfully..");
		} else {
			map.addAttribute("error", "Something went wrong...");
		}
		return "redirect:/index.html";
	}

	@ModelAttribute("employeeList")
	public List<Employee> getList() {
		return employeeService.getListService();
	}
}
