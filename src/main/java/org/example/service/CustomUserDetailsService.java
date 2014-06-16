package org.example.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            org.example.domain.User domainUser = userRepository.findByUsername(username);

            boolean enabled = true;
            boolean accountNonExpired = true;
            boolean credentialsNonExpired = true;
            boolean accountNonLocked = true;

            return new User(
                    domainUser.getUsername(),
                    domainUser.getPassword().toLowerCase(),
                    enabled,
                    accountNonExpired,
                    credentialsNonExpired,
                    accountNonLocked,
                    getAuthorities(domainUser.getRole().getId()));

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Collection<? extends GrantedAuthority> getAuthorities(Long roleId) {
        return getGrantedAuthorities(getRoles(roleId));
    }

    public List<String> getRoles(Long roleId) {
        List<String> roles = new ArrayList<String>();

        if (roleId == 1) {
            roles.add("ROLE_USER");
            roles.add("ROLE_ADMIN");
            roles.add("ROLE_MANAGER");

        } else if (roleId == 2) {
            roles.add("ROLE_MANAGER");
            roles.add("ROLE_USER");
        } else if (roleId == 3) {
            roles.add("ROLE_USER");
        }

        return roles;
    }

    public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }
}
