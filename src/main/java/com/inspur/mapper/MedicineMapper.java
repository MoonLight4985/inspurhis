package com.inspur.mapper;

import com.inspur.entity.Medicine;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MedicineMapper {
    List<Medicine> findMedicineByCondition(Medicine medicine);

    @Insert("insert into medicine (id, name, purchase_price, price, number, product_unit, product_date, quality_period, supply_unit, introduce_date) values (#{id}, #{name}, #{purchasePrice}, #{price}, #{number}, #{productUnit}, #{productDate}, #{qualityPeriod}, #{supplyUnit}, #{introduceDate})")
    int save(Medicine medicine);

    @Update("update medicine set name=#{name}, purchase_price=#{purchasePrice}, price=#{price}, number=#{number}, product_unit=#{productUnit}, quality_period=#{qualityPeriod}, supply_unit=#{supplyUnit} where id=#{id}")
    int update(Medicine medicine);

    @Delete("delete from medicine where id = #{id}")
    boolean deleteByMedicineId(String id);

    @Select("select * from medicine where id = #{id}")
    Medicine findUsersById(String id);

    @Update("update medicine set number = number - #{num} where id = #{medicineId}")
    void sendMedicine(@Param(value = "medicineId") String medicineId, @Param(value = "num") int num);
}
