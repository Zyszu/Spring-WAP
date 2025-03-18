package pl.dmcs.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.dmcs.domain.Address;

public class AddressValidator implements Validator {

    private static final String ZIPCODE_REGEX = "\\d{2}-\\d{3}";


    @Override
    public boolean supports(Class<?> clazz) {
        return Address.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Address address = (Address) target;

        // Validate required fields
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "country", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "state", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "zipcode", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "street", "error.field.required");

        // If no errors so far, proceed with additional validations
        if (errors.getErrorCount() == 0) {
            // Validate zip code format
            if (!address.getZipcode().matches(ZIPCODE_REGEX)) {
                errors.rejectValue("zipcode", "error.zipcode.invalid");
            }
        }
    }
}
