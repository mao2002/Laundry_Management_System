package org.washing.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.washing.entity.YongHu;

import javax.annotation.Resource;
import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-dao.xml"})
public class YongHuDaoTest {
    @Resource
    private YongHuDao yongHuDao;
    @Test
    public void insert_yonghu() {
    }

    @Test
    public void delete_yonghu() {
    }

    @Test
    public void delete_huiyuan() {
    }

    @Test
    public void update_yonghu() {
    }

    @Test
    public void query_yonghu() {
    }

    @Test
    public void query_huiyuan() {
    }

    @Test
    public void queryAll_yonghu() {
        List<YongHu> list=yongHuDao.queryAll_yonghu();
        System.out.println(list);
    }

    @Test
    public void queryAll_huiyuan() {
    }
}