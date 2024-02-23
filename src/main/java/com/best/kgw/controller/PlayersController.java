package com.best.kgw.controller;

import com.best.kgw.service.PlayerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("player")
public class PlayersController {
@Autowired
 private PlayerService playerService;

        Logger logger= LoggerFactory.getLogger("PlayersController".getClass());

    @GetMapping("/HittersList")
    public  String  hitterList(Model model, @RequestParam Map<String , Object>hMap){
        List<Map<String,Object>>list= playerService.hitterList(hMap);
        logger.info("list"+list);
        model.addAttribute("list",list);
        return "forward:HittersList.jsp";

}

    @GetMapping("/PitchersList")
    public String pithcerList(Model model,@RequestParam Map<String ,Object>pMap){
        List<Map<String ,Object>> list2=playerService.pitcherList(pMap);
        logger.info("list2"+list2);
        model.addAttribute("list2"+list2);
        return "forward:PitchersList.jsp";
    }
}
