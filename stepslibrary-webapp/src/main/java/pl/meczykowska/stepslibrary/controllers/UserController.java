package pl.meczykowska.stepslibrary.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.meczykowska.stepslibrary.domain.User;
import pl.meczykowska.stepslibrary.dto.UserDTO;
import pl.meczykowska.stepslibrary.services.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

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
                        @RequestParam(value = "required", required = false) String required,
                        Model model) {
        String message = null;
        if (error != null) {
            message = "Username or Password is incorrect!";
        }
        if (logout != null) {
            message = "You have been successfully logged out!";
        }
        if (required != null) {
            message = "You have to login first!";
        }
        model.addAttribute("message", message);
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout=true";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerForm() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(@ModelAttribute("userDto") @Valid UserDTO userDto, BindingResult result) {
        if (result.hasErrors()) {
            return "register";
        } else {
            User user = new User(userDto.getUsername(), userDto.getPassword(), true);
            userService.registerUser(user);
            return "redirect:/login";
        }
    }

    @RequestMapping("/")
    public String home() {
        return "redirect:/library";
    }
}
