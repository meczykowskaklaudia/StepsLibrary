package pl.meczykowska.stepslibrary.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.meczykowska.stepslibrary.domain.Role;
import pl.meczykowska.stepslibrary.domain.User;
import pl.meczykowska.stepslibrary.repositories.IRoleRepository;
import pl.meczykowska.stepslibrary.repositories.IUserRepository;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private IUserRepository repository;

    @Autowired
    private IRoleRepository roleRepository;

    public void registerUser(User user) {
        Role role = roleRepository.findByName("ROLE_USER");
        user.grantRole(role);
        role.addUser(user);
        repository.save(user);
    }

    @Override
    public User loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = repository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Non existing user!");
        }
        return user;
    }

    public void deleteUser(String username) {
        repository.deleteUserByUsername(username);
    }

    public boolean isUsernameAvailable(String username) {
        User user = repository.findByUsername(username);
        return user == null;
    }
}
