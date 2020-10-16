package pl.meczykowska.stepslibrary.domain;

import javax.persistence.*;
import java.util.List;

@Entity
public class User {

    @Id
    private int id;
    private String username;
    private String password;
    private boolean enabled;
    @ManyToMany
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(
                    name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "role_id", referencedColumnName = "id"))
    private List<Role> roles;

}
