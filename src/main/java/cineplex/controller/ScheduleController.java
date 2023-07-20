package cineplex.controller;

import cineplex.domain.*;
import cineplex.service.*;
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
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/schedules")
public class ScheduleController {
    private ScheduleService scheduleService;

    private ProductService productService;

    private UserService userService;

    private CustomerService customerService;

    public ScheduleController(ScheduleService scheduleService, ProductService productService) {
        this.scheduleService = scheduleService;
        this.productService = productService;
    }

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);

        webDataBinder.registerCustomEditor(Product.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException
            {
                Product product = productService.get(Long.parseLong(text));
                setValue(product);
            }
        });

        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException
            {
                LocalDate localDate = LocalDate.parse(text, dateFormatter);
                setValue(localDate);
            }
        });

        DateTimeFormatter timeformatter = DateTimeFormatter.ofPattern("HH:mm");
        webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException
            {
                LocalTime localTime = LocalTime.parse(text, timeformatter);
                setValue(localTime);
            }
        });




    }


    @RequestMapping("/list")
    public String list(Model model) {
        model.addAttribute("schedules", scheduleService.list());
        return "schedule/list";
    }

    @RequestMapping("/create")
    public String create(Model model) {
        /*List<Customer> customers = customerService.list();*/
        model.addAttribute("schedule", new Schedule());
        model.addAttribute("products", productService.list());
        return "schedule/create";
    }

    @RequestMapping("/store")
    public String store(@Valid @ModelAttribute("schedule") Schedule schedule, BindingResult bindingResult) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "schedule/create";
        }
        scheduleService.create(schedule);
        return "redirect:/schedules/list";
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam("scheduleId") Long scheduleId, Model model) {
        model.addAttribute("address", scheduleService.get(scheduleId));
        return "schedule/edit";
    }

    @RequestMapping("/update")
    public String update(@Valid @ModelAttribute("schedule") Schedule schedule, BindingResult bindingResult) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "schedule/edit";
        }
        scheduleService.update(schedule);
        return "redirect:/schedules/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("scheduleId") Long scheduleId) {
        scheduleService.delete(scheduleId);
        return "redirect:/schedules/list";
    }

    @RequestMapping("/details")
    public String details(@RequestParam("productId") Long productId, Model model) {
        model.addAttribute("product", productService.get(productId));
        Product product=productService.get(productId);
        return "product/details";
    }
    @RequestMapping("/order_create")
    public String createOrder(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("customers", customerService.list());

        return "order/create";
    }

}
