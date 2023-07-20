package cineplex.controller;

import com.mashape.unirest.http.exceptions.UnirestException;
import cineplex.domain.*;
import cineplex.service.*;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.beans.PropertyEditorSupport;
import java.sql.Date;
import java.sql.SQLException;

@Controller
@RequestMapping("/products")
public class ProductController {

    private ProductService productService;

    private CustomerService customerService;

    private UserService userService;
    private ScheduleService scheduleService;


    public ProductController(ProductService productService, CustomerService customerService) {
        this.productService = productService;
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
        model.addAttribute("products", productService.list());
        return "product/list";
    }




    @RequestMapping("/order_create")
    public String order_create(@RequestParam("productId") Long productId, @RequestParam("scheduledate") Date scheduledate, Model model) {
        model.addAttribute("products", productService.get(productId));
        model.addAttribute("scheduledate", scheduledate);
        Product product=productService.get(productId);
        model.addAttribute("product", new Product());
        model.addAttribute("customers", customerService.list());
        model.addAttribute("seatType", new Seat());
        return "order/create";
    }



    @RequestMapping("/edit")
    public String edit(@RequestParam("productId") Long productId, Model model) {
        model.addAttribute("product", productService.get(productId));
        return "product/edit";
    }

    @RequestMapping("/update")
    public String update(@Valid @ModelAttribute("product") Product product, BindingResult bindingResult) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "product/edit";
        }
        productService.update(product);
        return "redirect:/products/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("productId") Long productId) {
        productService.delete(productId);
        return "redirect:/products/list";
    }
    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("movieForm", new Product());
        return "product/create";
    }

    @PostMapping("/store")
    public String create(@ModelAttribute("movieForm") @Valid Product product, BindingResult result) throws UnirestException {
        if (result.hasErrors()) {
            return "product/create";
        }

        productService.create(product);
        return "redirect:/products/list";
    }


}
