package com.itbiz.hrmapp.dao;

import java.util.List;

import com.itbiz.hrmapp.dto.InsaDto;

public interface InsaDao {
	
	public void insaInput(String name, String eng_name, String id, String pwd, String phone, String hp, String reg_no, String years, String email,
			String join_gbn_code, String sex, String zip, String addr1, String addr2, String pos_gbn_code, String dept_code, String salary, String join_type,
			String gart_level, String put_yn, String mil_yn, String mil_type, String mil_level, String mil_startdate, String mil_enddate,
			String kosa_reg_yn, String kosa_class_code, String join_day, String retire_day, String cmp_reg_no, String crm_name, String cmp_reg_image,
			String self_intro, String carrier, String profile_image);
	public InsaDto login(int sabun, String pwd);
	public InsaDto idCheck(String id);
	public InsaDto emailCheck(String id, String email);
	public int sabun();
	public int insaUpdate(String sabun, String name, String eng_name, String phone, String hp, String reg_no, String years, String email, String join_gbn_code, String sex, 
			String zip, String addr1, String addr2, String pos_gbn_code, String dept_code, String salary, String join_type, String gart_level, String put_yn, 
			String mil_yn, String mil_type, String mil_level, String mil_startdate, String mil_enddate, String kosa_reg_yn, String kosa_class_code, 
			String join_day, String retire_day, String cmp_reg_no, String crm_name, String cmp_reg_image, String self_intro, String carrier, String profile_image);
	public int insaDelete(int sabun);
	public InsaDto insaProfile(int sabun);
	public List<InsaDto> insaList(InsaDto insaDto);
	public int pageCount(InsaDto insaDto);

}
