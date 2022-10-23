package org.washing.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.washing.entity.DingDan;
import org.washing.entity.GuanLiYuan;
import org.washing.entity.XiangMu;
import org.washing.entity.YongHu;
import org.washing.service.WashingService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class WashingController {
    private WashingService washingService;
    @Autowired
    public WashingController(WashingService washingService) {
        this.washingService = washingService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String Login(Model model){
        return "login";
    }
    @RequestMapping(value = "/{name}/{select}/guanli",method = RequestMethod.GET)
    public String guanliyuanget(@PathVariable("name") String name ,@PathVariable("select") boolean select,Model model){
        model.addAttribute("name",name);
        model.addAttribute("select",select);
        return "guanliyuan";
    }
    @RequestMapping(value = "/guanli",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> guanliyuan(@RequestBody GuanLiYuan guanLiYuan, Model model){
        return washingService.common_LoginJudge(guanLiYuan);
    }
    @RequestMapping(value = "/max",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> max(@RequestBody GuanLiYuan guanLiYuan, Model model){
        return washingService.common_LoginJudgemax(guanLiYuan);
    }
    @RequestMapping(value = "/maxguanliyuan", method = RequestMethod.GET)
    public String maxguanliyuan(Model model) {
        return "maxguanliyuan";
    }
    @RequestMapping(value = "/yonghulist", method = RequestMethod.GET)
    public String yonghulist(Model model) {
        //获取列表项
        List<YongHu> yonghu  = washingService.queryALL_YongHu();
        model.addAttribute("yonghu", yonghu);
        return "putongyonghu";
    }
    @RequestMapping(value = "/huiyuanlist",method = RequestMethod.GET)
    public String huiyuanlist(Model model){
        List<YongHu> yonghu=washingService.queryALL_HuiYuan();
        model.addAttribute("yonghu",yonghu);
        return "huiyuan";
    }
    @RequestMapping(value = "/Nohuiyuanlist",method = RequestMethod.GET)
    public String Nohuiyuanlist(Model model){
        List<YongHu> yonghu=washingService.queryALL_NoHuiYuan();
        model.addAttribute("yonghu",yonghu);
        return "insert_huiyuan";
    }
    @RequestMapping(value = "/xiangmulist",method = RequestMethod.GET)
    public String xiangmulist(Model model){
        List<XiangMu> xiangmu=washingService.queryALL_XiangMu();
        model.addAttribute("xiangmu",xiangmu);
        return "xiangmu";
    }
    @RequestMapping(value = "/dingdanlist",method = RequestMethod.GET)
    public String dingdanlist(Model model){
        List<DingDan> dingdan=washingService.queryALL_DingDan();
        model.addAttribute("dingdan",dingdan);
        return "dingdan";
    }
    @RequestMapping(value = "/insert_dingdanlist",method = RequestMethod.GET)
    public String insert_dingdanlist(Model model){
        List<YongHu> yonghu=washingService.queryALL_YongHu();
        List<XiangMu> xiangmu=washingService.queryALL_XiangMu();
        model.addAttribute("yonghu",yonghu);
        model.addAttribute("xiangmu",xiangmu);
        return "insert_dingdan";
    }
    @RequestMapping(value = "/yuangonglist",method = RequestMethod.GET)
    public String yuangonglist(Model model){
        List<GuanLiYuan> yuangong=washingService.queryALL_Guanli();
        model.addAttribute("yuangong",yuangong);
        return "yuangong";
    }
    //TODO 忘了添加@ResponseBody导致找了好久bug
    @RequestMapping(value = "/yonghu_insert",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> yonghu_insert(@RequestBody YongHu yongHu){
        return washingService.insert_Yonghu(yongHu);
    }
    @RequestMapping(value = "/yonghu_update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> yonghu_update(@RequestBody YongHu yongHu){
        return washingService.update_Yonghu(yongHu);
    }
    @RequestMapping(value = "/yonghu_delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> yonghu_delete(@RequestBody YongHu yongHu){
        return washingService.delete_Yonghu(yongHu);
    }
    @RequestMapping(value = "/huiyuan_delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> huiyuan_delete(@RequestBody YongHu yongHu){
        return washingService.delete_Huiyuan(yongHu);
    }
    @RequestMapping(value = "/huiyuan_insert",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> huiyuan_insert(@RequestBody YongHu yongHu){
        return washingService.insert_Huiuan(yongHu);
    }
    @RequestMapping(value = "/dingdan_delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> dingdan_delete(@RequestBody DingDan dingDan){
        return washingService.delete_Dingdan(dingDan);
    }

    @RequestMapping(value = "/xiangmu_insert",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> xiangmu_insert(@RequestBody XiangMu xiangMu){
        return washingService.insert_Xiangmu(xiangMu);
    }
    @RequestMapping(value = "/xiangmu_update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> xiangmu_update(@RequestBody XiangMu xiangMu){
        return washingService.update_Xiangmu(xiangMu);
    }
    @RequestMapping(value = "/xiangmu_delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> xiangmu_delete(@RequestBody XiangMu xiangMu){
        return washingService.delete_Xiangmu(xiangMu);
    }
    @RequestMapping(value = "/guanli_delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> guanli_delete(@RequestBody GuanLiYuan guanLiYuan){
        return washingService.delete_Guanli(guanLiYuan);
    }
    @RequestMapping(value = "/guanli_update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> guanli_update(@RequestBody GuanLiYuan guanLiYuan){
        return washingService.update_Guanli(guanLiYuan);
    }
    @RequestMapping(value = "/guanli_insert",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> guanli_insert(@RequestBody GuanLiYuan guanLiYuan){
        return washingService.insert_Guanli(guanLiYuan);
    }
    @RequestMapping(value = "/dingdan_update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> dingdan_update(@RequestBody DingDan dingDan){
        return washingService.update_dingdan(dingDan);
    }
    @RequestMapping(value = "/dingdan_insert",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> dingdan_insert(@RequestBody DingDan dingDan){
        return washingService.insert_dingdan(dingDan);
    }
}
