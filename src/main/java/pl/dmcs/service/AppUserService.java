package pl.dmcs.service;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import pl.dmcs.domain.AppUser;

import java.util.List;

public interface AppUserService {

    @Secured("ROLE_ADMIN")
    public void addAppUser(AppUser appUser);

    @PreAuthorize("hasRole('ROLE_ADMIN') OR (#appUser.username == principal.username)")
    public void editAppUser(AppUser appUser);
    public List<AppUser> listAppUser();

    @Secured("ROLE_ADMIN")
    public void removeAppUser(long id);
    public AppUser getAppUser(long id);

    public AppUser getAppUserByUsername(String username);

}
