package pl.meczykowska.stepslibrary;


import org.springframework.stereotype.Repository;
import pl.meczykowska.stepslibrary.domain.User;

@Repository
public interface IUserRepository {
    User save(User user);

}
