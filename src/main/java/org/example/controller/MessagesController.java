package org.example.controller;

import org.example.domain.Message;
import org.example.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/messages")
public class MessagesController {

    @Autowired
    private MessageRepository messageRepository;

    @RequestMapping
    public ModelAndView listMessages() {
        ModelAndView modelAndView = new ModelAndView("messages");

        List<Message> messages = messageRepository.findAll();
        modelAndView.addObject("messages", messages);

        return modelAndView;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    public
    @ResponseBody
    String deleteMessage(@ModelAttribute Message message, @PathVariable Long id) {
        messageRepository.delete(id);

        return "success";
    }

}
