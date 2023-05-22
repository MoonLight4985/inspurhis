package com.inspur.service;

import com.github.pagehelper.PageInfo;
import com.inspur.entity.RegisterOrder;

public interface RegisterOrderService {
    boolean saveOrUpdateOrder(RegisterOrder registerOrder);

    PageInfo<RegisterOrder> getOrderByCondition(RegisterOrder registerOrder, Integer pageNum, Integer pageSize);

    boolean deleteByOrderId(String id);

    RegisterOrder findOrderById(String id);

}
