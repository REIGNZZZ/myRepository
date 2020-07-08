package com.reignzzz.mavenssm.dao;

import com.reignzzz.mavenssm.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface RoleDao {

    Set<String> getRolesByUid(@Param(value = "uid")Long uid);

    List<Long> getRoleIdsByUid(@Param(value = "uid")Long uid);
}
