package org.washing.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.washing.entity.XiangMu;
import org.washing.entity.YongHu;

import java.util.List;

@Repository
public interface XiangMuDao {
    //增加项目
    int insert_xiangmu(@Param("xiangmu_name") String xiangmu_name, @Param("shoufei") int shoufei);
    //通过项目id删除项目
    void delete_xiangmu(long id);
    //修改项目信息
    int update_xiangmu(@Param("xinagmu_id") long xinagmu_id,@Param("xiangmu_name") String xiangmu_name,@Param("shoufei") int shoufei);
    //通过项目名查出项目
    XiangMu query_xiangmu(String xiangmu_name);
    //查询所有项目
    List<XiangMu> queryAll_xiangmu();
}
