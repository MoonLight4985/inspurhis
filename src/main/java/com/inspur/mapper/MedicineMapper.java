package com.inspur.mapper;

import com.inspur.entity.Medicine;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MedicineMapper {
    List<Medicine> findMedicineByCondition(Medicine medicine);

    @Insert("insert into medicine (id, name, purchase_price, price, number, product_unit, product_date, quality_period, supply_unit, introduce_date) values (#{id}, #{name}, #{purchasePrice}, #{price}, #{number}, #{productUnit}, #{productDate}, #{qualityPeriod}, #{supplyUnit}, #{introduceDate    })")
    int save(Medicine medicine);

    int update(Medicine medicine);

    @Delete("delete from medicine where id = #{id}")
    boolean deleteByMedicineId(String id);
}
