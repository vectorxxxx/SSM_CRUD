package xyz.funnyboy.crud;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import xyz.funnyboy.crud.dao.DepartmentMapper;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月13日18时54分
 * @desciption This is a program.
 * @since Java10
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-*.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Test
    public void testCRUD(){
        System.out.println(departmentMapper);
    }
}
