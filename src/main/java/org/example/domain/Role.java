package org.example.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Role {

    @Id
    @GeneratedValue
    private Long id;

    @OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name="user_role",
            joinColumns = {@JoinColumn(name="role_id", referencedColumnName="id")},
            inverseJoinColumns = {@JoinColumn(name="user_id", referencedColumnName="id")}
    )
    private Set<User> users;

    private String role;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> userRoles) {
        this.users = userRoles;
    }

    public void addUser(User user) {
        this.users.add(user);
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
