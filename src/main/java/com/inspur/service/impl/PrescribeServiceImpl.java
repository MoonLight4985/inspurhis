package com.inspur.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.entity.*;
import com.inspur.mapper.PrescribeMapper;
import com.inspur.service.CostSettleDetailService;
import com.inspur.service.MedicineService;
import com.inspur.service.PrescribeService;
import com.inspur.service.RegisterOrderService;
import com.sun.scenario.effect.impl.prism.PrReflectionPeer;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class PrescribeServiceImpl implements PrescribeService {
    @Autowired
    private PrescribeMapper prescribeMapper;

    @Autowired
    private MedicineService medicineService;

    @Autowired
    private CostSettleDetailService costSettleDetailService;

    @Autowired
    private RegisterOrderService registerOrderService;

    @Override
    public List<Prescribe> getPrescribeListByOrderId(String registerOrderId) {
        List<Prescribe> prescribeList = prescribeMapper.getPrescribeListByOrderId(registerOrderId);
        return prescribeList;
    }

    @Override
    public boolean deleteByPrescribeId(String id) {
        boolean b = prescribeMapper.deleteByPrescribeId(id);
        return b;
    }

    @Override
    public boolean save(Prescribe prescribe) {
        prescribe.setStatus("0");
        String id = new DateTime().toString("yyyyMMddHHmmss");
        prescribe.setId(id);
        return prescribeMapper.save(prescribe) > 0;
    }

    @Override
    public PageInfo<Prescribe> getPrescribeListByCondition(Prescribe prescribe, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Prescribe> prescribeList = prescribeMapper.getPrescribeListByCondition(prescribe);
        PageInfo<Prescribe> pageInfo = new PageInfo<>(prescribeList);
        return pageInfo;
    }

    @Override
    public void sendMedicineById(String id, HttpServletRequest request) {
        Prescribe prescribe = prescribeMapper.getPrescribeById(id);
        prescribeMapper.sendMedicineById(id);
        int num = prescribe.getNumber();
        String medicineId = prescribe.getMedicineId();
        medicineService.sendMedicine(medicineId, num);
        Medicine medicineById = medicineService.findMedicineById(medicineId);
        CostSettleDetail costSettleDetail = new CostSettleDetail();
        costSettleDetail.setStatus("0"); // 默认状态为未结算
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        costSettleDetail.setId(simpleDateFormat.format(new Date()));

        RegisterOrder registerOrder = new RegisterOrder();//Prescribe里没有memberId，需要从RegisterOrder里查
        registerOrder = registerOrderService.findOrderById(prescribe.getRegisterOrderId());
        costSettleDetail.setMemberId(registerOrder.getMemberId());
        costSettleDetail.setSettleAmount((int) (prescribe.getNumber() * medicineById.getPrice()));
        QueryExtends queryExtends = (QueryExtends) request.getSession().getAttribute("users");// 获取结算操作人
        costSettleDetail.setUserId(queryExtends.getId());//设置操作人ID
        SimpleDateFormat simpleDateFormat1 =new SimpleDateFormat("yyyy-MM-dd");
        costSettleDetail.setCreateTime(simpleDateFormat1.format(new Date()));
        costSettleDetailService.addCostSettleDetail(costSettleDetail);
    }
}
