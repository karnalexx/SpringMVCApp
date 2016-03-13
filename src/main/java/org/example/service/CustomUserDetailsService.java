package org.example.service;

import org.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Set;

@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            org.example.domain.User domainUser = userRepository.findByUsername(username);

            Set<SimpleGrantedAuthority> roles = Collections.singleton(new SimpleGrantedAuthority(domainUser.getRole().getRole()));

            return new User(
                    domainUser.getUsername(),
                    domainUser.getPassword(),
                    true,
                    true,
                    true,
                    true,
                    roles);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
