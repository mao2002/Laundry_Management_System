package org.washing.entity;

public class YongHu {
    private long yh_id;
    private long yh_phone;
    private String name;
    private String pw;
    private String sex;
    private short age;
    private String home;
    private short huiyuan;
    private String hui;



    public long getYh_id() {
        return yh_id;
    }

    public void setYh_id(long yh_id) {
        this.yh_id = yh_id;
    }

    public long getYh_phone() {
        return yh_phone;
    }

    public void setYh_phone(long yh_phone) {
        this.yh_phone = yh_phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public short getAge() {
        return age;
    }

    public void setAge(short age) {
        this.age = age;
    }

    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public short getHuiyuan() {
        return huiyuan;
    }

    public void setHuiyuan(short huiyuan) {
        this.huiyuan = huiyuan;
        if(huiyuan==1){
            this.hui="是";
        }
        else{
            this.hui="否";
        }
    }

    public String getHui() {
        return hui;
    }

    @Override
    public String toString() {
        return "YongHu{" +
                "yh_id=" + yh_id +
                ", yh_phone=" + yh_phone +
                ", name='" + name + '\'' +
                ", pw='" + pw + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", home='" + home + '\'' +
                ", huiyuan=" + huiyuan +
                ", hui='" + hui + '\'' +
                '}';
    }
}
