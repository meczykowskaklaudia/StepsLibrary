package pl.meczykowska.stepslibrary.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
import javax.transaction.Transactional;
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
                        @RequestParam(value = "deleted", required = false) String deleted,
                        @RequestParam(value = "registered", required = false) String registered,
                        Model model) {
        String message = null;
        if (error != null || required != null) {
            if (error != null) {
                message = "Username or password is incorrect!";
            }
            if (required != null) {
                message = "You have to login first!";
            }
            model.addAttribute("errorMessage", message);
        }
        if (logout != null || deleted != null || registered != null) {
            if (logout != null) {
                message = "You have been successfully logged out!";
            }
            if (deleted != null) {
                message = "Account deleted!";
            }
            if (registered != null) {
                message = "Account created!";
            }
            model.addAttribute("successMessage", message);
        }
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

    @Transactional
    @RequestMapping(value = "/deleteAccount")
    public String deleteAccount(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            String username = ((UserDetails) auth.getPrincipal()).getUsername();
            new SecurityContextLogoutHandler().logout(request, response, auth);
            userService.deleteUser(username);
        }
        return "redirect:/login?deleted=true";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerForm() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(@ModelAttribute("userDto") @Valid UserDTO userDto, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "register";
        } else {
            if (userService.isUsernameAvailable(userDto.getUsername())) {
                User user = new User(userDto.getUsername(), userDto.getPassword(), true);
                userService.registerUser(user);
            } else {
                model.addAttribute("message", "Username already taken!");
                return "register";
            }
            return "redirect:/login?registered=true";
        }
    }

    @RequestMapping("/")
    public String home() {
        return "redirect:/library";
    }
}
