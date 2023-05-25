package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.RegisterOrder;

import java.util.List;

public interface RegisterOrderService {
    boolean saveOrUpdateOrder(RegisterOrder registerOrder);

    PageInfo<RegisterOrder> getOrderByCondition(RegisterOrder registerOrder, Integer pageNum, Integer pageSize);

    boolean deleteByOrderId(String id);

    RegisterOrder findOrderById(String id);

    List<RegisterOrder> findAllOrder();

    void acOrderById(String registerOrderId);
}
