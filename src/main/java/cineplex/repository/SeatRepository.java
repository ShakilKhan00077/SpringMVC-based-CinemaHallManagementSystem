package cineplex.repository;

import cineplex.domain.Seat;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class SeatRepository {
    private SessionFactory sessionFactory;

    public SeatRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Seat> list() {
        Session session = sessionFactory.getCurrentSession();
        TypedQuery<Seat> seatTypedQuery = session.createQuery("from Seat", Seat.class);
        return seatTypedQuery.getResultList();
    }

    public boolean create(Seat seat) {
        Session session = sessionFactory.getCurrentSession();
        session.save(seat);
        return true;
    }

    public Seat get(Long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Seat.class, id);
    }

    public boolean update(Seat seat) {
        Session session = sessionFactory.getCurrentSession();
        session.update(seat);
        return true;
    }

    public boolean delete(Seat seat) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(seat);
        return true;
    }
}
