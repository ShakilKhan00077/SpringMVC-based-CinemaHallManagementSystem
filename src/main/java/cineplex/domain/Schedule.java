package cineplex.domain;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
@Table(name = "schedule")
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "date")
    private LocalDate date;

    @Column(name = "stime")
    private LocalTime stime;

    @Column(name = "etime")
    private LocalTime etime;
    @Column(name = "seat")
    private int seat;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    public List<Seat> getSeats() {
        return seats;
    }

    public void setSeats(List<Seat> seats) {
        this.seats = seats;
    }

    @OneToMany(mappedBy = "schedule", fetch = FetchType.EAGER)
    private List<Seat> seats;




    public Schedule() {}

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getStime() {
        return stime;
    }

    public void setStime(LocalTime stime) {
        this.stime = stime;
    }

    public LocalTime getEtime() {
        return etime;
    }

    public void setEtime(LocalTime etime) {
        this.etime = etime;
    }



    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
