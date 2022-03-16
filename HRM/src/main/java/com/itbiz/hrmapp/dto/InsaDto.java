package com.itbiz.hrmapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class InsaDto {
	
	private int sabun;
	private String name;
	private String eng_name;
	private String id;
	private String pwd;
	private String pwd_check;
	private String phone;
	private String hp;
	private String reg_no;
	private int years;
	private String email;
	private String join_gbn_code;
	private String sex;
	private int zip;
	private String addr1;
	private String addr2;
	private String pos_gbn_code;
	private String dept_code;
	private int salary;
	private String join_type;
	private String gart_level;
	private String put_yn;
	private String mil_yn;
	private String mil_type;
	private String mil_level;
	private String mil_startdate;
	private String mil_enddate;
	private String kosa_reg_yn;
	private String kosa_class_code;
	private String join_day;
	private String retire_day;
	private String cmp_reg_no;
	private String crm_name;
	private String cmp_reg_image;
	private String self_intro;
	private String carrier;
	private String carrier_image;
	private String profile_image;
	
	private int last_number;
	private int page;
	private int beginRecord;
	private int endRecord;

}
