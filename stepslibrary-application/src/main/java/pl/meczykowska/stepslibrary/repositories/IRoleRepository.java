package pl.meczykowska.stepslibrary.repositories;

import org.springframework.data.repository.CrudRepository;
import pl.meczykowska.stepslibrary.domain.Role;

public interface IRoleRepository extends CrudRepository<Role, Integer> {
    Role findByName(String name);
}
