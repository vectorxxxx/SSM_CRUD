package xyz.funnyboy.crud.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import xyz.funnyboy.crud.dao.EmployeeMapper;
import xyz.funnyboy.crud.model.Employee;
import xyz.funnyboy.crud.model.EmployeeExample;
import xyz.funnyboy.crud.service.EmployeeService;

import java.util.List;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月14日19时19分
 * @desciption This is a program.
 * @since Java10
 */
@Service
public class IEmployeeService implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    public List getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public int insertEmp(Employee employee) {
        return employeeMapper.insertSelective(employee);
    }

    public boolean validateUserUsable(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        return employeeMapper.countByExample(example) == 0;
    }

    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }
}
