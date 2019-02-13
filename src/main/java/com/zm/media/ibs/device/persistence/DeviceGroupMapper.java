package com.zm.media.ibs.device.persistence;

import com.zm.media.ibs.device.entity.DeviceGroup;
import com.zm.media.ibs.device.entity.DeviceGroupExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeviceGroupMapper {
    int countByExample(DeviceGroupExample example);

    int deleteByExample(DeviceGroupExample example);

    int deleteByPrimaryKey(Long id);

    int insert(DeviceGroup record);

    int insertSelective(DeviceGroup record);

    List<DeviceGroup> selectByExample(DeviceGroupExample example);

    DeviceGroup selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") DeviceGroup record, @Param("example") DeviceGroupExample example);

    int updateByExample(@Param("record") DeviceGroup record, @Param("example") DeviceGroupExample example);

    int updateByPrimaryKeySelective(DeviceGroup record);

    int updateByPrimaryKey(DeviceGroup record);
}