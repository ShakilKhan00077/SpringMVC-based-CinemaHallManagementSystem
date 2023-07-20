package cineplex.service;

import cineplex.domain.Seat;
import cineplex.repository.SeatRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.logging.Logger;

@Service
@Transactional
public class SeatService {
    private Logger logger = Logger.getLogger(AddressService.class.getName());

    private SeatRepository seatRepository;

    public SeatService(SeatRepository seatRepository) {
        this.seatRepository = seatRepository;
    }

    public List<Seat> list() {
        return seatRepository.list();
    }

    public Seat get(Long id) {
        return seatRepository.get(id);
    }

    public boolean create(Seat seat) {
        return seatRepository.create(seat);
    }

    public boolean update(Seat seat) {
        return seatRepository.update(seat);
    }

    public boolean delete(Long id) {
        return seatRepository.delete(get(id));
    }
}
