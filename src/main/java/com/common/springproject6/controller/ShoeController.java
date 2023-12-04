package com.common.springproject6.controller;

import com.common.springproject6.service.ShoeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ShoeController {
        private final ShoeService shoeService;

    @Autowired
    public ShoeController(ShoeService shoeService) {
        this.shoeService = shoeService;
    }

    @RequestMapping(value = "/menu/list", method = RequestMethod.GET)
    public String MenuList(Model model) {
        model.addAttribute("list", shoeService.infoSimpleList().getSimpleInfoList());
        return "posts";
    }

    @RequestMapping(value = "/menu/add", method = RequestMethod.GET)
    public String addMenu() {
        return "add";
    }

    @RequestMapping(value = "/menu/addok", method = RequestMethod.POST)
    public String addMenuOk(HttpServletRequest request) {
        int i = shoeService.insertMenu(request);
        if (i == 0)
            System.out.println("Failed to add data");
        else
            System.out.println("Data successfully added!");
        return "redirect:list";
    }

    @RequestMapping(value = "/menu/view/{id}", method = RequestMethod.GET)
    public String menuView(Model model,@PathVariable("id") int id) {
        model.addAttribute("p", shoeService.info(id).getInfo());
        return "view";
    }

    @RequestMapping(value = "/menu/edit/{id}", method = RequestMethod.GET)
    public String editMenu(Model model,@PathVariable("id") int id) {
        model.addAttribute("p", shoeService.getVo(id));
        return "edit";
    }

    @RequestMapping(value = "/menu/editok/{id}", method = RequestMethod.POST)
    public String editPlayerOk(HttpServletRequest request,@PathVariable("id") String id){
        int i = shoeService.editMenu(request);
        if (i == 0)
            System.out.println("Failed to edit data");
        else
            System.out.println("Data successfully edited!");
        return "redirect:../view/" + id;
    }

    @RequestMapping(value = "/menu/delete/{id}", method = RequestMethod.GET)
    public String deleteMenu(HttpServletRequest request,@PathVariable("id") int id) {
        int i = shoeService.deleteMenu(request,id);
        if (i == 0)
            System.out.println("Failed to delete data");
        else
            System.out.println("Data deleted successfully!");
        return "redirect:../list";
    }
}
