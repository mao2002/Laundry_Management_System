package org.washing.dao;

import org.apache.ibatis.annotations.Param;
import org.washing.entity.GuanLiYuan;
import org.washing.entity.XiangMu;

import java.util.List;

public interface GuanLiYuanDao {
    //增加管理员
    int insert_guanliyuan(@Param("name") String name, @Param("pw") String pw);
    //通过管理员id删除管理员
    void delete_guanliyuan(long id);
    //修改管理员
    int update_guanliyuan(@Param("yh_id") long yh_id,@Param("name") String name,@Param("pw") String pw);
    //通过管理员名查出管理员
    List<GuanLiYuan> query_guanliyuan(String name);
    //通过管理员名查出管理员
    GuanLiYuan query_guanliyuanID(long id);
    //查询所有管理员除了1000
    List<GuanLiYuan> queryAll_guanliyuan();
}
