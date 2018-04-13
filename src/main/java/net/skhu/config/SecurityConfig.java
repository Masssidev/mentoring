package net.skhu.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import net.skhu.service.MyAuthenticationProvider;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired MyAuthenticationProvider myAuthenticationProvider;

    @Override
    public void configure(WebSecurity web) throws Exception
    {
    	web.ignoring().antMatchers("/index.jsp");
        web.ignoring().antMatchers("/css/**");
        web.ignoring().antMatchers("/fonts/**");
        web.ignoring().antMatchers("/images/**");
        web.ignoring().antMatchers("/js/**");
        web.ignoring().antMatchers("/sass/**");
        web.ignoring().antMatchers("/WEB-INF/include/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception
    {
    	http.authorizeRequests()
	    	.antMatchers("/manager/**").hasRole("MANAGER")
	    	.antMatchers("/mentor/**").hasRole("MENTOR")
	    	.antMatchers("/mentee/**").hasRole("MENTEE")
        	.antMatchers("/user/**").authenticated()
        	.antMatchers("/guest/**").permitAll()
        	.antMatchers("/").permitAll()
        	.antMatchers("/**").authenticated()
        	.and()
            .exceptionHandling().accessDeniedPage("/accessDenied.jsp");;

        http.csrf().disable();

        http.formLogin()
            .loginPage("/guest/login")
            .loginProcessingUrl("/guest/login_processing")
            .failureUrl("/guest/login?error")
            .defaultSuccessUrl("/guest/main", true)
            .usernameParameter("user_id")
            .passwordParameter("pw");

        http.logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/user/logout_processing"))
            .logoutSuccessUrl("/guest/login")
            .invalidateHttpSession(true);

        http.authenticationProvider(myAuthenticationProvider);

        http.headers().frameOptions().sameOrigin();
    }

}
