package com.reignzzz.mavenssm.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface PermissionDao {
    Set<String> getCodesByRoleIds(@Param(value = "roleIds") List<Long> roleIds);
}
