package xyz.funnyboy.crud;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import xyz.funnyboy.crud.dao.DepartmentMapper;
import xyz.funnyboy.crud.dao.EmployeeMapper;
import xyz.funnyboy.crud.model.Department;
import xyz.funnyboy.crud.model.Employee;

import java.util.UUID;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月13日18时54分
 * @desciption This is a program.
 * @since Java10
 */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class MapperTest {
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

//    @Test
    public void testCRUD() {
//        System.out.println(departmentMapper);
//        departmentMapper.insertSelective(new Department(null, "研发部"));
//        departmentMapper.insertSelective(new Department(null, "技术部"));

//        employeeMapper.insertSelective(new Employee(null, "刘备", "男", "liubei@qq.com", 1));

        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            employeeMapper.insertSelective(new Employee(null, uid, "男", uid + "@funnyboy.xyz", 1));
        }
    }
//    @Test
    public void testDelete(){
        employeeMapper.deleteByPrimaryKey(1001);
    }
//    @Test
    public void testUpdate(){
        employeeMapper.updateByPrimaryKey(new Employee(1,"刘备","男","liubei@funnyboy.xyz",1));
    }
//    @Test
    public void testSelect() {
        Employee employee = employeeMapper.selectByPrimaryKey(1);
        System.err.println(employee.getEmpName());
    }

}
