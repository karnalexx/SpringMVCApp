package org.example.formatter;

import org.example.domain.Role;
import org.example.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.Locale;

@Component
public class RoleFormatter implements Formatter<Role> {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public Role parse(String roleId, Locale locale) throws ParseException {
        return roleRepository.findOne(Long.valueOf(roleId));
    }

    @Override
    public String print(Role role, Locale locale) {
        return role.getRole();
    }
}
