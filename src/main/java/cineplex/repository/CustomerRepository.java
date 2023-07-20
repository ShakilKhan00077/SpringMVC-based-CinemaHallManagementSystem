package cineplex.repository;

import cineplex.domain.Customer;
import cineplex.domain.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class CustomerRepository {
    private SessionFactory sessionFactory;

    public CustomerRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Customer> list() {
        Session session = sessionFactory.getCurrentSession();
        TypedQuery<Customer> departmentQuery = session.createQuery("from Customer", Customer.class);
        return departmentQuery.getResultList();
    }

    public boolean create(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(customer);
        return true;
    }

    public Customer get(Long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Customer.class, id);
    }

    public boolean update(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        session.update(customer);
        return true;
    }

    public boolean delete(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(customer);
        return true;
    }
    public User get(String username) {
        Session session = sessionFactory.getCurrentSession();
        TypedQuery<User> userQuery = session.createQuery("from User Where username = :username", User.class);
        userQuery.setParameter("username", username);
        return userQuery.getSingleResult();
    }
}
