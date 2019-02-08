package xyz.funnyboy.crud.service;

import xyz.funnyboy.crud.model.Department;

import java.util.List;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月17日18时50分
 * @desciption This is a program.
 * @since Java10
 */
public interface DepartmentService {
    // 获取部门名称
    List<Department> getDeptName();
}
