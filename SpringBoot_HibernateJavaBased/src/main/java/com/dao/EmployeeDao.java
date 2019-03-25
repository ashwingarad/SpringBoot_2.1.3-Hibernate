/**
 * SpringMVC-AjaxWithHibernate
 */
package com.dao;

import java.util.List;

import com.model.Employee;

/**
 * @author Ashwin
 */
public interface EmployeeDao {
    boolean saveDao(Employee employee);

    boolean deleteDao(Long id);

    Employee getDao(Long id);

    List<Employee> getListDao();
}
