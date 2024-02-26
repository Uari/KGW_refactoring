package com.best.kgw.service.impl;

import com.best.kgw.dao.PlayerDao;
import com.best.kgw.service.PlayerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class PlayerServiceImpl  implements PlayerService {
    Logger logger=LoggerFactory.getLogger("PlayerService".getClass());
    @Autowired
    PlayerDao playerDao;

    @Override
    public List<Map<String,Object>> hitterList(Map<String,Object>hMap){
        List<Map<String,Object>>list=new ArrayList<>();
        list=playerDao.hitterList(hMap);
        logger.info("hMap"+hMap);
        return list;
    }
@Override
    public List<Map<String, Object>> pitcherList(Map<String ,Object>pMap){
    List<Map<String,Object>>list2=new ArrayList<>();
        list2=playerDao.pitcherList(pMap);
        return list2;
}
}
