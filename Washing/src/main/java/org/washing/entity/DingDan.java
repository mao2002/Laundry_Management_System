package org.washing.entity;

import java.util.Date;

public class DingDan {
    private long dingdan_id;
    private long yh_id;
    private long xiangmu_id;
    private String pingpi;
    private String kuanshi;
    private Date xiadan_time;
    private short wancheng;
    private String name;
    private String xiangmu_name;
    private String shoufei;
    private String wan;


    public long getDingdan_id() {
        return dingdan_id;
    }

    public void setDingdan_id(long dingdan_id) {
        this.dingdan_id = dingdan_id;
    }

    public long getYh_id() {
        return yh_id;
    }

    public void setYh_id(long yh_id) {
        this.yh_id = yh_id;
    }

    public long getXiangmu_id() {
        return xiangmu_id;
    }

    public void setXiangmu_id(long xiangmu_id) {
        this.xiangmu_id = xiangmu_id;
    }

    public String getPingpi() {
        return pingpi;
    }

    public void setPingpi(String pingpi) {
        this.pingpi = pingpi;
    }

    public String getKuanshi() {
        return kuanshi;
    }

    public void setKuanshi(String kuanshi) {
        this.kuanshi = kuanshi;
    }

    public Date getXiadan_time() {
        return xiadan_time;
    }

    public void setXiadan_time(Date xiadan_time) {
        this.xiadan_time = xiadan_time;
    }

    public short getWancheng() {
        return wancheng;
    }

    public void setWancheng(short wancheng) {
        this.wancheng = wancheng;
        if(wancheng==1){
            this.wan="是";
        }
        else {
            this.wan="否";
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getXiangmu_name() {
        return xiangmu_name;
    }

    public void setXiangmu_name(String xiangmu_name) {
        this.xiangmu_name = xiangmu_name;
    }

    public String getShoufei() {
        return shoufei;
    }

    public void setShoufei(String shoufei) {
        this.shoufei = shoufei;
    }
    public String getWan() {
        return wan;
    }
}
