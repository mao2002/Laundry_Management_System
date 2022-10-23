package org.washing.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.washing.entity.GuanLiYuan;

import javax.annotation.Resource;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-dao.xml"})
public class GuanLiYuanDaoTest {

    @Resource
    private GuanLiYuanDao guanLiYuanDao;
    @Test
    public void insert_guanliyuan() {
    }

    @Test
    public void delete_guanliyuan() {
    }

    @Test
    public void update_guanliyuan() {
    }

    @Test
    public void query_guanliyuan() {
    }

    @Test
    public void query_guanliyuanID() {
        GuanLiYuan guanLiYuan=guanLiYuanDao.query_guanliyuanID(1001);
        System.out.println(guanLiYuan.getName());
    }

    @Test
    public void queryAll_guanliyuan() {
    }
}