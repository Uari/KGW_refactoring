package com.best.kgw.dao;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface ReservationDao {

    List<Map<String, Object>> assetList(@RequestParam Map<String, Object> aMap) throws Exception;

    List<Map<String, Object>> assetReservationList(Map<String, Object> arMap) throws Exception;

    List<Map<String, Object>> delReservList(Map<String, Object> delMap) throws Exception;

    List<Map<String, Object>> addReservList(Map<String, Object> addMap) throws Exception;

    List<Map<String, Object>> upReservList(Map<String, Object> upMap) throws Exception;

    List<Map<String, Object>> reservList(Map<String, Object> reservMap) throws Exception;

    List<Map<String, Object>> myReservList(Map<String, Object> myReservMap) throws Exception;
}