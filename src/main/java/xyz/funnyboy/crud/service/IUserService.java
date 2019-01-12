package xyz.funnyboy.crud.service;

import xyz.funnyboy.crud.model.User;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2018年12月30日19时18分
 * @desciption This is a program.
 * @since Java10
 */
public interface IUserService {
    User selectUser(int userId);
}
