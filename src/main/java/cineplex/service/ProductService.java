package cineplex.service;

import com.mashape.unirest.http.exceptions.UnirestException;

import cineplex.domain.Product;
import cineplex.repository.ProductRepository;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;


import java.net.HttpURLConnection;
import java.net.URL;

import java.util.List;
import java.util.Scanner;
import java.util.logging.Logger;


@Service
@Transactional
public class ProductService {

    private Logger logger = Logger.getLogger(ProductService.class.getName());

    private ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> list() {
        return productRepository.list();
    }

    public Product get(Long id) {
        return productRepository.get(id);
    }

    public boolean create(Product product) throws UnirestException {
        try
        {
            URL url = new URL("https://www.omdbapi.com/?i="+product.getLink()+"&apikey=31d513d7");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            int responseCode = conn.getResponseCode();
            if (responseCode != 200) {
                throw new RuntimeException("Failed to read JSON from URL: " + responseCode);
            }
            System.out.println(url);

            Scanner scanner = new Scanner(url.openStream());
            StringBuilder jsonBuilder = new StringBuilder();
            while (scanner.hasNext()) {
                jsonBuilder.append(scanner.nextLine());
            }
            scanner.close();
            conn.disconnect();

            String jsonString = jsonBuilder.toString();
            JSONObject object = new JSONObject(jsonString);

            product.setPoster(object.getString("Poster"));
            product.setTitle(object.getString("Title"));
            product.setRated(object.getString("Rated"));
            product.setRuntime(object.getString("Runtime"));
            product.setDirector(object.getString("Director"));
            product.setReleased(object.getString("Released"));



        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return productRepository.create(product);
    }

    public boolean update(Product product) {
        return productRepository.update(product);
    }

    public boolean delete(Long id) {
        return productRepository.delete(get(id));
    }
}
