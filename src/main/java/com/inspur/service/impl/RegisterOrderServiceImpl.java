package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.RegisterOrder;
import com.inspur.mapper.RegisterOrderMapper;
import com.inspur.service.RegisterOrderService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class RegisterOrderServiceImpl implements RegisterOrderService {
    @Autowired
    private RegisterOrderMapper ordersMapper;

    @Override
    public boolean saveOrUpdateOrder(RegisterOrder orders) {
        String ordersId = orders.getId();
        if (ordersId == null || ordersId.equals("")) {
            return save(orders);
        } else {
            return update(orders);
        }
    }

    boolean save(RegisterOrder orders) {
        String id = new DateTime().toString("yyyyMMddHHmmss");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        orders.setOptionTime(simpleDateFormat.format(new Date()));
        orders.setStatus("1");
        orders.setId(id);
        return ordersMapper.save(orders) > 0;
    }

    boolean update(RegisterOrder orders) {
        return ordersMapper.update(orders) > 0;
    }
    @Override
    public PageInfo<RegisterOrder> getOrderByCondition(RegisterOrder registerOrder, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<RegisterOrder> ordersList = ordersMapper.findOrderByCondition(registerOrder);
        PageInfo<RegisterOrder> pageInfo = new PageInfo<>(ordersList);
        return pageInfo;
    }

    @Override
    public boolean deleteByOrderId(String id) {
        boolean b = ordersMapper.deleteByOrderId(id);
        return b;
    }

    @Override
    public RegisterOrder findOrderById(String id) {
        RegisterOrder orders = ordersMapper.findOrderById(id);
        return orders;
    }
}
