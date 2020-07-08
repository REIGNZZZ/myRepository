package com.reignzzz.mavenssm.shiro;

import com.reignzzz.mavenssm.dao.PermissionDao;
import com.reignzzz.mavenssm.entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class FilterChainDefinitionMapFactory {

    @Autowired
    private PermissionDao permissionDao;

    public Map<String,String> getFilterChainDefinitionMap(){
        Map<String, String> map = new LinkedHashMap<String, String>();
        List<Permission> permissions = permissionDao.getPermissions();
        for (Permission p:permissions
             ) {
            map.put(p.getUrl(), p.getCode());
        }
        return map;
    }

}
