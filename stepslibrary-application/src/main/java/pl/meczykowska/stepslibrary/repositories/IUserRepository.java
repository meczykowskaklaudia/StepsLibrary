package pl.meczykowska.stepslibrary.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pl.meczykowska.stepslibrary.domain.User;

@Repository
public interface IUserRepository extends CrudRepository<User, Integer> {
    User save(User user);

    User findByUsername(String username);
}
