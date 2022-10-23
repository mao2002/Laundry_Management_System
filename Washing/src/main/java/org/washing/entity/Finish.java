package org.washing.entity;

import java.util.Date;

public class Finish {
    private long dingdan_id;
    private Date start_time;
    private Date end_time;

    public long getDingdan_id() {
        return dingdan_id;
    }

    public void setDingdan_id(long dingdan_id) {
        this.dingdan_id = dingdan_id;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }
}
