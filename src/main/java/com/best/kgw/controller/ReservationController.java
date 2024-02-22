package com.best.kgw.controller;

import com.best.kgw.service.CalendarService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
    Logger logger = LoggerFactory.getLogger(ReservationController.class);
    @Autowired
    private CalendarService calendarService;

    @GetMapping("reservationList")
    public String reservationList(@RequestParam Map<String, Object> cMap, @RequestParam Map<String, Object> aMap, @RequestParam Map<String, Object> arMap, Model model){
        List<Map<String, Object>> calendarList;
        List<Map<String, Object>> assetList;
        List<Map<String, Object>> assetReservationList;
        logger.info("calendarController: calendarList 호출");
        logger.info("calendarController: assetList 호출");
        logger.info("calendarController: assetReservationList 호출");
        calendarList = calendarService.calendarList(cMap);
        assetList = calendarService.assetList(aMap);
        assetReservationList = calendarService.assetReservationList(arMap);
        logger.info(calendarList.toString());
        logger.info(assetList.toString());
        logger.info(assetReservationList.toString());
        model.addAttribute("calendarList", calendarList);
        model.addAttribute("assetList", assetList);
        model.addAttribute("assetReservationList", assetReservationList);
        return "forward:/reservation/reservation.jsp";
    }

    @PostMapping("/addReservation")
    public String addList(@RequestParam Map<String, Object> addMap, Model model){
        List<Map<String, Object>> addList;
        logger.info("calendarController: delList 호출");
        addList = calendarService.addList(addMap);
        logger.info(addList.toString());
        model.addAttribute("addList", addList);
        return "forward:/reservation/reservation.jsp";
    }

    @DeleteMapping("/delReservation")
    public String delList(@RequestParam Map<String, Object> delMap, Model model){
        List<Map<String, Object>> delList;
        logger.info("calendarController: delList 호출");
        delList = calendarService.delList(delMap);
        logger.info(delList.toString());
        model.addAttribute("delList", delList);
        return "forward:/reservation/reservation.jsp";
    }

}
