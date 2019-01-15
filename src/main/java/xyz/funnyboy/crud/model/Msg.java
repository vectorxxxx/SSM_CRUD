package xyz.funnyboy.crud.model;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2019年01月15日20时43分
 * @desciption This is a program.
 * @since Java10
 */
public class Msg {
    private int code;
    private String message;
    private Map<String, Object> extend = new HashMap<String, Object>();

    public Msg add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }

    public static Msg success() {
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMessage("Handle Success");
        return msg;
    }

    public static Msg failed() {
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMessage("Handle Failed");
        return msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
