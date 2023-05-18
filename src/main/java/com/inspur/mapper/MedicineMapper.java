package com.inspur.mapper;

import com.inspur.entity.Medicine;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MedicineMapper {
    List<Medicine> findMedicineByCondition(Medicine medicine);

    @Insert("insert into medicine (id, name, purchase_price, price, number, product_unit, product_date, quality_period, supply_unit) values (#{id}, #{name}, #{purchasePrice}, #{price}, #{number}, #{productUnit}, #{productDate}, #{qualityPeriod}, #{supplyUnit})")
    int save(Medicine medicine);

    int update(Medicine medicine);
}
