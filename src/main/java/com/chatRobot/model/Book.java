package com.chatRobot.model;

import java.util.Date;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2018年12月31日20时27分
 * @desciption This is a program.
 * @since Java10
 */
public class Book {
    private int bookid;
    private String author;
    private String title;
    private String introduction;
    private String category;
    private String publisher;
    private Date publishdate;
    private String wordcount;
    private int salesamount;
    private int storenumber;
    private double price;

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(Date publishdate) {
        this.publishdate = publishdate;
    }

    public String getWordcount() {
        return wordcount;
    }

    public void setWordcount(String wordcount) {
        this.wordcount = wordcount;
    }

    public int getSalesamount() {
        return salesamount;
    }

    public void setSalesamount(int salesamount) {
        this.salesamount = salesamount;
    }

    public int getStorenumber() {
        return storenumber;
    }

    public void setStorenumber(int storenumber) {
        this.storenumber = storenumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
