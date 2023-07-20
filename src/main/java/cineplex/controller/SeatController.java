package cineplex.controller;

import cineplex.domain.Customer;
import cineplex.domain.Seat;
import cineplex.service.CustomerService;
import cineplex.service.SeatService;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.beans.PropertyEditorSupport;
import java.sql.SQLException;

@Controller
@RequestMapping("/seats")
public class SeatController {
    private CustomerService customerService;
    private SeatService seatService;

    public SeatController(SeatService seatService, CustomerService customerService) {
        this.seatService = seatService;
        this.customerService = customerService;
    }

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);

        webDataBinder.registerCustomEditor(Customer.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException
            {
                Customer customer = customerService.get(Long.parseLong(text));
                setValue(customer);
            }
        });
    }

    @RequestMapping("/list")
    public String list(Model model) {
        model.addAttribute("seats", seatService.list());
        return "seat/list";
    }

    @RequestMapping("/create")
    public String create(Model model) {
        /*List<Customer> customers = customerService.list();*/
        model.addAttribute("seat", new Seat());
        model.addAttribute("customers", customerService.list());
        return "seat/create";
    }

    @RequestMapping("/store")
    public String store(@Valid @ModelAttribute("seat") Seat seat, BindingResult bindingResult) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "seat/create";
        }
        seatService.create(seat);
        return "redirect:/seats/list";
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam("seatId") Long seatId, Model model) {
        model.addAttribute("seat", seatService.get(seatId));
        return "seat/edit";
    }

    @RequestMapping("/update")
    public String update(@Valid @ModelAttribute("seat") Seat seat, BindingResult bindingResult) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "seat/edit";
        }
        seatService.update(seat);
        return "redirect:/seats/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("seatId") Long seatId) {
        seatService.delete(seatId);
        return "redirect:/seats/list";
    }

}
