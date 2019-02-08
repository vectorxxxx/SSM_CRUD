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
    // 查询所有员工
    List getAll();
    // 新增员工信息
    int insertEmp(Employee employee);
    // 校验员工可用性
    boolean validateUserUsable(String empName);
    // 查询单个员工
    Employee getEmp(Integer id);
    // 更新员工信息
    int updateEmp(@Valid Employee employee);
    // 删除单个员工
    int delEmpById(Integer empId);
    // 批量删除员工
    int delEmps(String empIds);
}
