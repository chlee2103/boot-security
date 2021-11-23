package com.ex.boot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {


    @Override // css, js 찾기
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("resources/**").addResourceLocations("classpath:/static/").setCachePeriod(60 * 60 * 24 * 365);
    }


    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry
                .addMapping("/**")
                .allowedOrigins("http://localhost:8090")
                .allowedMethods("*")
                .allowedHeaders("Content-Type"
                        , "X-AUTH-TOKEN"
                        , "Authorization"
                        , "Access-Control-Allow-Origin"
                        , "Access-Control-Allow-Credentials")
                .exposedHeaders("Content-Disposition"
                        , "X-AUTH-TOKEN"
                        , "Authorization"
                        , "Access-Control-Allow-Origin"
                        , "Access-Control-Allow-Credentials")
                .allowCredentials(false).maxAge(3600);
    }
}
