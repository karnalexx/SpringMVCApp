package org.example.controller;

import org.example.domain.Role;
import org.example.domain.User;
import org.example.repository.RoleRepository;
import org.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping
public class AccessController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping("/login")
    public String login(Model model, @RequestParam(required = false) String message) {
        model.addAttribute("message", message);
        return "access/login";
    }

    @RequestMapping("/denied")
    public String denied() {
        return "access/denied";
    }

    @RequestMapping("/login/failure")
    public String loginFailure() {
        String message = "Login Failure!";
        return "redirect:/login?message=" + message;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model, @RequestParam(required = false) String message) {
        model.addAttribute("user", new User());
        return "access/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST, headers = {}, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public
    @ResponseBody
    AjaxResponse registerNewUser(@RequestBody User user) {
        User oldUser = userRepository.findByUsername(user.getUsername());
        AjaxResponse ajaxResponse = new AjaxResponse();
        if (oldUser != null) {
            ajaxResponse.setStatus("ERROR");
            ajaxResponse.setDescription("User already exists!");
            return ajaxResponse;
        }
        user.setRole(null);
        userRepository.save(user);
        Role role = roleRepository.findByRole("ROLE_USER");
        role.addUser(user);
        roleRepository.save(role);
        ajaxResponse.setStatus("OK");
        return ajaxResponse;
    }

    @RequestMapping("/logout/success")
    public String logoutSuccess() {
        return "redirect:/login";
    }
}