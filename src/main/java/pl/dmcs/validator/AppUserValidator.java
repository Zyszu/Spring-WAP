package pl.dmcs.validator;

import org.hibernate.validator.internal.constraintvalidators.bv.EmailValidator;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.dmcs.domain.AppUser;

public class AppUserValidator implements Validator {

    private static final String TELEPHONE_REGEX = "^\\+\\d{2}-\\d{3}-\\d{3}-\\d{3}$";
    private final EmailValidator emailValidator = new EmailValidator();

    @Override
    public boolean supports(Class<?> clazz) {
        return AppUser.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        AppUser appUser = (AppUser) target;

        // Validate required fields
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telephone", "error.field.required");

        // If no errors so far, proceed with additional validations
        if (errors.getErrorCount() == 0) {
            // Validate email format
            if (!emailValidator.isValid(appUser.getEmail(), null)) {
                errors.rejectValue("email", "error.email.invalid");
            }

            // Validate telephone number format using regex
            if (!appUser.getTelephone().matches(TELEPHONE_REGEX)) {
                errors.rejectValue("telephone", "error.telephone.invalid");
            }
        }
    }
}