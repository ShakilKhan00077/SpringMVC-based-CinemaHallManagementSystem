package cineplex.controller;

import cineplex.domain.Customer;
import cineplex.service.CustomerService;
import cineplex.service.ProductService;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import java.beans.PropertyEditorSupport;

@Controller
@RequestMapping("/")
public class HomeController {
    private ProductService productService;
    private CustomerService customerService;
    public HomeController(ProductService productService, CustomerService customerService) {
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
    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("products", productService.list());
        return "index";
    }
}
