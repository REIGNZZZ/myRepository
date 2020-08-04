package com.reignzzz.mavenssm.constant;

public class ZZZResult {

    private String msg;
    private Object data;

    public ZZZResult(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
