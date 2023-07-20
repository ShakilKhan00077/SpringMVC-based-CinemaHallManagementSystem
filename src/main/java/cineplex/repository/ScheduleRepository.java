package cineplex.repository;

import cineplex.domain.Schedule;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class ScheduleRepository {
    private SessionFactory sessionFactory;

    public ScheduleRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Schedule> list() {
        Session session = sessionFactory.getCurrentSession();
        TypedQuery<Schedule> scheduleTypedQuery = session.createQuery("from Schedule", Schedule.class);
        return scheduleTypedQuery.getResultList();
    }

    public boolean create(Schedule schedule) {
        Session session = sessionFactory.getCurrentSession();
        session.save(schedule);
        return true;
    }

    public Schedule get(Long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Schedule.class, id);
    }

    public boolean update(Schedule schedule) {
        Session session = sessionFactory.getCurrentSession();
        session.update(schedule);
        return true;
    }

    public boolean delete(Schedule schedule) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(schedule);
        return true;
    }
}
