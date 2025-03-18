package pl.dmcs.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.dmcs.domain.Address;
import pl.dmcs.service.AddressService;

@Controller
public class AddressController {

    private AddressService addressService;
    @Autowired
    public AddressController(AddressService addressService) { this.addressService = addressService; }

    @RequestMapping(value = "/addresses")
    public String showAddress(Model model, HttpServletRequest request) {
        long addressId = ServletRequestUtils.getIntParameter(request, "addressId", -1);

        if (addressId > 0) {
            model.addAttribute("address", addressService.getAddress(addressId));
        }
        else {
            model.addAttribute("address", new Address());
        }
        model.addAttribute("addressList", addressService.listAddress());
        return "address";
    }

    @RequestMapping(value = "/addAddress", method = RequestMethod.POST)
    public String addAddress(@Valid @ModelAttribute("address") Address address, BindingResult result, Model model) {
        System.out.println(
                "Country: " + address.getCountry()
                        + ", State: " + address.getState()
                        + ", City: " + address.getCity()
                        + ", Zip code: " + address.getZipcode()
                        + ", Street: " + address.getStreet()
        );


        if(!result.hasErrors()) {
            if (address.getId() == 0) {
                addressService.addAddress(address);
            }
            else {
                addressService.editAddress(address);
            }
            return "redirect:addresses";
        }

        model.addAttribute("addressList", addressService.listAddress());
        return "address";
    }

    @RequestMapping("/deleteAddress/{addressId}")
    public String deleteAddress(@PathVariable("addressId") Long addressId) {
        addressService.removeAddress(addressId);
        return "redirect:addresses";
    }

}
