package com.twan.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by twan on 2017/11/9.
 */

public class Room implements Serializable {
    private int id;
    private int roomid;//
    private String roomname;//房间名称
    private String rtype;//房间类别
    private int bedcnt;//床位
    private int istimer;//是否计时

    private Timestamp logtime;
    private Timestamp createtime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public String getRtype() {
        return rtype;
    }

    public void setRtype(String rtype) {
        this.rtype = rtype;
    }

    public int getBedcnt() {
        return bedcnt;
    }

    public void setBedcnt(int bedcnt) {
        this.bedcnt = bedcnt;
    }

    public int getIstimer() {
        return istimer;
    }

    public void setIstimer(int istimer) {
        this.istimer = istimer;
    }

    public Timestamp getLogtime() {
        return logtime;
    }

    public void setLogtime(Timestamp logtime) {
        this.logtime = logtime;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", roomid=" + roomid +
                ", roomname='" + roomname + '\'' +
                ", rtype='" + rtype + '\'' +
                ", bedcnt=" + bedcnt +
                ", istimer=" + istimer +
                ", logtime='" + logtime + '\'' +
                ", createtime='" + createtime + '\'' +
                '}';
    }
}
