package pl.meczykowska.stepslibrary.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import java.util.List;

@Entity
public class Privilege {
    @Id
    private int id;
    private String name;

    @ManyToMany(mappedBy = "privileges")
    private List<Role> roles;

}
