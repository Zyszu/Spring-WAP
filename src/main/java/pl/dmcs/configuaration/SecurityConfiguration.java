package pl.dmcs.configuaration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfiguration {

    @Bean
    public InMemoryUserDetailsManager userDetailsService() {
        UserDetails user = User.withDefaultPasswordEncoder()
                .username("user")
                .password("user")
                .roles("USER")
                .build();
        UserDetails admin = User.withDefaultPasswordEncoder()
                .username("admin")
                .password("admin")
                .roles("ADMIN","USER")
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
                .authorizeHttpRequests((authz) -> authz
                        .requestMatchers("/appUsers*").hasRole("ADMIN")
                        .requestMatchers("/exampleOne*").hasAuthority("ROLE_USER")
                        .requestMatchers("/exampleTwo*").hasAnyAuthority("ROLE_STUDENT", "ROLE_ADMIN")
                        .requestMatchers("/exampleThree*").hasRole("STUDENT")
                        .requestMatchers("/login*").anonymous()
                        .anyRequest().authenticated()
                )
                // login with default login page
                //  .formLogin(form -> form
                //          .permitAll()
                //          )
                // login with custom login page
                .formLogin(form -> form
                        .loginPage("/login")
                        .usernameParameter("login")
                        .passwordParameter("password")
                        .failureUrl("/login?error")
                        .defaultSuccessUrl("/",true) //use wisely
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutSuccessUrl("/login?logout")
                )
                .exceptionHandling(logout -> logout
                        .accessDeniedPage("/accessDenied")
                )
                .httpBasic();
        return http.build();
    }

}













