package cineplex.service;

import cineplex.domain.Customer;
import cineplex.domain.User;
import cineplex.repository.CustomerRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.logging.Logger;

@Service
@Transactional
public class CustomerService {

    private Logger logger = Logger.getLogger(CustomerService.class.getName());

    private CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public List<Customer> list() {
        return customerRepository.list();
    }

    public Customer get(Long id) {
        return customerRepository.get(id);
    }

    public boolean create(Customer customer) {
        return customerRepository.create(customer);
    }

    public boolean update(Customer customer) {
        return customerRepository.update(customer);
    }

    public boolean delete(Long id) {
        return customerRepository.delete(get(id));
    }
    public User get(String username) { return customerRepository.get(username); }
}
