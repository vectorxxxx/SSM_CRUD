package xyz.funnyboy.crud.dao;

import xyz.funnyboy.crud.model.User;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2018年12月30日19时17分
 * @desciption This is a program.
 * @since Java10
 */
public interface IUserDao {
    User selectUser(int id);
}
