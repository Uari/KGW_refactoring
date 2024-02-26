package com.best.kgw.service.impl;

import com.best.kgw.dao.CalendarDao;
import com.best.kgw.service.CalendarService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CalendarServiceImpl implements CalendarService {
    Logger logger = LoggerFactory.getLogger(CalendarServiceImpl.class);
    @Autowired
    private CalendarDao calendarDao;

    @Override
    public List<Map<String, Object>> calendarList(Map<String, Object> cMap) {
        List<Map<String, Object>> calendarList = null;
        logger.info("Service : calendarList 호출");
        try {
            calendarList = calendarDao.calendarList(cMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return calendarList;
    }

    @Override
    public List<Map<String, Object>> assetList(Map<String, Object> aMap) {
        List<Map<String, Object>> assetList = null;
        logger.info("Service : assetList 호출");
        try {
            assetList = calendarDao.assetList(aMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return assetList;
    }

    @Override
    public List<Map<String, Object>> assetReservationList(Map<String, Object> arMap) {
        List<Map<String, Object>> assetReservationList = null;
        logger.info("Service : assetReservationList 호출");
        try {
            assetReservationList = calendarDao.assetReservationList(arMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return assetReservationList;
    }

    @Override
    public List<Map<String, Object>> addList(Map<String, Object> addMap) {
        List<Map<String, Object>> addList = null;
        logger.info("Service : delList 호출");
        try {
            addList = calendarDao.addList(addMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return addList;
    }
    @Override
    public List<Map<String, Object>> delList(Map<String, Object> delMap) {
        List<Map<String, Object>> delList = null;
        logger.info("Service : delList 호출");
        try {
            delList = calendarDao.delList(delMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return delList;
    }

    @Override
    public List<Map<String, Object>> upList(Map<String, Object> upMap) {
        List<Map<String, Object>> upList = null;
        logger.info("Service : upList 호출");
        try {
            upList = calendarDao.upList(upMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return upList;
    }

    @Override
    public List<Map<String, Object>> reservList(Map<String, Object> reservMap) {
        List<Map<String, Object>> reservList = null;
        logger.info("Service : upList 호출");
        try {
            reservList = calendarDao.reservList(reservMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return reservList;
    }

    @Override
    public List<Map<String, Object>> myReservList(Map<String, Object> myReservMap) {
        List<Map<String, Object>> myReservList = null;
        logger.info("Service : upList 호출");
        try {
            myReservList = calendarDao.myReservList(myReservMap);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return myReservList;
    }

}
