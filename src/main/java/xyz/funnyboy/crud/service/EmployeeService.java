package xyz.funnyboy.crud.service;

import org.springframework.ui.Model;
import xyz.funnyboy.crud.model.Employee;

import javax.validation.Valid;
import java.util.List;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月14日19时17分
 * @desciption This is a program.
 * @since Java10
 */
public interface EmployeeService {
    List getAll();

    int insertEmp(Employee employee);

    boolean validateUserUsable(String empName);

    Employee getEmp(Integer id);

    int updateEmp(@Valid Employee employee);

    int delEmpById(Integer empId);
}
