package org.washing.service;

import org.washing.entity.DingDan;
import org.washing.entity.GuanLiYuan;
import org.washing.entity.XiangMu;
import org.washing.entity.YongHu;

import java.util.List;
import java.util.Map;

public interface WashingService {
    //查询所有用户
    List<YongHu> queryALL_YongHu();
    //查询所有会员
    List<YongHu> queryALL_HuiYuan();
    //查询所有非会员
    List<YongHu> queryALL_NoHuiYuan();
    //查询所有订单
    List<DingDan> queryALL_DingDan();
    //查询所有项目
    List<XiangMu> queryALL_XiangMu();
    //添加用户
    Map<String,Object> insert_Yonghu(YongHu yongHu);
    //更改用户//更改会员
    Map<String,Object> update_Yonghu(YongHu yongHu);
    //删除用户
    Map<String,Object> delete_Yonghu(YongHu yongHu);
    //删除会员
    Map<String,Object> delete_Huiyuan(YongHu yongHu);
    //删除订单
    Map<String,Object> delete_Dingdan(DingDan dingDan);
    //删除项目
    Map<String,Object> insert_Xiangmu(XiangMu xiangMu);
    //修改项目
    Map<String,Object> update_Xiangmu(XiangMu xiangMu);
    //删除项目
    Map<String ,Object> delete_Xiangmu(XiangMu xiangMu);
    //普通用户登录验证
    Map<String ,Object> common_LoginJudge(GuanLiYuan guanLiYuan);

    Map<String, Object> common_LoginJudgemax(GuanLiYuan guanLiYuan);

    Map<String, Object> delete_Guanli(GuanLiYuan guanLiYuan);

    Map<String, Object> update_Guanli(GuanLiYuan guanLiYuan);

    Map<String, Object> insert_Guanli(GuanLiYuan guanLiYuan);

    List<GuanLiYuan> queryALL_Guanli();

    Map<String, Object> update_dingdan(DingDan dingDan);

    Map<String, Object> insert_Huiuan(YongHu yongHu);

    Map<String, Object> insert_dingdan(DingDan dingDan);
}
