package xyz.funnyboy.crud.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.funnyboy.crud.dao.DepartmentMapper;
import xyz.funnyboy.crud.model.Department;
import xyz.funnyboy.crud.service.DepartmentService;

import java.util.List;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月17日18时54分
 * @desciption This is a program.
 * @since Java10
 */
@Service
public class IDepartmentService implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDeptName() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
