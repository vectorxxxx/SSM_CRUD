package xyz.funnyboy.crud.controller;

import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import xyz.funnyboy.crud.model.Employee;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月14日19时35分
 * @desciption This is a program.
 * @since Java10
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring-*.xml"})
public class EmployeeControllderTest {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testGet() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("http:118.25.181.243:8080/ChatRobot/emps").param("pg", "5")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.err.println("当前页：" + pageInfo.getPageNum());
        System.err.println("总页数：" + pageInfo.getPages());
        System.err.println("总记录数：" + pageInfo.getTotal());
        System.out.println("当前显示页码：");
        for (int i : pageInfo.getNavigatepageNums()) {
            System.err.print(i + " ");
        }
        for (Object employee : pageInfo.getList()) {
            System.err.println((Employee) employee);
        }
    }
}
