package cineplex.service;

import cineplex.domain.Schedule;
import cineplex.repository.ScheduleRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.logging.Logger;

@Service
@Transactional
public class ScheduleService {
    private Logger logger = Logger.getLogger(ScheduleService.class.getName());

    private ScheduleRepository scheduleRepository;

    public ScheduleService(ScheduleRepository scheduleRepository) {
        this.scheduleRepository = scheduleRepository;
    }

    public List<Schedule> list() {
        return scheduleRepository.list();
    }

    public Schedule get(Long id) {
        return scheduleRepository.get(id);
    }

    public boolean create(Schedule schedule) {
        schedule.setSeat(100);
        return scheduleRepository.create(schedule);
    }

    public boolean update(Schedule schedule) {
        return scheduleRepository.update(schedule);
    }

    public boolean delete(Long id) {
        return scheduleRepository.delete(get(id));
    }
}
