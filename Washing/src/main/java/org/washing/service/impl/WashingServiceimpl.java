package org.washing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.washing.dao.DingDanDao;
import org.washing.dao.GuanLiYuanDao;
import org.washing.dao.XiangMuDao;
import org.washing.dao.YongHuDao;
import org.washing.entity.DingDan;
import org.washing.entity.GuanLiYuan;
import org.washing.entity.XiangMu;
import org.washing.entity.YongHu;
import org.washing.service.WashingService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WashingServiceimpl implements WashingService {
    private DingDanDao dingDanDao;
    private GuanLiYuanDao guanLiYuanDao;
    private XiangMuDao xiangMuDao;
    private YongHuDao yongHuDao;
    private Map<String,Object> update_judge=new HashMap<>();
    private Map<String,Object> delete_judge=new HashMap<>();
    private Map<String,Object> insert_judge=new HashMap<>();
    private Map<String,Object> login_judge=new HashMap<>();

    //初始化返回给前端的处理信息
    @Autowired
    public WashingServiceimpl(DingDanDao dingDanDao, GuanLiYuanDao guanLiYuanDao, XiangMuDao xiangMuDao, YongHuDao yongHuDao) {
        this.dingDanDao = dingDanDao;
        this.guanLiYuanDao = guanLiYuanDao;
        this.xiangMuDao = xiangMuDao;
        this.yongHuDao = yongHuDao;
        delete_judge.put("state",true);
        update_judge.put("state",true);
        insert_judge.put("state",true);
        login_judge.put("state",true);
        delete_judge.put("msg","删除成功");
        update_judge.put("msg","修改成功");
        insert_judge.put("msg","添加成功");
        login_judge.put("msg","登录成功");
    }

    //查询所有用户
    @Override
    public List<YongHu> queryALL_YongHu() {
        return yongHuDao.queryAll_yonghu();
    }

    //查询所有会员用户
    @Override
    public List<YongHu> queryALL_HuiYuan() {
        return yongHuDao.queryAll_huiyuan();
    }

    //查询所有非会员用户
    @Override
    public List<YongHu> queryALL_NoHuiYuan() { return yongHuDao.queryAll_Nohuiyuan();}

    //查询所有订单
    @Override
    public List<DingDan> queryALL_DingDan() {
        return dingDanDao.queryAll_dingdan();
    }

    //查询所有洗衣项目
    @Override
    public List<XiangMu> queryALL_XiangMu() {
        return xiangMuDao.queryAll_xiangmu();
    }

    //查询所有管理员
    @Override
    public List<GuanLiYuan> queryALL_Guanli() {return guanLiYuanDao.queryAll_guanliyuan();}

    //添加用户
    @Override
    public Map<String,Object> insert_Yonghu(YongHu yongHu) {
        int count= yongHuDao.insert_yonghu(yongHu.getYh_phone(),yongHu.getName(),yongHu.getPw(),yongHu.getSex(),yongHu.getAge(),yongHu.getHome(),yongHu.getHuiyuan());
        if(count<=0) {
            insert_judge.put("state",false);
            insert_judge.put("msg","添加失败,手机号重复");
        }
        else{
            insert_judge.put("state",true);
            insert_judge.put("msg","添加成功");
        }
        return  insert_judge;
    }

    //修改用户
    @Override
    public Map<String,Object> update_Yonghu(YongHu yongHu) {
        int count=yongHuDao.update_yonghu(yongHu.getYh_id(),yongHu.getYh_phone(),yongHu.getName(),yongHu.getPw(),yongHu.getSex(),yongHu.getAge(),yongHu.getHome());
        if(count<=0) {
            update_judge.put("state",false);
            update_judge.put("msg","修改失败，手机号重复");
        }
        else{
            update_judge.put("state",true);
            update_judge.put("msg","修改成功");
        }
        return  update_judge;
    }

    //删除用户
    @Override
    public Map<String,Object> delete_Yonghu(YongHu yongHu) {
        yongHuDao.delete_yonghu(yongHu.getYh_id());
        dingDanDao.delete_dingdan(yongHu.getYh_id());
        return delete_judge;
    }

    //删除用户
    @Override
    public Map<String,Object> delete_Huiyuan(YongHu yongHu) {
        yongHuDao.delete_huiyuan(yongHu.getYh_id());
        return delete_judge;
    }

    //添加会员
    @Override
    public Map<String,Object> insert_Huiuan(YongHu yongHu) {
        int count= yongHuDao.insert_huiyuan(yongHu.getYh_id());
        if(count<=0) {
            insert_judge.put("state",false);
            insert_judge.put("msg","添加失败,该用户还未注册");
        }
        else{
            insert_judge.put("state",true);
            insert_judge.put("msg","添加成功");
        }
        return  insert_judge;
    }

    //删除订单
    @Override
    public Map<String, Object> delete_Dingdan(DingDan dingDan) {
        dingDanDao.delete_dingdan(dingDan.getDingdan_id());
        return delete_judge;
    }

    //添加项目
    @Override
    public Map<String, Object> insert_Xiangmu(XiangMu xiangMu) {
        int count= xiangMuDao.insert_xiangmu(xiangMu.getXiangmu_name(), xiangMu.getShoufei());
        if(count<=0) {
            insert_judge.put("state",false);
            insert_judge.put("msg","添加失败,项目名重复");
        }
        else{
            insert_judge.put("state",true);
            insert_judge.put("msg","添加成功");
        }
        return  insert_judge;
    }


    //修改项目
    @Override
    public Map<String, Object> update_Xiangmu(XiangMu xiangMu) {
        int count=xiangMuDao.update_xiangmu(xiangMu.getXiangmu_id(), xiangMu.getXiangmu_name(),xiangMu.getShoufei());
        if(count<=0) {
            update_judge.put("state",false);
            update_judge.put("msg","修改失败，项目名重复");
        }
        else{
            update_judge.put("state",true);
            update_judge.put("msg","修改成功");
        }
        return  update_judge;
    }


    //删除项目
    @Override
    public Map<String, Object> delete_Xiangmu(XiangMu xiangMu) {
         xiangMuDao.delete_xiangmu(xiangMu.getXiangmu_id());
        return delete_judge;
    }


    //普通管理员登录验证
    @Override
    public Map<String, Object> common_LoginJudge(GuanLiYuan guanLiYuan) {
        if(guanLiYuan.getYh_id()<=1000){
            login_judge.put("state",false);
            login_judge.put("msg","工号错误,本公司没有该员工!");
        }
        else{
            GuanLiYuan guanLiYuan1=guanLiYuanDao.query_guanliyuanID(guanLiYuan.getYh_id());
            if(guanLiYuan1==null){
                login_judge.put("state",false);
                login_judge.put("msg","工号错误,本公司没有该员工!");
            }
            else if(!guanLiYuan1.getPw().equals(guanLiYuan.getPw())){
                login_judge.put("state",false);
                login_judge.put("msg","密码错误!!!");
            }
            else {
                login_judge.put("state",true);
                login_judge.put("msg",guanLiYuan1.getName());
            }
        }
        return login_judge;
    }


    //最高管理员登录验证
    @Override
    public Map<String, Object> common_LoginJudgemax(GuanLiYuan guanLiYuan) {
        if(guanLiYuan.getYh_id()!=1000){
            login_judge.put("state",false);
            login_judge.put("msg","工号错误,本公司没有该员工!");
        }
        else{
            GuanLiYuan guanLiYuan1=guanLiYuanDao.query_guanliyuanID(guanLiYuan.getYh_id());
            if(guanLiYuan1==null){
                login_judge.put("state",false);
                login_judge.put("msg","工号错误,本公司没有该员工!");
            }
            else if(!guanLiYuan1.getPw().equals(guanLiYuan.getPw())){
                login_judge.put("state",false);
                login_judge.put("msg","密码错误!!!");
            }
            else {
                login_judge.put("state",true);
                login_judge.put("msg",guanLiYuan1.getName());
            }
        }
        return login_judge;
    }

    //删除普通管理员
    @Override
    public Map<String, Object> delete_Guanli(GuanLiYuan guanLiYuan) {
        guanLiYuanDao.delete_guanliyuan(guanLiYuan.getYh_id());
        return delete_judge;
    }

    //修改普通管理员
    @Override
    public Map<String, Object> update_Guanli(GuanLiYuan guanLiYuan) {
        int count=guanLiYuanDao.update_guanliyuan(guanLiYuan.getYh_id(),guanLiYuan.getName(),guanLiYuan.getPw());
//        if(count<=0) {
//            update_judge.put("state",false);
//            update_judge.put("msg","修改失败，名重复");
//        }
//        else{
//            update_judge.put("state",true);
//            update_judge.put("msg","修改成功");
//        }
        update_judge.put("state",true);
        update_judge.put("msg","修改成功");
        return  update_judge;
    }

    //添加普通管理员
    @Override
    public Map<String, Object> insert_Guanli(GuanLiYuan guanLiYuan) {
        int count=guanLiYuanDao.insert_guanliyuan(guanLiYuan.getName(),guanLiYuan.getPw());
//        if(count<=0) {
//            update_judge.put("state",false);
//            update_judge.put("msg","修改失败，名重复");
//        }
//        else{
//            update_judge.put("state",true);
//            update_judge.put("msg","修改成功");
//        }
        insert_judge.put("state",true);
        insert_judge.put("msg","添加成功");
        return  insert_judge;
    }

    //修改订单
    @Override
    public Map<String, Object> update_dingdan(DingDan dingDan) {
        int count=dingDanDao.update_dingdan(dingDan.getDingdan_id(),dingDan.getPingpi(),dingDan.getKuanshi(),dingDan.getWancheng());
//        if(count<=0) {
//            update_judge.put("state",false);
//            update_judge.put("msg","修改失败，名重复");
//        }
//        else{
//            update_judge.put("state",true);
//            update_judge.put("msg","修改成功");
//        }
        update_judge.put("state",true);
        update_judge.put("msg","修改成功");
        return  update_judge;
    }

    //添加订单
    @Override
    public Map<String, Object> insert_dingdan(DingDan dingDan) {
        int count=dingDanDao.insert_dingdan(dingDan.getYh_id(),dingDan.getXiangmu_id(),dingDan.getPingpi(),dingDan.getKuanshi(),dingDan.getWancheng(),dingDan.getShoufei());
        if(count<=0) {
            insert_judge.put("state",false);
            insert_judge.put("msg","添加失败,订单重复");
        }
        else{
            insert_judge.put("state",true);
            insert_judge.put("msg","添加成功");
        }
        return  insert_judge;
    }
}
