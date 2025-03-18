package pl.dmcs.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;

    @NotNull
    @Size(min = 2, max = 100)
    private String country;

    @NotNull
    @Size(min = 2, max = 100)
    private String state;

    @NotNull
    @Size(min = 2, max = 100)
    private String zipcode;

    @NotNull
    @Size(min = 2, max = 100)
    private String city;

    @NotNull
    @Size(min = 2, max = 100)
    private String street;

    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getZipcode() { return zipcode; }
    public void setZipcode(String zipcode) { this.zipcode = zipcode; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getStreet() { return street; }
    public void setStreet(String street) { this.street = street; }

}
