package org.washing.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.washing.entity.YongHu;

import java.util.List;

@Repository
public interface YongHuDao {
    //添加用户
    int insert_yonghu(@Param("yh_phone") long yh_phone,@Param("name") String name,@Param("pw") String pw, @Param("sex") String sex, @Param("age") short age, @Param("home") String home, @Param("huiyuan") short huiyuan);
    //通过用户id删除该用户
    void delete_yonghu(long id);
    //通过会员id删除会员身份
    void delete_huiyuan(long id);
    //修改用户信息//修改会员信息
    int update_yonghu(@Param("yh_id") long yh_id,@Param("yh_phone") long yh_phone,@Param("name") String name,@Param("pw") String pw, @Param("sex") String sex, @Param("age") short age, @Param("home") String home);
    //添加会员
    int insert_huiyuan(long id);
    //通过用户姓名查出用户
    List<YongHu> query_yonghu(String name);
    //通过用过会员姓名查出会员
    List<YongHu> query_huiyuan(String name);
    //查询所有
    List<YongHu> queryAll_yonghu();
    //查询所有会员
    List<YongHu> queryAll_huiyuan();
    //查询所有非会员
    List<YongHu> queryAll_Nohuiyuan();
}
