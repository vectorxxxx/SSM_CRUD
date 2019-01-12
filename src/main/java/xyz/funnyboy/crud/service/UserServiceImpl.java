package xyz.funnyboy.crud.service;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2018年12月30日19时17分
 * @desciption This is a program.
 * @since Java10
 */

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Resource
    private IUserDao userDao;

    public User selectUser(int userId) {
        return this.userDao.selectUser(userId);
    }

}
