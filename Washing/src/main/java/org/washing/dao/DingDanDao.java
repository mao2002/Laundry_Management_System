package org.washing.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.washing.entity.DingDan;

import java.util.Date;
import java.util.List;

@Repository
public interface DingDanDao {
    //查询所有订单
    List<DingDan> queryAll_dingdan();

    //添加订单
    int insert_dingdan(@Param("yh_id") long yh_id, @Param("xiangmu_id") long xiangmu_id, @Param("pingpi") String pingpi, @Param("kuanshi") String kuanshi, @Param("wancheng") short wancheng,@Param("shoufei") String shoufei);
    //根据用户id删除订单
    void delete_dingdan(long id);
    //修改订单
    int update_dingdan(@Param("dingdan_id") long dingdan_id,@Param("pingpi") String pingpi,@Param("kuanshi") String kuanshi,@Param("wancheng") short wancheng);
}

