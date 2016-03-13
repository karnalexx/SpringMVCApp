package org.example.controller;

import org.example.domain.Role;
import org.example.domain.User;
import org.example.repository.RoleRepository;
import org.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping
    public ModelAndView listUsers() {
        ModelAndView modelAndView = new ModelAndView("admin");

        List<User> users = userRepository.findAll();
        modelAndView.addObject("users", users);
        return modelAndView;
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public ModelAndView addUser() {
        ModelAndView modelAndView = new ModelAndView("editUser");
        modelAndView.addObject("user", new User());
        modelAndView.addObject("roles", roleRepository.findAll());
        return modelAndView;
    }

    @RequestMapping(value = "/editUser/{id}", method = RequestMethod.GET)
    public ModelAndView editUser(@PathVariable Long id) {
        User user = userRepository.findOne(id);
        ModelAndView modelAndView = new ModelAndView("editUser");
        modelAndView.addObject("user", user);
        modelAndView.addObject("selectedRoleId", user.getRole().getId());
        modelAndView.addObject("roles", roleRepository.findAll());
        return modelAndView;
    }

    @RequestMapping(value = "/editUser/{id}", method = RequestMethod.POST)
    public String editUser(@ModelAttribute User user, @PathVariable Long id, RedirectAttributes redirectAttributes) {
        userRepository.save(user);
        redirectAttributes.addFlashAttribute("message", "User was successfully saved.");
        return "redirect:/admin";
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    public String editUser(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        Role userRole = roleRepository.findOne(user.getRole().getId());
        user.setRole(null);
        userRepository.save(user);
        userRole.addUser(user);
        roleRepository.save(userRole);
        redirectAttributes.addFlashAttribute("message", "User was successfully added.");
        return "redirect:/admin";
    }

    @RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.DELETE)
    public
    @ResponseBody
    String deleteUser(@ModelAttribute User user, @PathVariable Long id) {
        userRepository.delete(id);
        return "success";
    }

}
