package pl.dmcs.validator;

import org.hibernate.validator.internal.constraintvalidators.bv.EmailValidator;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.dmcs.domain.AppUser;

public class AppUserValidator implements Validator {

    EmailValidator emailValidator = new EmailValidator();

    public boolean supports(Class clazz) { return AppUser.class.isAssignableFrom(clazz); }

    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error.field.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "telephone", "error.field.required");

        if (errors.getErrorCount() == 0) {
            boolean test1 = StringUtils.hasText(((AppUser)target).getFirstName());
            boolean test2 = emailValidator.isValid(((AppUser)target).getEmail(), null);
            if(test1 && !test2) {
                errors.rejectValue("email", "error.email.invalid");
            }
        }
    }
}
