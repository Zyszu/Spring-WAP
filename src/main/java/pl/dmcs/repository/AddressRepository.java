package pl.dmcs.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.dmcs.domain.Address;

import java.util.List;

@Transactional
@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {

    List<Address> findByCountry(String country);
    Address findById(long id);

}
