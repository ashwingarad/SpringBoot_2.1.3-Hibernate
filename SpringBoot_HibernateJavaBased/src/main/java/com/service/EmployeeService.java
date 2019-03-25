/**
 * SpringMVC-AjaxWithHibernate
 */
package com.service;

import java.util.List;

import com.model.Employee;

/**
 * @author Ashwin
 */
public interface EmployeeService {
    boolean saveService(Employee employee);

    boolean deleteService(Long id);

    Employee getService(Long id);

    List<Employee> getListService();
}
