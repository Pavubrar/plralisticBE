package com.comit.pluralistic.security.config;


import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@Configuration
@AllArgsConstructor
@EnableWebSecurity
public class WebSecurityConfig extends Websecurity{


    @Override
    protected void configure(HttpSecurity http) throws Exception{
    super.configure((http));
}
}
