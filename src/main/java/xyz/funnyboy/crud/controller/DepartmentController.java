package xyz.funnyboy.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.funnyboy.crud.model.Department;
import xyz.funnyboy.crud.model.Msg;
import xyz.funnyboy.crud.service.DepartmentService;

import java.util.List;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月17日18时49分
 * @desciption This is a program.
 * @since Java10
 */
@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts() {
        List<Department> list = departmentService.getDeptName();
        return Msg.success().add("depts",list);
    }
}
