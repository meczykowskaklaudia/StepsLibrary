package pl.meczykowska.stepslibrary.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.meczykowska.stepslibrary.UserService;
import pl.meczykowska.stepslibrary.dto.UserDTO;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @ModelAttribute("userDto")
    public UserDTO createUserDTO() {
        return new UserDTO();
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout,
                        Model model) {
        String message = null;
        if (error != null) {
            message = "Username or Password is incorrect!";
        }
        if (logout != null) {
            message = "You have been successfully logged out!";
        }
        model.addAttribute("message", message);
        return "login";
    }
}
