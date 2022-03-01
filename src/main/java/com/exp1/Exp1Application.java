package com.exp1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
/*
 * 프로젝트가 생성될 때 appliction.properties 파일이 자동 생성되었으나 빈파일로 되어있을 것인데, 여기에 사용자가 원하는
 * DB 설정을 넣고, 맞는 드라이버와 라이브러리 설치, JDBC 설정을 해야한다는 의미다
 */
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@ComponentScan(basePackages = {"MainController"})
public class Exp1Application {

	public static void main(String[] args) {
		SpringApplication.run(Exp1Application.class, args);
	}
	

}
