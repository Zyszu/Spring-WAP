package pl.dmcs.configuaration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfiguration {
    @Bean
    public InMemoryUserDetailsManager inMemoryUserDetailsManager() {
        UserDetails user = User.withDefaultPasswordEncoder()
                .username("user")
                .password("user")
                .roles("USER")
                .build();
        UserDetails admin = User.withDefaultPasswordEncoder()
                .username("admin")
                .password("admin")
                .roles("ADMIN", "USER")
                .build();
        UserDetails student = User.withDefaultPasswordEncoder()
                .username("student")
                .password("student")
                .roles("STUDENT")
                .build();
        return new InMemoryUserDetailsManager(user, admin, student);
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests((requests) -> requests
                        .requestMatchers("/appUsers").hasRole("ADMIN")
                        .requestMatchers("/exampleOne").hasRole("USER")
                        .requestMatchers("/exampleTwo").hasAnyRole("USER", "ADMIN")
                        .requestMatchers("/exampleThree").hasRole("STUDENT")
                        .requestMatchers("/login*").anonymous()
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                                .loginPage("/login")
                                .usernameParameter("login")
                                .passwordParameter("password")
                                .failureUrl("/login?error=true")
                                .defaultSuccessUrl("/", true)
                                .permitAll()
                ) // Uses default login form behavior
                .logout(logout -> logout
                        .logoutUrl("/login?logout")
                )
                .exceptionHandling(logout -> logout
                        .accessDeniedPage("/accesDenied")
                )
                .httpBasic(withDefaults()); // Replaces deprecated method



        return http.build();
    }
}
